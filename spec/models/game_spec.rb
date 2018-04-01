require 'rails_helper'

RSpec.describe Game, type: :model do

  it 'has a working factory' do
    expect(build(:game).save).to be true
  end
end
