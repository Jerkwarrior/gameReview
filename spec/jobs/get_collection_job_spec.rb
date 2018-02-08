RSpec.describe GetCollectionJob, vcr: true, type: :job do

  before(:each) do
    @game = create(:game, id: 2003, collection_id: 68)
    GetCollectionJob.perform_now(2003)
  end

  it 'gets the game collection' do
    expect(@game.collection).to_not eq nil
  end

  it 'gets a collection id' do
    expect(@game.collection.id).to eq 68
  end

  it 'gets a collection name' do
    expect(@game.collection.name).to eq "Batman: Arkham"
  end

  it 'gets a collection slug' do
    expect(@game.collection.slug).to eq "batman-arkham"
  end

end
