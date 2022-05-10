class CreateOrdenesProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :ordenes_productos, id: false do |t|
      t.belongs_to :ordenes, index: true
      t.belongs_to :productos, index: true
      t.integer :Cantidad

      t.timestamps
    end
  end
end
