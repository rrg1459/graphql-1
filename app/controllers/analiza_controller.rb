class AnalizaController < ApplicationController

  def lee
    @count_words = 0
  end

  def procesa
    @text = params[:text]
    @text = @text.gsub(/[^abcdefghijklmnñopqrstuvwxyzáéíóúABCDEFGHIJKLMNÑOPQRSTUVWXYZ ]/, ' ').squish.downcase
    @count_words = @text.split.size ##3 contador de palabras
    if @count_words == 0
      @notice = 'Debe escribir un texto de por los menos 1.000 palabras'
    elsif not @count_words.between?(1000, 10000)
      @notice = 'El texto debe tener entre 1.000 palabras y 10.000 palabras'
    end
    render analiza_lee_path
  end
  
  def update
    groups = $text.split(' ').group_by{|x| x}.transform_values { |values| values.size }
    groups = groups.sort_by(&:last).reverse.to_h
    all = params[:count_words].to_i
    @words = {}
    groups.each do |word, count|
      number = count.to_i
      average = number * 10000 / all
      text = Diccionario.find_by_nombre(word)
      if text.nil?
        @words[word] = number
      else
      text.promedio = text.promedio.nil? ? average : ((text.promedio + average) / 2)
      text.save
      end
    end
  end

  def manage
    word   = Hash[*params["word"].split]
    if params[:act] == 'true'
      new_world = Diccionario.new
      new_world.nombre   = word.keys.first
      new_world.promedio = word.values.first.to_i
      new_world.largo    = word.keys.first.size
      new_world.save
      @notice = "Se agregó al diccionario la palabra #{word.keys.first}"
    else
      @notice = "Se ignoró la palabra #{word.keys.first}"
    end
    $words.delete(word.keys.first)
    @words = $words
    render "/analiza/update"
  end

end
