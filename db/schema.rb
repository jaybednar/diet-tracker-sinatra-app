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

ActiveRecord::Schema.define(version: 20180417183607) do

  create_table "diets", force: :cascade do |t|
    t.string   "date"
    t.integer  "protein"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "kcal"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_meals", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.string   "serving_size"
    t.integer  "protein"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "kcal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.integer  "protein"
    t.integer  "carbs"
    t.integer  "fat"
    t.integer  "kcal"
    t.integer  "diet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
