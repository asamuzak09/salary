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

ActiveRecord::Schema.define(version: 2020_01_25_045753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "public_holidays", force: :cascade do |t|
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "priority", null: false
    t.integer "payment", null: false
    t.integer "overtime_pay", null: false
    t.integer "holiday_pay", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "priority"], name: "index_salaries_on_user_id_and_priority", unique: true
    t.index ["user_id"], name: "index_salaries_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "time_card_id", null: false
    t.string "kind", null: false
    t.date "date", null: false
    t.time "start_at"
    t.integer "rest_minutes"
    t.time "end_at"
    t.integer "preparation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_card_id"], name: "index_shifts_on_time_card_id"
  end

  create_table "time_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.date "starting_date", null: false
    t.date "closing_date", null: false
    t.bigint "salary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salary_id"], name: "index_time_cards_on_salary_id"
    t.index ["user_id", "year", "month"], name: "index_time_cards_on_user_id_and_year_and_month", unique: true
    t.index ["user_id"], name: "index_time_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name1", default: "", null: false
    t.string "name2", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "working_hours", force: :cascade do |t|
    t.bigint "shift_id", null: false
    t.time "punch_in", null: false
    t.integer "rest_minutes", null: false
    t.time "punch_out", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_working_hours_on_shift_id"
  end

end
