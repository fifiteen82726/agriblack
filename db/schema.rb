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

ActiveRecord::Schema.define(version: 20160805165446) do

  create_table "fruits", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.float    "heat",         limit: 24
    t.float    "water",        limit: 24
    t.float    "protein",      limit: 24
    t.float    "fat",          limit: 24
    t.float    "carbohydrate", limit: 24
    t.float    "fiber",        limit: 24
    t.float    "sugar",        limit: 24
    t.float    "na",           limit: 24
    t.float    "k",            limit: 24
    t.float    "ca",           limit: 24
    t.float    "mg",           limit: 24
    t.float    "fe",           limit: 24
    t.float    "zn",           limit: 24
    t.float    "p",            limit: 24
    t.float    "va",           limit: 24
    t.float    "ve",           limit: 24
    t.float    "vb",           limit: 24
    t.float    "vc",           limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
