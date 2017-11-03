class RemoveScreenshotAssociation < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:games, :screenshot)
    add_reference :games, :video, foreign_key: true
  end
end
