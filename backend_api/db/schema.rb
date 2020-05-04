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

ActiveRecord::Schema.define(version: 2020_05_04_130213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "downvotes", force: :cascade do |t|
    t.integer "question_id"
    t.integer "elab_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["elab_id"], name: "index_downvotes_on_elab_id"
    t.index ["question_id"], name: "index_downvotes_on_question_id"
  end

  create_table "elabs", force: :cascade do |t|
    t.text "elaboration"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_elabs_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "topic"
    t.string "url"
    t.text "pasted_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "replies", force: :cascade do |t|
    t.bigint "elab_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.bigint "layman_id"
    t.index ["elab_id"], name: "index_replies_on_elab_id"
  end

  create_table "scrapers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "question_id"
    t.integer "elab_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["elab_id"], name: "index_upvotes_on_elab_id"
    t.index ["question_id"], name: "index_upvotes_on_question_id"
  end

  add_foreign_key "downvotes", "elabs"
  add_foreign_key "downvotes", "questions"
  add_foreign_key "elabs", "questions"
  add_foreign_key "replies", "elabs"
  add_foreign_key "upvotes", "elabs"
  add_foreign_key "upvotes", "questions"
end
