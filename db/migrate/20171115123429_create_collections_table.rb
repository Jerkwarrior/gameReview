class CreateCollectionsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
