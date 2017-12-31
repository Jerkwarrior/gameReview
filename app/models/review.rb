class Review < ApplicationRecord
  # TODO Remove difficulty from ActiveRecord id:0 gh:35

  validates :summary, :gameplay, :story, :graphics, :immersion, presence: true

  validates :gameplay, :story, :graphics, :immersion,
            numericality: {only_integer: true,
                          greater_than_or_equal_to: 0,
                          less_than_or_equal_to: 10}

  validates :summary, length: {maximum: 1500}

end
