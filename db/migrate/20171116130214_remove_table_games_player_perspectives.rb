class RemoveTableGamesPlayerPerspectives < ActiveRecord::Migration[5.1]
  def change
    drop_table :games_player_perspectives
  end
end
