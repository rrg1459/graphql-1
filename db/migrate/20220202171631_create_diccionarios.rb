class CreateDiccionarios < ActiveRecord::Migration[6.1]
  def change
    create_table :diccionarios do |t|
      t.string :nombre
      t.string :tipo
      t.string :abreviacion
      t.string :definicion

      t.timestamps
    end
  end
end
