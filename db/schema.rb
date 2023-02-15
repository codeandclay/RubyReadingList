# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_15_003725) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorships", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_authorships_on_author_id"
    t.index ["entry_id"], name: "index_authorships_on_entry_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "plural_name", null: false
    t.string "singular_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entries_count", default: 0
  end

  create_table "contributors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "url"
    t.boolean "give_credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "entry_id"
    t.index ["entry_id"], name: "index_contributors_on_entry_id"
  end

  create_table "entries", force: :cascade do |t|
    t.text "description", null: false
    t.string "url", null: false
    t.string "title", null: false
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "state", default: "unpublished", null: false
    t.index ["category_id"], name: "index_entries_on_category_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "entry_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_taggings_on_entry_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "authorships", "authors"
  add_foreign_key "authorships", "entries"
  add_foreign_key "contributors", "entries"
  add_foreign_key "entries", "categories"
  add_foreign_key "taggings", "entries"
  add_foreign_key "taggings", "tags"
end
