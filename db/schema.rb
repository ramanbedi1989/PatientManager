# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151115051724) do

  create_table "chat_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chats", force: true do |t|
    t.integer  "from"
    t.integer  "to"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dossage_types", force: true do |t|
    t.string   "name"
    t.string   "hindi_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frequency_types", force: true do |t|
    t.string   "name"
    t.string   "hindi_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "id_proofs", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_camp_patient_relationships", force: true do |t|
    t.integer  "medical_camp_id"
    t.integer  "patient_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "medical_camps", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "room_no"
  end

  create_table "medicine_patient_relationships", force: true do |t|
    t.integer  "medicine_id"
    t.integer  "patient_id"
    t.integer  "dosage_quantity"
    t.integer  "dossage_type_id"
    t.integer  "frequency"
    t.integer  "frequency_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "medical_camp_id"
    t.integer  "days_taken"
    t.string   "name"
  end

  create_table "medicine_patient_special_instruction_relationships", force: true do |t|
    t.integer  "medicine_patient_relationship_id"
    t.integer  "special_instruction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicine_type_special_instruction_relationships", force: true do |t|
    t.integer  "medicine_type_id"
    t.integer  "special_instruction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicine_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", force: true do |t|
    t.string   "name"
    t.integer  "medicine_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "default_dossage_quantity"
    t.integer  "dossage_type_id"
    t.integer  "default_frequency"
    t.integer  "frequency_type_id"
    t.integer  "default_days_taken"
  end

  add_index "medicines", ["name"], name: "index_medicines_on_name", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "patient_id"
    t.integer  "medical_department_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.text     "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "id_proof_number"
    t.string   "mobile"
    t.string   "father_spouse"
    t.integer  "id_proof_id"
    t.integer  "town_id"
    t.date     "dob"
    t.text     "diagnosis"
  end

  add_index "patients", ["name"], name: "index_patients_on_name", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sms_numbers", force: true do |t|
    t.string   "number"
    t.integer  "count",        default: 0
    t.datetime "last_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_instructions", force: true do |t|
    t.text     "name"
    t.text     "hindi_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towns", force: true do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "district_id"
  end

  add_index "towns", ["name"], name: "index_towns_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
