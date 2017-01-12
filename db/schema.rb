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

ActiveRecord::Schema.define(version: 20170112191536) do

  create_table "advertisments", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "price"
    t.boolean  "status",         default: false
    t.boolean  "closed",         default: false
    t.integer  "winner"
    t.string   "realization"
    t.datetime "ended_date"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "geolocation_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["category_id"], name: "index_advertisments_on_category_id"
    t.index ["geolocation_id"], name: "index_advertisments_on_geolocation_id"
    t.index ["user_id"], name: "index_advertisments_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug"
  end

  create_table "geolocations", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_geolocations_on_slug"
  end

  create_table "offers", force: :cascade do |t|
    t.text     "content"
    t.string   "price",           default: "do negocjacji"
    t.string   "realization",     default: "do negocjacji"
    t.integer  "advertisment_id"
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["advertisment_id"], name: "index_offers_on_advertisment_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.boolean  "visibility", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "site_name"
    t.boolean  "maintenance", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.boolean  "verify",          default: false
    t.integer  "avatar",          default: 1
    t.string   "confirmation"
  end

end
