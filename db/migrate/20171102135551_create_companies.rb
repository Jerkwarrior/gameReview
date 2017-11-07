class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.string :logo_url
      t.string :description
      t.integer :country
      t.string :website

      t.timestamps
    end
  end
end
