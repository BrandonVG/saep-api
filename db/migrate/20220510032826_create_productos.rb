class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :Nombre
      t.string :Descripcion
      t.integer :PrecioPublico
      t.integer :PrecioMayoreoPublico
      t.integer :PrecioMaquila
      t.integer :PrecioMayoreoMaquila

      t.timestamps
    end
  end
end
