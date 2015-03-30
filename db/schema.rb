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

ActiveRecord::Schema.define(version: 20150329075731) do

  create_table "documents", force: true do |t|
    t.integer  "wedding_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "documents", ["wedding_id"], name: "index_documents_on_wedding_id"

  create_table "venues", force: true do |t|
    t.integer  "wedding_id"
    t.string   "name"
    t.string   "description"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["wedding_id"], name: "index_venues_on_wedding_id"

  create_table "weddings", force: true do |t|
    t.string   "name"
    t.string   "bride"
    t.string   "groom"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

end
