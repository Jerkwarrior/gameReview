RSpec.describe GetGenreJob, vcr: true, type: :job do

  before(:each) do
    GetGenreJob.perform_now(4)
    @genre = Genre.where(id: 4)
  end

  it 'gets a game genre' do
    expect(@genre.length).to eq 1
  end

  it 'gets a game genre name' do
    expect(@genre.first.name).to eq "Fighting"
  end

end
