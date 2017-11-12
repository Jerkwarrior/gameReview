RSpec.describe GetKeywordJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 19)
    GetKeywordJob.perform_now(19)
  end

  it 'gets the correct amount of keywords' do
    expect(@game.keywords.length).to eq 2
  end

  it 'gets the keyword name' do
    expect(@game.keywords.first.name).to eq 'neo noir'
  end

  it 'gets the keyword id' do
    expect(@game.keywords.first.id).to eq 85
  end

end
