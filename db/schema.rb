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

ActiveRecord::Schema.define(version: 2020_05_23_180758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "occupation_id"
    t.date "occupation_date"
    t.boolean "complete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["occupation_id"], name: "index_tasks_on_occupation_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "occupations", "schedules"
end
