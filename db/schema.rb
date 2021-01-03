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

ActiveRecord::Schema.define(version: 2021_01_03_004119) do

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "department"
    t.string "employee_number"
    t.string "card_ID"
    t.datetime "basic_time", default: "2021-01-02 23:00:00"
    t.time "work_start_time", default: "2000-01-01 23:30:00"
    t.datetime "work_finish_time", default: "2021-01-03 08:30:00"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
