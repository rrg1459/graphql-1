require 'byebug'

intentos = 0

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

  resultado = Array.new(palabra.size)

  puts
  palabra.each_with_index do |_, indice| 

    if palabra[indice] == guarda[indice] 
      palabra[indice]   = nil
      guarda[indice]    = nil
      resultado[indice] = true
    end

  end

  guarda.each_with_index do |_, indice| 
    next if guarda[indice].nil? 
    resultado[indice] = false if palabra.include?(guarda[indice])
  end

  puts "compara..: #{compara.split('')}"
  puts "resultado: #{resultado}"

end
