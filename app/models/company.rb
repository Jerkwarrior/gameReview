class Company < ApplicationRecord
  validates :name, presence: true

  has_many :games, through: :developers
  has_many :games, through: :publishers
  has_many :developers
  has_many :publishers
end
