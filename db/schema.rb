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

ActiveRecord::Schema[7.1].define(version: 2026_02_14_091108) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "vet_id"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_chats_on_owner_id"
    t.index ["pet_id"], name: "index_chats_on_pet_id"
    t.index ["vet_id"], name: "index_chats_on_vet_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "field"
    t.string "clinic_name"
    t.string "contact"
    t.string "species"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "vet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_friendships_on_owner_id"
    t.index ["vet_id"], name: "index_friendships_on_vet_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.string "health"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_logs_on_pet_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "contents"
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "dob"
    t.string "species"
    t.string "breed"
    t.string "microchip"
    t.float "weight"
    t.string "current_meds"
    t.string "vacc_status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "insurance"
    t.boolean "fixed"
    t.string "gender"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "pets"
  add_foreign_key "chats", "users", column: "owner_id"
  add_foreign_key "chats", "users", column: "vet_id"
  add_foreign_key "clinics", "users"
  add_foreign_key "friendships", "users", column: "owner_id"
  add_foreign_key "friendships", "users", column: "vet_id"
  add_foreign_key "logs", "pets"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "pets", "users"
end
