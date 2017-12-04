class Game < ApplicationRecord
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :perspectives
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :game_modes
  has_and_belongs_to_many :game_engines
  has_many :images
  has_many :videos

  has_many :developers
  has_many :publishers
  has_many :companies, through: :developers
  has_many :companies, through: :publishers

  belongs_to :franchise, required: false
  belongs_to :collection, required: false
end
