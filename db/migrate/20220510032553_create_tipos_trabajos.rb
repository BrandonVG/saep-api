class CreateTiposTrabajos < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_trabajos do |t|
      t.string :Tipo

      t.timestamps
    end
  end
end
