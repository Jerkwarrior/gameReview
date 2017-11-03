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

ActiveRecord::Schema.define(version: 20171103070820) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo_url"
    t.string "description"
    t.integer "country"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "publisher_id"
    t.integer "developer_id"
    t.integer "game_id"
    t.index ["developer_id"], name: "index_companies_on_developer_id"
    t.index ["game_id"], name: "index_companies_on_game_id"
    t.index ["publisher_id"], name: "index_companies_on_publisher_id"
  end

  create_table "developers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_engines", force: :cascade do |t|
    t.string "name"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_engines_games", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "game_engine_id", null: false
    t.index ["game_engine_id", "game_id"], name: "index_game_engines_games_on_game_engine_id_and_game_id"
    t.index ["game_id", "game_engine_id"], name: "index_game_engines_games_on_game_id_and_game_engine_id"
  end

  create_table "game_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_modes_games", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "game_mode_id", null: false
    t.index ["game_id", "game_mode_id"], name: "index_game_modes_games_on_game_id_and_game_mode_id"
    t.index ["game_mode_id", "game_id"], name: "index_game_modes_games_on_game_mode_id_and_game_id"
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
    t.integer "image_id"
    t.integer "video_id"
    t.index ["image_id"], name: "index_games_on_image_id"
    t.index ["video_id"], name: "index_games_on_video_id"
  end

  create_table "games_genres", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "genre_id", null: false
    t.index ["game_id", "genre_id"], name: "index_games_genres_on_game_id_and_genre_id"
    t.index ["genre_id", "game_id"], name: "index_games_genres_on_genre_id_and_game_id"
  end

  create_table "games_keywords", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "keyword_id", null: false
    t.index ["game_id", "keyword_id"], name: "index_games_keywords_on_game_id_and_keyword_id"
    t.index ["keyword_id", "game_id"], name: "index_games_keywords_on_keyword_id_and_game_id"
  end

  create_table "games_player_perspectives", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_perspective_id", null: false
    t.index ["game_id", nil], name: "index_games_player_perspectives_on_game_id_and_perspective_id"
    t.index [nil, "game_id"], name: "index_games_player_perspectives_on_perspective_id_and_game_id"
  end

  create_table "games_themes", id: false, force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "theme_id", null: false
    t.index ["game_id", "theme_id"], name: "index_games_themes_on_game_id_and_theme_id"
    t.index ["theme_id", "game_id"], name: "index_games_themes_on_theme_id_and_game_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "player_perspectives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
