# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## User data
      t.string :Nombre
      t.string :NumTelefono
      t.references :tipos_usuarios, foreign_key: true, null: false

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end