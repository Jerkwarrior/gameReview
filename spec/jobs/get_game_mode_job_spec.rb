RSpec.describe GetGameModeJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 18)
    GetGameModeJob.perform_now(18)
  end

  it 'gets a game mode' do
    expect(@game.game_modes.length).to eq 1
  end

  it 'gets a game mode name' do
    expect(@game.game_modes.first.name).to eq "Single player"
  end

end
