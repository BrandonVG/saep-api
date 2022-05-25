class CreateEstadosOrdenes < ActiveRecord::Migration[7.0]
  def change
    create_table :estados_ordenes do |t|
      t.string :estado

      t.timestamps
    end
  end
end
