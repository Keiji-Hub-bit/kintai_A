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

ActiveRecord::Schema.define(version: 2021_03_16_134924) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "plan_end_time"
    t.string "work_content"
    t.string "instructor"
    t.string "next_day"
    t.datetime "after_started_at"
    t.datetime "after_finished_at"
    t.date "approval_day"
    t.date "approval_mmonth"
    t.integer "instructor_confirmation_month"
    t.string "instructor_select_month"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "base_points", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "base_number"
    t.string "base_name"
    t.string "base_kind"
  end

  create_table "logs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "before_started_at"
    t.datetime "before_finished_at"
    t.datetime "after_started_at"
    t.datetime "after_finished_at"
    t.string "Instructor"
    t.date "approval_day"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "department"
    t.string "employee_number"
    t.string "card_ID"
    t.datetime "basic_time", default: "2021-02-14 23:00:00"
    t.datetime "work_start_time", default: "2021-02-14 23:30:00"
    t.datetime "work_finish_time", default: "2021-02-15 08:30:00"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.boolean "superior"
    t.datetime "work_time", default: "2021-02-14 22:30:00"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "attendances", "users"
end
