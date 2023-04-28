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

ActiveRecord::Schema[7.0].define(version: 2023_04_28_175305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloom_color_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rose_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_bloom_color_ratings_on_rose_id"
    t.index ["user_id"], name: "index_bloom_color_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "bloom_quality_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rose_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_bloom_quality_ratings_on_rose_id"
    t.index ["user_id"], name: "index_bloom_quality_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rose_id", null: false
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_favorites_on_rose_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rose_id", null: false
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_photos_on_rose_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "rose_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rose_id", null: false
    t.integer "status_type", default: 0, null: false
    t.index ["rose_id"], name: "index_rose_statuses_on_rose_id"
  end

  create_table "roses", force: :cascade do |t|
    t.text "name"
    t.text "primary_color"
    t.text "accent_color"
    t.float "location_x"
    t.float "location_y"
    t.date "acquired_date"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "variety_id"
    t.integer "species_id"
    t.index ["name"], name: "index_roses_on_name", unique: true
  end

  create_table "scent_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "rose_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_scent_ratings_on_rose_id"
    t.index ["user_id"], name: "index_scent_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "species", force: :cascade do |t|
    t.string "latin_name"
    t.string "common_name"
    t.string "breeder"
    t.date "bred_date"
    t.date "introduced_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.bigint "rose_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rose_id"], name: "index_tags_on_rose_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.boolean "is_admin"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bloom_color_ratings", "roses"
  add_foreign_key "bloom_color_ratings", "users"
  add_foreign_key "bloom_quality_ratings", "roses"
  add_foreign_key "bloom_quality_ratings", "users"
  add_foreign_key "favorites", "roses"
  add_foreign_key "favorites", "users"
  add_foreign_key "photos", "roses"
  add_foreign_key "photos", "users"
  add_foreign_key "rose_statuses", "roses"
  add_foreign_key "roses", "users"
  add_foreign_key "roses", "varieties"
  add_foreign_key "scent_ratings", "roses"
  add_foreign_key "scent_ratings", "users"
  add_foreign_key "tags", "roses"
end
