# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151212161851) do

  create_table "albums", force: :cascade do |t|
    t.string   "kh_name",       limit: 255
    t.string   "en_name",       limit: 255
    t.text     "description",   limit: 65535
    t.integer  "year",          limit: 4
    t.string   "image",         limit: 255
    t.integer  "view",          limit: 4,     default: 0
    t.integer  "production_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "albums", ["production_id"], name: "index_albums_on_production_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "kh_name",     limit: 255
    t.string   "en_name",     limit: 255
    t.text     "description", limit: 65535
    t.integer  "view",        limit: 4,     default: 0
    t.string   "image",       limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "kh_name",    limit: 255
    t.string   "en_name",    limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string   "kh_name",     limit: 255
    t.string   "en_name",     limit: 255
    t.text     "description", limit: 65535
    t.string   "image",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "promotion_images", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "image",       limit: 255
    t.text     "description", limit: 65535
    t.string   "link",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "slides", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "image",       limit: 255
    t.string   "description", limit: 255
    t.string   "link",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "song_artists", force: :cascade do |t|
    t.integer  "song_id",    limit: 4
    t.integer  "artist_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "song_artists", ["artist_id"], name: "index_song_artists_on_artist_id", using: :btree
  add_index "song_artists", ["song_id"], name: "index_song_artists_on_song_id", using: :btree

  create_table "song_types", force: :cascade do |t|
    t.integer  "song_id",    limit: 4
    t.integer  "type_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "song_types", ["song_id"], name: "index_song_types_on_song_id", using: :btree
  add_index "song_types", ["type_id"], name: "index_song_types_on_type_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "kh_title",           limit: 255
    t.string   "en_title",           limit: 255
    t.text     "lyric",              limit: 65535
    t.integer  "play_number",        limit: 4,     default: 0
    t.integer  "download_number",    limit: 4,     default: 0
    t.string   "url",                limit: 255
    t.string   "image",              limit: 255
    t.string   "bg_image",           limit: 255
    t.string   "keyword",            limit: 255
    t.integer  "album_id",           limit: 4
    t.integer  "country_id",         limit: 4
    t.integer  "promotion_image_id", limit: 4
    t.integer  "user_id",            limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["country_id"], name: "index_songs_on_country_id", using: :btree
  add_index "songs", ["keyword"], name: "index_songs_on_keyword", using: :btree
  add_index "songs", ["promotion_image_id"], name: "index_songs_on_promotion_image_id", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "kh_type",    limit: 255
    t.string   "en_type",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.boolean  "admin",                              default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "albums", "productions"
  add_foreign_key "song_artists", "artists"
  add_foreign_key "song_artists", "songs"
  add_foreign_key "song_types", "songs"
  add_foreign_key "song_types", "types"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "countries"
  add_foreign_key "songs", "promotion_images"
  add_foreign_key "songs", "users"
end
