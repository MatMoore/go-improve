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

ActiveRecord::Schema.define(version: 20160327142317) do

  create_table "games", force: :cascade do |t|
    t.integer  "review_for",   null: false
    t.string   "black_player", null: false
    t.string   "white_player", null: false
    t.string   "sgf_contents", null: false
    t.string   "black_rank",   null: false
    t.string   "white_rank",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "reviewer_name", null: false
    t.string   "reviewer_rank", null: false
    t.date     "deadline",      null: false
    t.string   "sgf_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id"

end
