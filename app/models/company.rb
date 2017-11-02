class Company < ApplicationRecord
  validates :name, presence: true
  validates :country, numericality: true
end
