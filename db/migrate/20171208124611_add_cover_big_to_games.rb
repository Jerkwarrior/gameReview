class AddCoverBigToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :cover_big, :string
  end
end
