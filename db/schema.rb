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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131117051404) do

  create_table "districts", :force => true do |t|
    t.string   "district"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "id_proofs", :force => true do |t|
    t.string   "id_proof"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medical_departments", :force => true do |t|
    t.string   "medical_department"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "medical_department_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.text     "address"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "id_proof_number"
    t.string   "mobile"
    t.string   "father_spouse"
    t.integer  "id_proof_id"
    t.integer  "town_id"
    t.text     "treatment"
    t.text     "medicines"
    t.text     "services"
    t.text     "special_instructions"
  end

  create_table "towns", :force => true do |t|
    t.string   "town"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "district_id"
  end

end
