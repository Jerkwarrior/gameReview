class Company < ApplicationRecord
  validates :name, presence: true
  validates :country, numericality: true
  belongs_to :game
  belongs_to :developer
  belongs_to :publisher
end
