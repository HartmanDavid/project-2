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

ActiveRecord::Schema.define(version: 20150731032209) do

  create_table "ingredients", force: :cascade do |t|
    t.boolean  "chicken",    default: false
    t.boolean  "duck",       default: false
    t.boolean  "turkey",     default: false
    t.boolean  "beef",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "ingredients_pets", id: false, force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "species"
    t.string   "breed"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sex"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
