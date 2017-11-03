class CreateCompanyAssociations < ActiveRecord::Migration[5.1]
  def change
    add_reference :companies, :publisher, foreign_key: true
    add_reference :companies, :developer, foreign_key: true
    add_reference :companies, :game, foreign_key: true
  end
end
