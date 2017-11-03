class Developer < ApplicationRecord
  has_many :games, through: :company
end
