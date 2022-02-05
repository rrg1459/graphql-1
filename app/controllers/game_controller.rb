class GameController < ApplicationController

  def play
    @word = Diccionario.where.not(definicion: [nil, "", "No existe en la RAE"]).where(largo: (4..6)).sample

    @spell_word = @word.nombre.split('')
    @array_word = Array.new(@word.largo)

  end

end
