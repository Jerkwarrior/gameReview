class Company < ApplicationRecord
  validates :name, presence: true
  has_many :games, through: :developer
  has_many :games, through: :publisher
  has_many :developers
  has_many :publishers
end
