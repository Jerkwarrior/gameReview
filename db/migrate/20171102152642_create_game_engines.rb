class CreateGameEngines < ActiveRecord::Migration[5.1]
  def change
    create_table :game_engines do |t|
      t.string :name
      t.string :logo_url

      t.timestamps
    end
  end
end
