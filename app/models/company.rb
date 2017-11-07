class Company < ApplicationRecord
  validates :name, presence: true
  has_many :games, through: :developer
  has_many :games, through: :publisher
  has_one :developer
  has_one :publisher
end
