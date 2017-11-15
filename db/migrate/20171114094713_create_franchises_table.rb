class CreateFranchisesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :franchises do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
