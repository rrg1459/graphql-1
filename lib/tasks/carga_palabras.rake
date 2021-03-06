desc "Poblar diccionario"
task :carga => :environment do

  require 'mechanize'

  inicio = Time.now
  puts
  puts "Hora inicial: #{inicio}"

  todos = Diccionario.count

  cargados = todos - Diccionario.where(definicion: nil).size

  p_cargados = cargados * 10000 / todos
  p_cargados = p_cargados / 100.0
  p_faltan = 100 - p_cargados

  faltan = todos - cargados
 
  leidos         = Diccionario.where.not(definicion: [nil,"", "No existe en la RAE"]).size
  sin_definicion = Diccionario.where(definicion: '').size
  no_existe      = Diccionario.where(definicion: "No existe en la RAE").size

  puts "Cargados: #{cargados}  -  #{p_cargados}%"
  puts "Faltan: #{faltan}  -  #{p_faltan}%"
  puts
  puts "Leidos y con definicion: #{leidos}"
  puts "Leidos y sin definicion: #{sin_definicion}"
  puts "No existen en la RAE   : #{no_existe}"
  puts 

  contador = 0

  # palabras = Diccionario.where(definicion: nil).sample(100)
  palabras = Diccionario.where(definicion: nil).where.not(promedio: nil).order(promedio: :desc).first(100)

  palabras.each do |palabra|

    contador += 1
    
    str = "https://dle.rae.es/#{palabra.nombre}"
    pagina = URI::Parser.new
    url = pagina.escape(str)

    localhost = Net::Telnet::new("Host" => "localhost", "Port" => "9051", "Timeout" => 1, "Prompt" => /250 OK\n/)
    localhost.cmd('AUTHENTICATE "T0r.o0i9u8y7"') { |c| print c; throw "Cannot authenticate to Tor" if c != "250 OK\n" }
    localhost.cmd('signal NEWNYM') { |c| print c; throw "Cannot switch Tor to new route" if c != "250 OK\n" }
    localhost.close

    mecanizado   =  Mechanize.new
    contenido    =  mecanizado.get url
    doc =  Nokogiri::HTML(contenido.content)

    resultados = doc.at_css("div#resultados")
    resultado  = resultados.css('.j').first

    if resultado.nil?
      palabra.definicion = 'No existe en la RAE'
    else
      xx          = resultado.css('.d')
      ### <abbr class="d" title="nombre masculino">m.</abbr>
      tipo        = xx.attr('title').text ### "nombre masculino"
      abreviacion = xx.children.text ### "m."
      arreglo     = []
      resultado.css('mark').each {|xx| arreglo.push(xx.text)}
      definicion          = arreglo.join(' ')
      palabra.tipo        = tipo
      palabra.abreviacion = abreviacion
      palabra.definicion  = definicion
    end

    palabra.save
    puts "\n#{contador}.- #{palabra.nombre.capitalize}(#{palabra.promedio/100.0}%): #{palabra.definicion}\n"
    sleep(rand(5..10))

  end

  leidos         = Diccionario.where.not(definicion: [nil,"", "No existe en la RAE"]).size
  sin_definicion = Diccionario.where(definicion: '').size
  no_existe      = Diccionario.where(definicion: "No existe en la RAE").size

  puts
  puts "Leidos y con definicion: #{leidos}"
  puts "Leidos y sin definicion: #{sin_definicion}"
  puts "No existen en la RAE   : #{no_existe}"
  puts
  puts "Hora inicial: #{inicio}"
  puts "Hora final: #{Time.now}"
  puts

end
