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

ActiveRecord::Schema.define(version: 20170412171603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_codes", force: :cascade do |t|
    t.string   "country"
    t.integer  "area_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "bidding_date"
    t.decimal  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["product_id"], name: "index_bids_on_product_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "bid_id"
    t.integer  "product_id"
    t.datetime "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bid_id"], name: "index_orders_on_bid_id", using: :btree
    t.index ["product_id"], name: "index_orders_on_product_id", using: :btree
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "area_code_id"
    t.integer  "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["area_code_id"], name: "index_phone_numbers_on_area_code_id", using: :btree
    t.index ["user_id"], name: "index_phone_numbers_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "original_price"
    t.integer  "qauntity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.datetime "birthday"
    t.boolean  "has_membership"
    t.datetime "membership_start_date"
    t.datetime "membership_end_date"
    t.string   "address_line"
    t.string   "city"
    t.string   "country"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "bids", "products"
  add_foreign_key "bids", "users"
  add_foreign_key "orders", "bids"
  add_foreign_key "orders", "products"
  add_foreign_key "phone_numbers", "area_codes"
  add_foreign_key "phone_numbers", "users"
end
