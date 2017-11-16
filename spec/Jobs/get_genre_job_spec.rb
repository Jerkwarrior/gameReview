RSpec.describe GetGenreJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 21)
    GetGenreJob.perform_now(21)
  end

  it 'gets the game genres' do
    expect(@game.genres.length).to eq 2
  end

  it 'gets a game genre name' do
    expect(@game.genres.first.name).to eq "Shooter"
  end

end
