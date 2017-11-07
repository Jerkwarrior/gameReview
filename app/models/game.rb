class Game < ApplicationRecord
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :player_perspectives
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :game_modes
  has_and_belongs_to_many :game_engines
  belongs_to :images, required: false
  belongs_to :videos, required: false

  has_many :companies, through: :developers
  has_many :companies, through: :publishers
end
