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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_192924) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.integer "number", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocked_periods", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_blocked_periods_on_property_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hostings", force: :cascade do |t|
    t.integer "cycle", null: false
    t.integer "minimum_cycle_amount", null: false
    t.float "rate", null: false
    t.boolean "public", default: true, null: false
    t.float "cleaning_fee"
    t.bigint "user_id", null: false
    t.bigint "properties_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["properties_id"], name: "index_hostings_on_properties_id"
    t.index ["user_id"], name: "index_hostings_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "guest_capacity", null: false
    t.integer "bedrooms", null: false
    t.integer "beds", null: false
    t.integer "bathrooms", null: false
    t.integer "kind", default: 0, null: false
    t.float "size", null: false
    t.bigint "user_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_properties_on_address_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_categories", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_property_categories_on_category_id"
    t.index ["property_id"], name: "index_property_categories_on_property_id"
  end

  create_table "property_images", force: :cascade do |t|
    t.string "source", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_images_on_property_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "quests", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.float "price", null: false
    t.bigint "user_id", null: false
    t.bigint "hosting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hosting_id"], name: "index_reservations_on_hosting_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "blocked_periods", "properties"
  add_foreign_key "hostings", "properties", column: "properties_id"
  add_foreign_key "hostings", "users"
  add_foreign_key "properties", "addresses"
  add_foreign_key "properties", "users"
  add_foreign_key "property_categories", "categories"
  add_foreign_key "property_categories", "properties"
  add_foreign_key "property_images", "properties"
  add_foreign_key "reservations", "hostings"
  add_foreign_key "reservations", "users"
end
