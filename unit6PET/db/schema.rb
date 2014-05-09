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

ActiveRecord::Schema.define(version: 20140215205547) do

  create_table "consider_carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consider_pets", force: true do |t|
    t.integer  "pet_id"
    t.integer  "consider_cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",         default: 1
    t.integer  "foster_parent_id"
  end

  add_index "consider_pets", ["consider_cart_id"], name: "index_consider_pets_on_consider_cart_id"
  add_index "consider_pets", ["foster_parent_id"], name: "index_consider_pets_on_foster_parent_id"
  add_index "consider_pets", ["pet_id"], name: "index_consider_pets_on_pet_id"

  create_table "foster_parents", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pet_id"
  end

  add_index "foster_parents", ["pet_id"], name: "index_foster_parents_on_pet_id"

  create_table "fostereds", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_pets", force: true do |t|
    t.integer  "pet_id"
    t.integer  "fostered_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_pets", ["fostered_id"], name: "index_line_pets_on_fostered_id"
  add_index "line_pets", ["pet_id"], name: "index_line_pets_on_pet_id"

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "breed"
    t.decimal  "age"
    t.decimal  "stay"
    t.text     "description"
    t.text     "tendencies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

end
