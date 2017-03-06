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

ActiveRecord::Schema.define(version: 20170214194932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.string   "logo_url"
    t.string   "tagline"
    t.string   "home_link"
    t.string   "github_link"
    t.string   "gitter_link"
    t.string   "footer_text"
    t.string   "footer_img"
    t.string   "footer_chatlink"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "twitter_link"
    t.string   "font_family"
    t.string   "font_size"
    t.string   "text_color"
    t.string   "link_color"
    t.string   "heading_color"
    t.string   "header_background_color"
    t.string   "header_text_color"
    t.string   "sidebar_background_color"
    t.string   "sidebar_link_color"
    t.string   "menu_hover_background_color"
    t.string   "menu_title_color"
    t.string   "slack_link"
    t.string   "description"
    t.string   "bitbucket_link"
    t.string   "searchtoken"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.string   "state"
  end

  add_index "documents", ["category_id", "created_at"], name: "index_documents_on_category_id_and_created_at", using: :btree
  add_index "documents", ["category_id"], name: "index_documents_on_category_id", using: :btree
  add_index "documents", ["slug"], name: "index_documents_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_foreign_key "documents", "categories"
end
