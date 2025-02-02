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

ActiveRecord::Schema.define(version: 2021_03_17_104355) do

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "type_of_animal"
    t.date "dob"
    t.float "weight"
    t.float "height"
    t.integer "biteyness"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_animals_on_owner_id"
  end

  create_table "animals_treatments", id: false, force: :cascade do |t|
    t.integer "animal_id", null: false
    t.integer "treatment_id", null: false
    t.index ["animal_id"], name: "index_animals_treatments_on_animal_id"
    t.index ["treatment_id"], name: "index_animals_treatments_on_treatment_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone", limit: 14
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_1"
    t.string "address_2"
    t.string "town", limit: 50
    t.string "postcode", limit: 8
    t.integer "user_id"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "role", default: "vet"
  end

  add_foreign_key "owners", "users"
end
