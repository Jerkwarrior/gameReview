class ChangeDescriptionColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :companies, :description, :text
  end
end
