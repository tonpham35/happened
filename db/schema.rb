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

ActiveRecord::Schema.define(version: 20170616032718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "event_members", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_members_on_event_id"
    t.index ["user_id"], name: "index_event_members_on_user_id"
  end

  create_table "eventphotos", force: :cascade do |t|
    t.bigint "event_id"
    t.string "photo"
    t.string "lat"
    t.string "long"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventphotos_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "story_id"
    t.string "type_of_event"
    t.string "what"
    t.string "why"
    t.datetime "when"
    t.string "where"
    t.float "lat"
    t.float "long"
    t.string "mode_of_transport"
    t.string "flight_num"
    t.datetime "flight_time"
    t.datetime "flight_date"
    t.string "accomodation_type"
    t.string "accomodation_address"
    t.datetime "accomodation_checkin"
    t.datetime "accomodation_checkout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_events_on_story_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "friend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "time_taken"
    t.string "lat"
    t.string "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "story_members", force: :cascade do |t|
    t.bigint "story_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_story_members_on_story_id"
    t.index ["user_id"], name: "index_story_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "profilepic"
    t.datetime "datetime"
    t.string "latituve"
    t.string "longitude"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "event_members", "events"
  add_foreign_key "event_members", "users"
  add_foreign_key "eventphotos", "events"
  add_foreign_key "events", "stories"
  add_foreign_key "friends", "users"
  add_foreign_key "stories", "users"
  add_foreign_key "story_members", "stories"
  add_foreign_key "story_members", "users"
end
