class AddNumberAndNameToOrden < ActiveRecord::Migration[7.0]
  def change
    add_column :ordenes, :telefono, :string
    add_column :ordenes, :cliente, :string
  end
end
