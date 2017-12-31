class RemoveDifficultyOnReview < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :difficulty
  end
end
