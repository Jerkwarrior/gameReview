class CreateJoinTableGamesPerspectives < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :perspectives do |t|
      t.index [:game_id, :perspective_id]
      t.index [:perspective_id, :game_id]
    end
  end
end
