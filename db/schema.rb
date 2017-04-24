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

ActiveRecord::Schema.define(version: 20170424221445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_sets", force: :cascade do |t|
    t.integer  "mid"
    t.integer  "card_id"
    t.integer  "sets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_sets_on_card_id", using: :btree
    t.index ["sets_id"], name: "index_card_sets_on_sets_id", using: :btree
  end

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.string   "cost"
    t.integer  "mid",        default: [],              array: true
    t.string   "sets",       default: [],              array: true
    t.string   "subtypes",   default: [],              array: true
    t.string   "types",      default: [],              array: true
    t.string   "supertypes", default: [],              array: true
    t.string   "colors",     default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "maxmid"
    t.index ["colors"], name: "index_cards_on_colors", using: :gin
    t.index ["name"], name: "index_cards_on_name", using: :btree
    t.index ["subtypes"], name: "index_cards_on_subtypes", using: :gin
    t.index ["supertypes"], name: "index_cards_on_supertypes", using: :gin
    t.index ["types"], name: "index_cards_on_types", using: :gin
  end

  create_table "sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
    t.index ["code"], name: "index_sets_on_code", using: :btree
  end

end
