class ChangeGameImageAssociation < ActiveRecord::Migration[5.1]
  def change
    remove_reference :games, :image
    add_reference :images, :game, foreign_key: true
  end
end
