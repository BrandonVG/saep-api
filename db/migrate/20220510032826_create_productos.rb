class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :precioPublico
      t.integer :precioMaquila
      t.string :descuentoMaquila
      
      t.timestamps
    end
  end
end
