class Developer < ApplicationRecord
  belongs_to :games, optional: true
  belongs_to :companies, optional: true
end
