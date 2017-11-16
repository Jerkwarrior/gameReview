class RemoveIndexOnGamePerspective < ActiveRecord::Migration[5.1]
  def change
    remove_index :games, :player_perspective_id
    remove_column :games, :player_perspective_id
  end
end
