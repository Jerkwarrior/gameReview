RSpec.describe GetGameEngineJob, vcr: true, type: :job do

  before(:each) do
    GetGameEngineJob.perform_now(3)
    @engine = GameEngine.where(id: 3)
  end

  it 'gets a game engine' do
    expect(@engine.length).to eq 1
  end

  it 'gets a game engine name' do
    expect(@engine.first.name).to eq "Source"
  end

  it 'gets a game engine logo' do
    expect(@engine.first.logo_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/rk2pcdi9skhph6e5ysby.jpg"
  end

end
