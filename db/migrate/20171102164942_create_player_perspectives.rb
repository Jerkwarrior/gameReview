class CreatePlayerPerspectives < ActiveRecord::Migration[5.1]
  def change
    create_table :player_perspectives do |t|
      t.string :name

      t.timestamps
    end
  end
end
