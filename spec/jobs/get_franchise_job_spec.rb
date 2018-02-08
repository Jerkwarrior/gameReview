RSpec.describe GetFranchiseJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 2003, franchise_id: 5)
    GetFranchiseJob.perform_now(2003)
  end

  it 'gets the game franchise' do
    expect(@game.franchise).to_not eq nil
  end

  it 'gets a franchise id' do
    expect(@game.franchise.id).to eq 5
  end

  it 'gets a franchise name' do
    expect(@game.franchise.name).to eq "Batman"
  end

  it 'gets a franchise slug' do
    expect(@game.franchise.slug).to eq "batman"
  end

end
