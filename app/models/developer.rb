class Developer < ApplicationRecord
  belongs_to :games, required: false
  belongs_to :companies, required: false
end
