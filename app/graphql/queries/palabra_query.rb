module Queries
  class PalabraQuery < Queries::BaseQuery
    description 'Encuentra una palabra al azar'

    type Types::DiccionarioType, null: false

    def resolve
      ::Diccionario.where.not(definicion: [nil, "", "No existe en la RAE"]).where(largo: (4..6)).sample
    end
  end
end
