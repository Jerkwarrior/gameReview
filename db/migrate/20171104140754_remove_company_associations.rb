class RemoveCompanyAssociations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :companies, :publisher
    remove_reference :companies, :developer
    remove_reference :companies, :game
    drop_table :publishers
    drop_table :developers
  end
end
