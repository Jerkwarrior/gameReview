class Game < ApplicationRecord
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :player_perspectives
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :game_modes
  has_and_belongs_to_many :game_engines
  has_many :images
  has_many :videos
  has_many :publishers, through: :company
  has_many :developers, through: :company
end
