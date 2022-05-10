class CreateTiposUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_usuarios do |t|
      t.string :tipo

      t.timestamps
    end
  end
end
