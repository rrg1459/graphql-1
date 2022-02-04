class GameController < ApplicationController

  def play
    # byebug
    @word = Diccionario.where.not(definicion: nil, promedio: nil).sample

  end

end
