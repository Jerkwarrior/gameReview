class CreateJoinTableGameGameEngine < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :game_engines do |t|
      t.index [:game_id, :game_engine_id]
      t.index [:game_engine_id, :game_id]
    end
  end
end
