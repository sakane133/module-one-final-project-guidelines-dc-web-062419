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

ActiveRecord::Schema.define(version: 20190708194945) do

  create_table "lessons", force: :cascade do |t|
    t.string  "title"
    t.integer "topic_id"
    t.string  "url"
    t.string  "repo"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "lesson_id"
    t.string  "note_text"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "github_username"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
  end

end
