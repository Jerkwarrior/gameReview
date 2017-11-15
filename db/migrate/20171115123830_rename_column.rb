class RenameColumn < ActiveRecord::Migration[5.1]
  def up
    rename_column :games, :franchise, :franchise_id
    rename_column :games, :collection, :collection_id
  end
  def down
    rename_column :games, :franchise_id, :franchise
    rename_column :games, :collection_id, :collection
  end
end
