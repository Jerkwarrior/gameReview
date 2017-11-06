RSpec.describe GetGameModeJob, vcr: true, type: :job do

  before(:each) do
    GetGameModeJob.perform_now(1)
    @mode = GameMode.where(id: 1)
  end

  it 'gets a game mode' do
    expect(@mode.length).to eq 1
  end

  it 'gets a game mode name' do
    expect(@mode.first.name).to eq "Single player"
  end

end
