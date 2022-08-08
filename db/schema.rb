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

ActiveRecord::Schema[7.0].define(version: 2022_08_08_101532) do
  create_table "articles", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "subject"
    t.text "body"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "bottles", charset: "utf8mb3", force: :cascade do |t|
    t.string "bottle_type"
    t.string "bottle_name"
    t.text "meaning_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "end_at"
    t.string "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_careers_on_user_id"
  end

  create_table "contracts", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.integer "consultant_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_contracts_on_plan_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "entries", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "inquiries", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "title"
    t.text "body"
  end

  create_table "messages", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "plans", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "tag"
    t.text "can_do"
    t.string "youtube"
    t.text "body"
    t.integer "consultant_id"
    t.integer "customer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "relationships", charset: "utf8mb3", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
  end

  create_table "reviews", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "body"
    t.string "name"
    t.integer "reviewer_id"
    t.integer "reviewee_id"
    t.float "evaluation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallplans", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.text "plan_detail"
    t.string "plan_name"
    t.boolean "video", default: false, null: false
    t.boolean "chat", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.index ["plan_id"], name: "index_smallplans_on_plan_id"
    t.index ["user_id"], name: "index_smallplans_on_user_id"
  end

  create_table "user_select_bottles", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bottle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_user_select_bottles_on_bottle_id"
    t.index ["user_id"], name: "index_user_select_bottles_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "remember_token"
    t.datetime "soft_destroyed_at"
    t.datetime "locked_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_deleted", default: false, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "remember_digest"
    t.string "prefecture"
    t.integer "userstyle", default: 0
    t.text "introduction"
    t.integer "total_users"
    t.datetime "deleted_at"
    t.text "url"
    t.string "certificate_name"
    t.string "certificate"
    t.string "level"
    t.string "experience"
    t.string "disability_passport"
    t.string "twitter"
    t.string "image"
    t.index ["email", "soft_destroyed_at"], name: "index_users_on_email_and_soft_destroyed_at", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["soft_destroyed_at"], name: "index_users_on_soft_destroyed_at"
  end

  add_foreign_key "articles", "users"
  add_foreign_key "careers", "users"
  add_foreign_key "contracts", "plans"
  add_foreign_key "contracts", "users"
  add_foreign_key "entries", "rooms"
  add_foreign_key "entries", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "smallplans", "plans"
  add_foreign_key "smallplans", "users"
  add_foreign_key "user_select_bottles", "bottles"
  add_foreign_key "user_select_bottles", "users"
end
