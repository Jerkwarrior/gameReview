class CreateJoinTableGamePerspective < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :player_perspectives do |t|
      t.index [:game_id, :perspective_id]
      t.index [:perspective_id, :game_id]
    end
  end
end
