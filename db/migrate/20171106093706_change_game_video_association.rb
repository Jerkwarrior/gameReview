class ChangeGameVideoAssociation < ActiveRecord::Migration[5.1]
  def change
    remove_reference :games, :video
    add_reference :videos, :game, foreign_key: true
  end
end
