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

ActiveRecord::Schema.define(version: 2020_04_01_080255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hangout_id"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hangout_id"], name: "index_attendances_on_hangout_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

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
    t.datetime "poll_closing_time"
    t.index ["user_id"], name: "index_hangouts_on_user_id"
  end

  create_table "location_choices", force: :cascade do |t|
    t.bigint "hangout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "address"
    t.float "rating"
    t.string "photo"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendances", "hangouts"
  add_foreign_key "attendances", "users"
  add_foreign_key "date_choices", "hangouts"
  add_foreign_key "date_votes", "date_choices"
  add_foreign_key "date_votes", "users"
  add_foreign_key "hangouts", "users"
  add_foreign_key "location_choices", "hangouts"
  add_foreign_key "location_votes", "location_choices"
  add_foreign_key "location_votes", "users"
end
