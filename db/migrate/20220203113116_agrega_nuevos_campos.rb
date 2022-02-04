class AgregaNuevosCampos < ActiveRecord::Migration[6.1]
  def change
    add_column :diccionarios, :largo, :integer
    add_column :diccionarios, :promedio, :integer
  end
end
