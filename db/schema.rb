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

ActiveRecord::Schema.define(version: 2019_11_03_025543) do

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

  create_table "salaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "priority", null: false
    t.integer "payment0", null: false
    t.integer "payment1", null: false
    t.integer "payment2", null: false
    t.integer "payment3", null: false
    t.integer "payment4", null: false
    t.integer "payment5", null: false
    t.integer "payment6", null: false
    t.integer "payment7", null: false
    t.integer "payment8", null: false
    t.integer "payment9", null: false
    t.integer "payment10", null: false
    t.integer "payment11", null: false
    t.integer "payment12", null: false
    t.integer "payment13", null: false
    t.integer "payment14", null: false
    t.integer "payment15", null: false
    t.integer "payment16", null: false
    t.integer "payment17", null: false
    t.integer "payment18", null: false
    t.integer "payment19", null: false
    t.integer "payment20", null: false
    t.integer "payment21", null: false
    t.integer "payment22", null: false
    t.integer "payment23", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "priority"], name: "index_salaries_on_user_id_and_priority", unique: true
    t.index ["user_id"], name: "index_salaries_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "time_card_id", null: false
    t.string "kind"
    t.date "date", null: false
    t.time "start_at"
    t.integer "rest_minutes"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_card_id"], name: "index_shifts_on_time_card_id"
  end

  create_table "time_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.bigint "salary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salary_id"], name: "index_time_cards_on_salary_id"
    t.index ["user_id"], name: "index_time_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "working_hours", force: :cascade do |t|
    t.bigint "shift_id", null: false
    t.time "punch_in", null: false
    t.integer "rest_minute", null: false
    t.time "punch_out", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_working_hours_on_shift_id"
  end

end
