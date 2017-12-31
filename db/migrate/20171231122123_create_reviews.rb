class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :summary
      t.integer :gameplay
      t.integer :story
      t.integer :graphics
      t.integer :immersion
      t.string :difficulty
      t.boolean :recommended?
      t.boolean :bugs?
      t.boolean :microtransactions?
      t.timestamps
    end
  end
end
