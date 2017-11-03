class CreateJoinTableGameGameMode < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :game_modes do |t|
      t.index [:game_id, :game_mode_id]
      t.index [:game_mode_id, :game_id]
    end
  end
end
