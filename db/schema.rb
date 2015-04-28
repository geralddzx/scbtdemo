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

ActiveRecord::Schema.define(version: 20150423181448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                     null: false
    t.datetime "datetime"
    t.string   "location"
    t.text     "content"
    t.integer  "author_id"
    t.boolean  "display",    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.string   "subject"
    t.string   "ip_address"
    t.boolean  "read",            default: false
    t.string   "http_user_agent"
    t.integer  "campus_id"
    t.integer  "program_id"
    t.string   "referral"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "url",         null: false
    t.string   "mimetype"
    t.string   "filename",    null: false
    t.integer  "uploader_id"
    t.integer  "size"
    t.integer  "source_id"
    t.string   "source_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",       null: false
    t.datetime "datetime"
    t.string   "description"
    t.text     "content"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                                     null: false
    t.string   "last_name",                                      null: false
    t.string   "username",                                       null: false
    t.string   "number"
    t.string   "role",                                           null: false
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone",                  limit: 10
    t.string   "referral"
    t.string   "photo_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
