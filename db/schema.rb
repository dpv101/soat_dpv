# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170612063546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clase_vehiculos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "tipo_documento"
    t.string   "numero_documento"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "email"
    t.string   "telefono"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "clientes", ["email"], name: "index_clientes_on_email", unique: true, using: :btree
  add_index "clientes", ["numero_documento"], name: "index_clientes_on_numero_documento", unique: true, using: :btree

  create_table "soats", force: :cascade do |t|
    t.integer  "venta_id"
    t.integer  "vehiculo_id"
    t.datetime "fecha_ini"
    t.datetime "fecha_fin"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tipo_vehiculos", force: :cascade do |t|
    t.integer  "clase_vehiculo_id"
    t.string   "codigo"
    t.string   "edad"
    t.decimal  "tasa_comercial"
    t.decimal  "valor_prima"
    t.decimal  "contribucion_fosyga"
    t.decimal  "subtotal"
    t.decimal  "tasa_run"
    t.decimal  "total_pagar"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "nombre"
  end

  create_table "vehiculos", force: :cascade do |t|
    t.string   "placa"
    t.decimal  "edad"
    t.integer  "tipo_vehiculo_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "clase_vehiculo_id"
  end

  add_index "vehiculos", ["placa"], name: "index_vehiculos_on_placa", unique: true, using: :btree

  create_table "ventas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "usuario_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "vehiculo_id"
    t.decimal  "total"
  end

end
