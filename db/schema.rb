# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_112232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "field_of_activities", force: :cascade do |t|
    t.string "title"
    t.integer "schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_field_of_activities_on_schedule_id"
  end

  create_table "occupations", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.date "start_date"
    t.time "start_time"
    t.date "end_date"
    t.time "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "week"
    t.integer "place_id"
    t.integer "field_of_activity_id"
    t.integer "type_of_week"
    t.integer "subject_id"
    t.index ["field_of_activity_id"], name: "index_occupations_on_field_of_activity_id"
    t.index ["place_id"], name: "index_occupations_on_place_id"
    t.index ["schedule_id"], name: "index_occupations_on_schedule_id"
    t.index ["subject_id"], name: "index_occupations_on_subject_id"
    t.index ["type_of_week"], name: "index_occupations_on_type_of_week"
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.integer "schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_places_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "start_date"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.integer "schedule_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_subjects_on_schedule_id"
  end

  add_foreign_key "occupations", "schedules"
end
