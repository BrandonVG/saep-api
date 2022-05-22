# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_10_034150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "estados_ordenes", force: :cascade do |t|
    t.string "Estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordenes", force: :cascade do |t|
    t.integer "Costo"
    t.string "Descripcion"
    t.datetime "FechaCreacion"
    t.datetime "FechaEntrega"
    t.integer "Anticipo"
    t.string "Diseño"
    t.uuid "users_id", null: false
    t.bigint "tipos_trabajos_id", null: false
    t.bigint "estados_ordenes_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estados_ordenes_id"], name: "index_ordenes_on_estados_ordenes_id"
    t.index ["tipos_trabajos_id"], name: "index_ordenes_on_tipos_trabajos_id"
    t.index ["users_id"], name: "index_ordenes_on_users_id"
  end

  create_table "ordenes_productos", id: false, force: :cascade do |t|
    t.bigint "ordenes_id"
    t.bigint "productos_id"
    t.integer "Cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ordenes_id"], name: "index_ordenes_productos_on_ordenes_id"
    t.index ["productos_id"], name: "index_ordenes_productos_on_productos_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "Nombre"
    t.string "Descripcion"
    t.integer "PrecioPublico"
    t.integer "PrecioMayoreoPublico"
    t.integer "PrecioMaquila"
    t.integer "PrecioMayoreoMaquila"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_trabajos", force: :cascade do |t|
    t.string "Tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos_usuarios", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "token_auth"
    t.bigint "tipos_usuarios_id", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["tipos_usuarios_id"], name: "index_users_on_tipos_usuarios_id"
  end

  add_foreign_key "ordenes", "estados_ordenes", column: "estados_ordenes_id"
  add_foreign_key "ordenes", "tipos_trabajos", column: "tipos_trabajos_id"
  add_foreign_key "ordenes", "users", column: "users_id"
  add_foreign_key "users", "tipos_usuarios", column: "tipos_usuarios_id"
end
