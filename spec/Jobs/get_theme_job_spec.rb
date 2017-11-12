RSpec.describe GetThemeJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 20)
    GetThemeJob.perform_now(20)
  end

  it 'gets the correct theme length' do
    expect(@game.themes.length).to eq 2
  end

  it 'gets a game theme name' do
    expect(@game.themes.first.name).to eq "Action"
  end

end
