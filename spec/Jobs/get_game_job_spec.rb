RSpec.describe GetGameJob, vcr: true, type: :job do

  before(:each) do
    GetGameJob.perform_now(20)
    @game = Game.where(id: 20)
    GetGameJob.perform_now(9608)
    @m_a_b_2 = Game.where(id: 9608)
    GetGameJob.perform_now(358)
    @mario = Game.where(id: 358)
  end

  it 'gets a game' do
    expect(@game.length).to eq 1
  end

  it 'gets the game name' do
    expect(@game.first.name).to eq 'BioShock'
  end

  it 'gets the game slug' do
    expect(@game.first.slug).to eq "bioshock"
  end

  it 'gets the game summary' do
    expect(@game.first.summary).to_not eq nil
  end

  it 'gets the game franchise' do
    expect(@mario.first.franchise).to eq 24
  end

  it 'gets the game popularity' do
    expect(@game.first.popularity).to eq 10
  end

  it 'gets the game category' do
    expect(@game.first.category).to eq 0
  end

  it 'gets the game status' do
    expect(@m_a_b_2.first.status).to eq 2
  end

  it 'gets the game cover' do
    expect(@game.first.cover_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/ajwsi2l7piuzmfvwxsbj.jpg"
  end

end
