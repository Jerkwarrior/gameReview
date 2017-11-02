class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :slug
      t.string :url
      t.text :summary
      t.integer :collection
      t.integer :franchise
      t.integer :popularity
      t.integer :game
      t.integer :category
      t.integer :status
      t.string :release_date_human
      t.string :cover_url
      t.string :pegi_rating
      t.string :steam_id
      t.timestamps
    end
  end
end
