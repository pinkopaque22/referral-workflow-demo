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

ActiveRecord::Schema[8.0].define(version: 2025_10_03_015831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "referrals", force: :cascade do |t|
    t.string "student_name"
    t.text "student_info"
    t.bigint "teacher_id", null: false
    t.bigint "counselor_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending_admin_review", null: false
    t.text "counselor_notes"
    t.string "admin_signature"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "referrals", "users", column: "admin_id"
  add_foreign_key "referrals", "users", column: "counselor_id"
  add_foreign_key "referrals", "users", column: "teacher_id"
end
