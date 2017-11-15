class AddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :games, :franchise_id
    add_index :games, :collection_id
  end
end
