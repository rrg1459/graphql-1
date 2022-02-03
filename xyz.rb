require 'open-uri'
require 'nokogiri'
require 'byebug'

palabras = palabra.where( definicion: nil).sample(1000)

palabras.each do |palabra|

  url        = "https://dle.rae.es/#{palabra.nombre}"
  doc        = Nokogiri.HTML(open(url))
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

end