class CreateJoinTableGamePerspective < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :player_perspectives do |t|
    end
  end
end
