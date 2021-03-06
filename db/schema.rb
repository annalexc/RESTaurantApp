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

ActiveRecord::Schema.define(version: 20160424225318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.integer  "customer_num"
    t.integer  "party_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "customers", ["party_id"], name: "index_customers_on_party_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.integer  "itype_id"
    t.decimal  "price",       precision: 6, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "items", ["itype_id"], name: "index_items_on_itype_id", using: :btree

  create_table "itypes", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "comments"
    t.integer  "customer_id"
    t.integer  "item_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "is_completed", default: 0
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.integer  "size"
    t.integer  "is_paid",    default: 0
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "table_id"
  end

  add_index "parties", ["table_id"], name: "index_parties_on_table_id", using: :btree
  add_index "parties", ["user_id"], name: "index_parties_on_user_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.integer  "table_num"
    t.integer  "num_seats"
    t.integer  "is_available", default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "customers", "parties"
  add_foreign_key "items", "itypes"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "items"
  add_foreign_key "parties", "tables"
  add_foreign_key "parties", "users"
end
