class RenameTablePlayerPerspective < ActiveRecord::Migration[5.1]
  def change
    rename_table :player_perspectives, :perspectives
  end
end
