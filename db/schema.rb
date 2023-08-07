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

ActiveRecord::Schema.define(version: 2023_08_07_214904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "cinema_id", null: false
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_id"], name: "index_bookings_on_cinema_id"
    t.index ["movie_id"], name: "index_bookings_on_movie_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.integer "availability"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.bigint "cinema_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cinema_id"], name: "index_movies_on_cinema_id"
  end

  create_table "screenings", force: :cascade do |t|
    t.date "date"
    t.integer "time_slot"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cinema_id", null: false
    t.bigint "movie_id", null: false
    t.index ["cinema_id"], name: "index_screenings_on_cinema_id"
    t.index ["movie_id"], name: "index_screenings_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "mobile_number"
    t.string "password_digest"
    t.string "admin", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "cinemas"
  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "users"
  add_foreign_key "movies", "cinemas"
  add_foreign_key "screenings", "cinemas"
  add_foreign_key "screenings", "movies"
end