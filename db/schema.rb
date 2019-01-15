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

ActiveRecord::Schema.define(version: 2019_01_15_020714) do

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
  end

  create_table "articles", force: :cascade do |t|
    t.text "content_text"
    t.text "meta_description"
    t.string "content_url", limit: 255, null: false
    t.string "content_title", limit: 255
    t.integer "categories_id"
    t.integer "media_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "open_status", default: 0
    t.integer "fixed_status", default: 0
    t.index ["categories_id"], name: "index_articles_on_categories_id"
    t.index ["content_url"], name: "index_articles_on_content_url", unique: true
    t.index ["media_id"], name: "index_articles_on_media_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_name"], name: "index_categories_on_category_name", unique: true
  end

  create_table "media", force: :cascade do |t|
    t.string "media_file_name", limit: 255
    t.string "mdeia_url", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
