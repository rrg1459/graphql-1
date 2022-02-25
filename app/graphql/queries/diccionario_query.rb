module Queries
  class DiccionarioQuery < Queries::BaseQuery
    description 'Encuentra una palabra por ID'

    argument :id, ID, required: true

    type Types::DiccionarioType, null: false

    def resolve(id:)
      ::Diccionario.find(id)
    end
  end
end
