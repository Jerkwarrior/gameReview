class Game < ApplicationRecord
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :Player_perspectives
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :game_modes
  has_and_belongs_to_many :game_engines
end
