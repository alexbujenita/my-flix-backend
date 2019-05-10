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

ActiveRecord::Schema.define(version: 2019_05_10_120805) do

  create_table "noko_movies", force: :cascade do |t|
    t.integer "movie_id"
    t.string "title"
    t.string "poster_path"
    t.string "original_title"
    t.string "genre_ids"
    t.string "backdrop_path"
    t.boolean "adult"
    t.text "overview"
    t.string "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_ref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movie_title"
    t.string "movie_poster_path"
    t.boolean "seen", default: false
    t.text "description"
    t.index ["user_id"], name: "index_user_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
