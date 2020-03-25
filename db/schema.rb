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

ActiveRecord::Schema.define(version: 2020_03_25_144108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_choices", force: :cascade do |t|
    t.bigint "hangout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["hangout_id"], name: "index_date_choices_on_hangout_id"
  end

  create_table "date_votes", force: :cascade do |t|
    t.bigint "date_choice_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_choice_id"], name: "index_date_votes_on_date_choice_id"
    t.index ["user_id"], name: "index_date_votes_on_user_id"
  end

  create_table "hangouts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hangouts_on_user_id"
  end

  create_table "location_choices", force: :cascade do |t|
    t.bigint "hangout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.index ["hangout_id"], name: "index_location_choices_on_hangout_id"
  end

  create_table "location_votes", force: :cascade do |t|
    t.bigint "location_choice_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_choice_id"], name: "index_location_votes_on_location_choice_id"
    t.index ["user_id"], name: "index_location_votes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "date_choices", "hangouts"
  add_foreign_key "date_votes", "date_choices"
  add_foreign_key "date_votes", "users"
  add_foreign_key "hangouts", "users"
  add_foreign_key "location_choices", "hangouts"
  add_foreign_key "location_votes", "location_choices"
  add_foreign_key "location_votes", "users"
end
