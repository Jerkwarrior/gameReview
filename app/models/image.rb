class Image < ApplicationRecord
  belongs_to :game, required: false
end
