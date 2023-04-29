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

ActiveRecord::Schema[7.0].define(version: 2023_04_29_160155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloom_color_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_bloom_color_ratings_on_plant_id"
    t.index ["user_id"], name: "index_bloom_color_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "bloom_quality_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_bloom_quality_ratings_on_plant_id"
    t.index ["user_id"], name: "index_bloom_quality_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name", null: false
    t.string "breeder"
    t.string "primary_color"
    t.string "accent_color"
    t.date "bred_date"
    t.date "introduced_date"
    t.bigint "species_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.string "description"
    t.boolean "is_deleted", default: false, null: false
    t.index ["category_id"], name: "index_breeds_on_category_id"
    t.index ["species_id"], name: "index_breeds_on_species_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_favorites_on_plant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_photos_on_plant_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.float "location_x"
    t.float "location_y"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "breed_id", null: false
    t.index ["breed_id"], name: "index_plants_on_breed_id"
  end

  create_table "rose_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id", null: false
    t.integer "status_type", default: 0, null: false
    t.index ["plant_id"], name: "index_rose_statuses_on_plant_id"
  end

  create_table "scent_ratings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.integer "rating", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_scent_ratings_on_plant_id"
    t.index ["user_id"], name: "index_scent_ratings_on_user_id"
    t.check_constraint "rating >= 1 AND rating <= 5"
  end

  create_table "species", force: :cascade do |t|
    t.string "latin_name"
    t.string "common_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.bigint "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_tags_on_plant_id"
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

  add_foreign_key "bloom_color_ratings", "plants"
  add_foreign_key "bloom_color_ratings", "users"
  add_foreign_key "bloom_quality_ratings", "plants"
  add_foreign_key "bloom_quality_ratings", "users"
  add_foreign_key "breeds", "categories"
  add_foreign_key "breeds", "species"
  add_foreign_key "favorites", "plants"
  add_foreign_key "favorites", "users"
  add_foreign_key "photos", "plants"
  add_foreign_key "photos", "users"
  add_foreign_key "plants", "breeds"
  add_foreign_key "rose_statuses", "plants"
  add_foreign_key "scent_ratings", "plants"
  add_foreign_key "scent_ratings", "users"
  add_foreign_key "tags", "plants"
end
