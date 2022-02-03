desc "Jugar"
task :jugar => :environment do

intentos = 0

diccionario = Diccionario.where.not(definicion: nil).sample
palabra = diccionario.nombre.split('')


while true do
  
  byebug
    intentos += 1

    original = palabra.join('')

    print "Escriba una palabra de #{palabra.size} letras: "
    guarda = gets.chomp.split('')
    compara = guarda.join('')
    puts "escribio: #{guarda}, tiene #{guarda.size} letras"

    if original == compara 
      puts "\n\nFelicidades, lo lograste en #{intentos} intentos\n\n"
      break

    end

    hsh = palabra.sort.group_by{|x| x}.transform_values { |values| values.size }

    resultado = Array.new(palabra.size)

    puts
    palabra.each_with_index do |_, indice| 

      if palabra[indice] == guarda[indice] 
        palabra[indice] = nil
        guarda[indice] = nil
        resultado[indice] = true
      end

    end

    guarda.each_with_index do |_, indice| 
      if not guarda[indice].nil? 
        if palabra.include?(guarda[indice])
          resultado[indice] = false
        end
      end
    end

    puts "compara..: #{compara.split('')}"
    puts "resultado: #{resultado}"

  end
end
