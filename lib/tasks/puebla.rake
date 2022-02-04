desc "Poblar el campo largo de la tabla diccionarios"
task :poblar => :environment do

  diccionario = Diccionario.where(largo: nil)

  diccionario.each do |palabra|
    palabra.update(largo: palabra.nombre.size)
  end

end
