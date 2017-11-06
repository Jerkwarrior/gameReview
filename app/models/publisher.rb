class Publishers < ApplicationRecord
  belongs_to :games
  belongs_to :companies
end
