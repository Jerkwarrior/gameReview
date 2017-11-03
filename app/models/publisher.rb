class Publisher < ApplicationRecord
  has_many :games, through: :company
end
