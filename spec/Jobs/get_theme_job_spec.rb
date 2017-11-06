RSpec.describe GetThemeJob, vcr: true, type: :job do

  before(:each) do
    GetThemeJob.perform_now(1)
    @theme = Theme.where(id: 1)
  end

  it 'gets a game theme' do
    expect(@theme.length).to eq 1
  end

  it 'gets a game theme name' do
    expect(@theme.first.name).to eq "Action"
  end

end
