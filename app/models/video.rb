class Video < ApplicationRecord
  belongs_to :game, required: false
end
