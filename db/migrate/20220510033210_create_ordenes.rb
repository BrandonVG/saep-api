class CreateOrdenes < ActiveRecord::Migration[7.0]
  def change
    create_table :ordenes do |t|
      t.integer :Costo
      t.string :Descripcion
      t.datetime :FechaCreacion
      t.integer :Cantidad
      t.datetime :FechaEntrega
      t.integer :Anticipo
      t.string :Diseño
      t.references :users, foreign_key: true, null: false, type: :uuid
      t.references :tipos_trabajos, foreign_key: true, null: false
      t.references :estados_ordenes, foreign_key: true, null: false

      t.timestamps
    end
  end
end
