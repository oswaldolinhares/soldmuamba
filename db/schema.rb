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

ActiveRecord::Schema.define(version: 20150618051114) do

  create_table "ads", force: true do |t|
    t.string   "title"
    t.float    "price",               limit: 24
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.integer  "building_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "photo"
  end

  add_index "ads", ["building_id"], name: "index_ads_on_building_id", using: :btree
  add_index "ads", ["user_id"], name: "index_ads_on_user_id", using: :btree
  add_index "ads", ["vehicle_id"], name: "index_ads_on_vehicle_id", using: :btree

  create_table "buildings", force: true do |t|
    t.string   "building_type"
    t.string   "area"
    t.string   "address"
    t.string   "rooms_number"
    t.string   "parking_number"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buildings", ["user_id"], name: "index_buildings_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: true do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "year"
    t.string   "km"
    t.text     "description"
    t.text     "description_vehicle"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "solded"
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

end
