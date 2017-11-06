class Company < ApplicationRecord
  validates :name, presence: true
  validates :country, numericality: true
  has_many :games, through: :developers
  has_many :games, through: :publishers
end
