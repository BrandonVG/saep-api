class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :precioPublico
      t.integer :precioMayoreoPublico
      t.integer :precioMaquila
      t.integer :precioMayoreoMaquila

      t.timestamps
    end
  end
end
