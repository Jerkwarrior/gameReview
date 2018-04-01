require 'rails_helper'

RSpec.describe Review, type: :model do

  before(:each) do
    @game = create(:game)
    @user = create(:user)
    @review = create(:review, game: @game, user: @user)
  end

  it 'has a working factory' do
    expect(build(:review, game: @game, user: @user).save).to be true
  end

  it 'should not save without a user' do
    expect(build(:review, game: @game).save).to be false
  end

  it 'should not save without a game' do
    expect(build(:review, user: @user).save).to be false
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
    @review.summary = 'Acknowledgement' * 101
    expect(@review.save).to be false
  end

end
