RSpec.describe GetPlatformJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 25)
    GetPlatformJob.perform_now(25)
  end

  it 'gets the correct platform length' do
    expect(@game.platforms.length).to eq 3
  end

  it 'gets a game platform name' do
    expect(@game.platforms.first.name).to eq "PC (Microsoft Windows)"
  end

  it 'gets a game platform logo' do
    expect(@game.platforms.first.logo_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/e9w12ei09dljpsiwz7pv.jpg"
  end

end
