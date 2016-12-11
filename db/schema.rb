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

ActiveRecord::Schema.define(version: 20161211203110) do

  create_table "allergens", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergens_ingredients", id: false, force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "allergen_id",   null: false
  end

  create_table "allergens_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "allergen_id"
  end

  add_index "allergens_users", ["allergen_id"], name: "index_allergens_users_on_allergen_id"
  add_index "allergens_users", ["user_id"], name: "index_allergens_users_on_user_id"

  create_table "diary_entries", force: :cascade do |t|
    t.datetime "time"
    t.string   "meal"
    t.string   "food"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "diary_entries", ["user_id"], name: "index_diary_entries_on_user_id"

  create_table "food_apis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_barcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "foods_ingredients", id: false, force: :cascade do |t|
    t.integer "food_id",       null: false
    t.integer "ingredient_id", null: false
  end

  add_index "foods_ingredients", ["food_id", "ingredient_id"], name: "index_foods_ingredients_on_food_id_and_ingredient_id"
  add_index "foods_ingredients", ["ingredient_id", "food_id"], name: "index_foods_ingredients_on_ingredient_id_and_food_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "weights", force: :cascade do |t|
    t.float    "weight"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "weights", ["user_id"], name: "index_weights_on_user_id"

end
