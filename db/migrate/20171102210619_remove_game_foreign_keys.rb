class RemoveGameForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:games, :game_engine)
    remove_reference(:game_engines, :game)
    remove_reference(:game_engines, :games)
    remove_reference(:games, :game_mode)
    remove_reference(:games, :genre)
    remove_reference(:games, :keyword)
    remove_reference(:games, :theme)
    remove_reference(:games, :Player_perspective)
    remove_reference(:games, :screenshot_id)

    remove_reference(:game_modes, :game)
    remove_reference(:genres, :game)
    remove_reference(:keywords, :game)
    remove_reference(:themes, :game)
    remove_reference(:player_perspectives, :game)
    remove_reference(:player_perspectives, :game)
  end
end
