require 'rails_helper'

RSpec.describe Review, type: :model do

  before(:each) do
    sign_user_in
    @game = create(:game)
    @review = create(:review, game: @game, user: current_user)
  end

  xit 'should save a review' do
    expect(@review.save).to be true
  end

  xit 'should not save with an integer below 0' do
    @review.gameplay = -1
    expect(@review.save).to be false
  end

  xit 'should not save with an integer above 10' do
    @review.graphics = 9000
    expect(@review.save).to be false
  end

  xit 'should not save a summary that is greater than 1500 characters' do
    @review.summary = "Acknowledgement" * 101
    expect(@review.save).to be false
  end

end
