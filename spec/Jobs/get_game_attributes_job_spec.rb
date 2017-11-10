RSpec.describe GetGameAttributesJob, vcr: true, type: :job do

  before(:each) do
    GetGameJob.perform_now(20)
    @game = Game.where(id: 20)
  end

  it 'gets the game engines' do
    expect(@game.first.game_engines.first.name).to eq "Unreal Engine"
  end

  it 'gets the game modes' do
    expect(@game.first.game_modes.first.id).to eq 1
  end

  it 'gets the game genres' do
    expect(@game.first.genres.first.id).to eq 5
  end

  xit 'gets the game keywords' do
    expect(@game.first.keywords.first.id).to eq 138
  end

  xit 'gets the game themes' do
    expect(@game.first.themes.first.id).to eq 1
  end

  xit 'gets the game platforms' do
    expect(@game.first.platforms.first.id).to eq 6
    expect(@game.first.platforms.length).to eq 8
  end

end
