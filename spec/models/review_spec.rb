require 'rails_helper'

RSpec.describe Review, type: :model do

  before(:each) do
    @review = create(:review)
  end

  it 'should save a review' do
    expect(@review.save).to be true
  end

  it 'should not save with an integer below 0' do
    @review.gameplay = -1
    expect(@review.save).to be false
  end

  it 'should not save with an integer above 10' do
    @review.graphics = 9000
    expect(@review.save).to be false
  end

  it 'should not save a summary that is greater than 1500 characters' do
    @review.summary = "Acknowledgement" * 101
    expect(@review.save).to be false
  end

end
