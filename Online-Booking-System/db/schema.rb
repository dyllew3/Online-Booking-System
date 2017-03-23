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

ActiveRecord::Schema.define(version: 20170321143359) do

  create_table "activity_dates", force: :cascade do |t|
    t.integer  "activity_id"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activity_dates", ["activity_id"], name: "index_activity_dates_on_activity_id"

  create_table "applications", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applications", ["activity_id"], name: "index_applications_on_activity_id"
  add_index "applications", ["student_id"], name: "index_applications_on_student_id"

  create_table "locked_outs", force: :cascade do |t|
    t.string   "user_id"
    t.datetime "time_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lockouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_classes", force: :cascade do |t|
    t.string   "StudentClass"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "year"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["parent_id"], name: "index_students_on_parent_id"

  create_table "teachers", force: :cascade do |t|
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.integer  "userable_id"
    t.string   "userable_type"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "authenicated",    default: false
    t.string   "remember_digest"
    t.integer  "login_count",     default: 0
  end

  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["userable_type", "userable_id"], name: "index_users_on_userable_type_and_userable_id"

end
