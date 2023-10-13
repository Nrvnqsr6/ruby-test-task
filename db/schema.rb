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

ActiveRecord::Schema[7.0].define(version: 2023_10_12_141617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consultation_requests", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.text "request_text"
    t.datetime "created_at"
    t.index ["patient_id"], name: "index_consultation_requests_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.text "full_name"
    t.date "birth_date"
    t.text "phone_number"
    t.text "email"
    t.index ["phone_number"], name: "index_patients_on_phone_number", unique: true
  end

  create_table "recomendations", force: :cascade do |t|
    t.bigint "consultation_request_id", null: false
    t.text "recomendation_text"
    t.index ["consultation_request_id"], name: "index_recomendations_on_consultation_request_id"
  end

  add_foreign_key "consultation_requests", "patients"
  add_foreign_key "recomendations", "consultation_requests"
end
