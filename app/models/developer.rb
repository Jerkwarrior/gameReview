class Developer < ApplicationRecord
  belongs_to :games
  belongs_to :companies
end
