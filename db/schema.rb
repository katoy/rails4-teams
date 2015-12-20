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

ActiveRecord::Schema.define(version: 20151214211325) do

  create_table "developers", force: :cascade do |t|
    t.string   "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobkinds", force: :cascade do |t|
    t.string   "jobkindable_type"
    t.integer  "jobkindable_id"
    t.integer  "person_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "jobkinds", ["jobkindable_id", "created_at"], name: "index_jobkinds_on_jobkindable_id_and_created_at"
  add_index "jobkinds", ["jobkindable_id", "jobkindable_type"], name: "index_jobkinds_on_jobkindable_id_and_jobkindable_type"

  create_table "members", force: :cascade do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "members", ["target_id", "target_type"], name: "index_members_on_target_id_and_target_type"
  add_index "members", ["team_id", "created_at"], name: "index_members_on_team_id_and_created_at"

  create_table "people", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "age",        null: false
    t.string   "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people", ["mail"], name: "index_people_on_mail", unique: true

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "staffs", force: :cascade do |t|
    t.string   "skill"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "teams", ["name", "created_at"], name: "index_teams_on_name_and_created_at", unique: true

end
