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

ActiveRecord::Schema[7.0].define(version: 2023_07_03_222952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "pubkey", limit: 64, null: false
    t.index ["pubkey"], name: "index_authors_on_pubkey", unique: true
  end

  create_table "delete_events", id: false, force: :cascade do |t|
    t.string "sha256", limit: 64, null: false
    t.bigint "author_id", null: false
    t.index ["sha256", "author_id"], name: "index_delete_events_on_sha256_and_author_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.integer "kind", null: false
    t.jsonb "tags", default: []
    t.binary "content"
    t.bigint "author_id", null: false
    t.string "sha256", limit: 64, null: false
    t.string "sig", limit: 128, null: false
    t.datetime "created_at"
    t.index ["author_id"], name: "index_events_on_author_id"
    t.index ["created_at", "kind"], name: "index_events_on_created_at_and_kind"
    t.index ["kind"], name: "index_events_on_kind"
    t.index ["sha256"], name: "index_events_on_sha256", unique: true
    t.index ["sig"], name: "index_events_on_sig", unique: true
  end

  create_table "searchable_tags", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "name", null: false
    t.string "value", null: false
    t.index ["event_id", "name", "value"], name: "index_searchable_tags_on_event_id_and_name_and_value", unique: true
  end

  create_table "trusted_authors", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_trusted_authors_on_author_id", unique: true
  end

  add_foreign_key "delete_events", "authors"
  add_foreign_key "events", "authors"
  add_foreign_key "searchable_tags", "events"
  add_foreign_key "trusted_authors", "authors"
end
