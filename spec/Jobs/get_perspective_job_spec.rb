RSpec.describe GetPerspectiveJob, vcr: true, type: :job do
  
  before(:each) do
    @game = create(:game, id: 1)
    GetPerspectiveJob.perform_now(1)
  end

  it 'gets the game perspectives' do
    expect(@game.perspectives.length).to eq 1
  end

  it 'gets a game perspective name' do
    expect(@game.perspectives.first.name).to eq "First person"
  end

end
