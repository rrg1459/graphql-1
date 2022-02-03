json.extract! diccionario, :id, :nombre, :tipo, :abreviacion, :definicion, :created_at, :updated_at
json.url diccionario_url(diccionario, format: :json)
