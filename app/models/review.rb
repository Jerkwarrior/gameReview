class Review < ApplicationRecord

  validates :summary, :gameplay, :story, :graphics, :immersion, presence: true

  validates :gameplay, :story, :graphics, :immersion,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 10 }

  validates :summary, length: { maximum: 1500 }

  belongs_to :game
  belongs_to :user
end
