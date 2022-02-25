module Types
  class DiccionarioType < Types::BaseObject
    description "Estructura de diccionarios"

    field :id,            ID,                              null: false
    field :nombre,        String,                          null: true
    field :tipo,          String,                          null: true
    field :abreviacion,   String,                          null: true
    field :definicion,    String,                          null: true
    field :largo,         Integer,                         null: true
    field :promedio,      Integer,                         null: true
    field :created_at,    GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at,    GraphQL::Types::ISO8601DateTime, null: false

  end
end
