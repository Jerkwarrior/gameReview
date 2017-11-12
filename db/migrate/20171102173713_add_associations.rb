class AddAssociations < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :game_engine, foreign_key: true
    add_reference :games, :game_mode, foreign_key: true
    add_reference :games, :genre, foreign_key: true
    add_reference :games, :keyword, foreign_key: true
    add_reference :games, :player_perspective, foreign_key: true
    add_reference :games, :theme, foreign_key: true

    add_reference :games, :image, foreign_key: true
    add_reference :games, :screenshot, foreign_key: true

    add_reference :game_engines, :game, foreign_key: true
    add_reference :game_modes, :game, foreign_key: true
    add_reference :genres, :game, foreign_key: true
    add_reference :keywords, :game, foreign_key: true
    add_reference :player_perspectives, :game, foreign_key: true
    add_reference :themes, :game, foreign_key: true



  end
end
