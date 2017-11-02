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

ActiveRecord::Schema.define(version: 20171102173713) do

  create_table "Player_perspectives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_Player_perspectives_on_game_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo_url"
    t.string "description"
    t.integer "country"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_engines", force: :cascade do |t|
    t.string "name"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_game_engines_on_game_id"
  end

  create_table "game_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_game_modes_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "url"
    t.text "summary"
    t.integer "collection"
    t.integer "franchise"
    t.integer "popularity"
    t.integer "game"
    t.integer "category"
    t.integer "status"
    t.string "release_date_human"
    t.string "cover_url"
    t.string "pegi_rating"
    t.string "steam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_engine_id"
    t.integer "game_mode_id"
    t.integer "genre_id"
    t.integer "keyword_id"
    t.integer "Player_perspective_id"
    t.integer "theme_id"
    t.integer "image_id"
    t.integer "screenshot_id"
    t.index ["Player_perspective_id"], name: "index_games_on_Player_perspective_id"
    t.index ["game_engine_id"], name: "index_games_on_game_engine_id"
    t.index ["game_mode_id"], name: "index_games_on_game_mode_id"
    t.index ["genre_id"], name: "index_games_on_genre_id"
    t.index ["image_id"], name: "index_games_on_image_id"
    t.index ["keyword_id"], name: "index_games_on_keyword_id"
    t.index ["screenshot_id"], name: "index_games_on_screenshot_id"
    t.index ["theme_id"], name: "index_games_on_theme_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_genres_on_game_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_keywords_on_game_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_themes_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.string "youtube_slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
