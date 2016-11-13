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

ActiveRecord::Schema.define(version: 20161113192420) do

  create_table "customer_orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "quotation"
    t.text     "description"
    t.integer  "quantity"
    t.date     "expected_delivery_date"
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "artifact_file_name"
    t.string   "artifact_content_type"
    t.integer  "artifact_file_size"
    t.datetime "artifact_updated_at"
  end

  create_table "customer_payments", force: :cascade do |t|
    t.integer  "customer_order_id"
    t.integer  "quantity"
    t.float    "cost_per_piece"
    t.float    "total_cost"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "customers", force: :cascade do |t|
    t.boolean  "admin"
    t.string   "customer_name",          default: "", null: false
    t.string   "organization_name",      default: "", null: false
    t.string   "mobile_num",             default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.integer  "customer_order_id"
    t.text     "address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "manufacturer_orders", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.string   "quotation"
    t.text     "description"
    t.integer  "quantity"
    t.date     "expected_delivery_date"
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "artifact_file_name"
    t.string   "artifact_content_type"
    t.integer  "artifact_file_size"
    t.datetime "artifact_updated_at"
  end

  create_table "manufacturer_payments", force: :cascade do |t|
    t.integer  "manufacturer_order_id"
    t.integer  "quantity"
    t.float    "cost_per_piece"
    t.float    "total_amount"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "manufacturer_statuses", force: :cascade do |t|
    t.integer  "manufacturer_order_id"
    t.string   "status"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "manufacturer_name"
    t.string   "manufacturing_unit_name"
    t.text     "address"
    t.string   "mobile_num"
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["email"], name: "index_manufacturers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_manufacturers_on_reset_password_token", unique: true
  end

  create_table "order_statuses", force: :cascade do |t|
    t.integer  "customer_order_id"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
