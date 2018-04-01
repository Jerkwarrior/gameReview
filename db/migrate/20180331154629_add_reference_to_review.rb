class AddReferenceToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :game, index: true
    add_reference :reviews, :user, index: true
  end
end
