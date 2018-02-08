RSpec.describe GetGameEngineJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 9602)
    GetGameEngineJob.perform_now(9602)
  end

  it 'gets the game engines' do
    expect(@game.game_engines.length).to eq 1
  end

  it 'gets a game engine name' do
    expect(@game.game_engines.first.name).to eq "Havok"
  end

  it 'gets a game engine logo' do
    expect(@game.game_engines.first.logo_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/q0atqqttcdj6ea5zkkkk.jpg"
  end

end
