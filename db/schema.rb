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

ActiveRecord::Schema[7.0].define(version: 2023_06_21_222645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delete_events", force: :cascade do |t|
    t.string "event_id", limit: 64, null: false
    t.string "pubkey", limit: 64, null: false
    t.datetime "created_at"
    t.index ["event_id", "pubkey"], name: "index_delete_events_on_event_id_and_pubkey", unique: true
  end

  create_table "events", id: { type: :string, limit: 64 }, force: :cascade do |t|
    t.string "pubkey", limit: 64, null: false
    t.integer "kind", null: false
    t.jsonb "tags", default: []
    t.text "content"
    t.string "sig", limit: 128, null: false
    t.datetime "created_at"
  end

end
