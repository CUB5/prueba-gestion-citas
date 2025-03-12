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

ActiveRecord::Schema[8.0].define(version: 2025_03_12_162421) do
  create_table "citas", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.date "fecha"
    t.time "hora_inicio"
    t.integer "numero_solicitado"
    t.integer "numero_realizados"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_citas_on_cliente_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "codigo"
    t.string "razon_social"
    t.string "cif"
    t.string "direccion"
    t.string "municipio"
    t.string "provincia"
    t.date "fecha_inicio_contrato"
    t.date "fecha_expiracion_contrato"
    t.integer "numero_reconocimientos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "citas", "clientes"
end
