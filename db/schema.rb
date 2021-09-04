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

ActiveRecord::Schema.define(version: 2021_09_04_213156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "description"
    t.string "email"
    t.string "telephone01"
    t.string "telephone02"
    t.boolean "main"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_contacts_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "fantasyName"
    t.string "customerName"
    t.string "taxId"
    t.boolean "status"
    t.string "stateRegistration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers_operations", id: false, force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "operation_id", null: false
    t.index ["customer_id"], name: "index_customers_operations_on_customer_id"
    t.index ["operation_id"], name: "index_customers_operations_on_operation_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "cep"
    t.string "complement"
    t.string "number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "description"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_facilities_on_customer_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "contacts", "customers"
  add_foreign_key "facilities", "customers"
end
