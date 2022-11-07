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

ActiveRecord::Schema[7.0].define(version: 2022_11_07_181138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocked_periods", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.date "start_date"
    t.date "end_date"
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
    t.bigint "user_id", null: false
    t.bigint "properties_id", null: false
    t.integer "cycle"
    t.integer "minimum_cycle_amount"
    t.float "rate"
    t.float "cleaning_fee", null: false
    t.boolean "public", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["properties_id"], name: "index_hostings_on_properties_id"
    t.index ["user_id"], name: "index_hostings_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "description"
    t.integer "quest_capacity"
    t.integer "bedrooms"
    t.integer "beds"
    t.integer "bathrooms"
    t.integer "type"
    t.float "size"
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
    t.bigint "property_id", null: false
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_property_images_on_property_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hosting_id", null: false
    t.integer "quests"
    t.date "check_in"
    t.date "check_out"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hosting_id"], name: "index_reservations_on_hosting_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", id: :bigint, default: -> { "nextval('user_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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
