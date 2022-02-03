require 'byebug'


# p 'hola'

intentos = 0


byebug
while true do

  intentos += 1

  palabra = 'pañal'.split('')

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


  # hsh.keys
  # hsh.values



  resultado = Array.new(palabra.size)

  # guarda = 'lazos'.split('')

  if palabra == guarda
    true
    #son iguales finaliza el prrograma
  end
puts
  palabra.each_with_index do |_, indice| 

    # byebug
    # puts letra
    # puts indice
    if palabra[indice] == guarda[indice] 
      palabra[indice] = nil
      guarda[indice] = nil
      resultado[indice] = true
    # else 
      # nil
    end

  end

  # byebug


  # puts '==1=='
  # puts "original: #{original.split('')}"
  # puts "palabra.: #{palabra}"
  # puts "guarda.: #{guarda}"
  # puts "resultado..: #{resultado}"


  guarda.each_with_index do |_, indice| 
    nil
    # byebug
    # if not guarda[indice].nil? 
    #   if palabra.include?(guarda[indice])
    #     resultado[indice] = false
    #   end
    # end

        if not guarda[indice].nil? 
      if palabra.include?(guarda[indice])
        resultado[indice] = false
      end
    end


  end



  # puts '==2=='
  # puts "original.: #{original.split('')}"
  # puts "palabra..: #{palabra}"
  puts "compara..: #{compara.split('')}"
  puts "resultado: #{resultado}"


end
