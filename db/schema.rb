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

ActiveRecord::Schema.define(version: 2018_10_11_081140) do

  create_table "catalogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "before_front_image_id"
    t.string "before_side_image_id"
    t.string "before_back_image_id"
    t.string "order_front_image_id"
    t.string "order_side_image_id"
    t.string "order_back_image_id"
    t.string "after_front_image_id"
    t.string "after_side_image_id"
    t.string "after_back_image_id"
    t.string "salon"
    t.string "stylist"
    t.string "menu"
    t.string "price"
    t.string "length"
    t.string "color"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "catalog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "catalog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "user_name"
    t.string "user_key", null: false
    t.integer "age"
    t.string "profile_image_id"
    t.string "address"
    t.boolean "sex"
    t.string "fashion"
    t.string "face"
    t.string "hair_shitu"
    t.string "hair_ryou"
    t.string "hair_futosa"
    t.string "hair_kuse"
    t.string "introduce"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
