RSpec.describe GetPlatformJob, vcr: true, type: :job do

  before(:each) do
    GetPlatformJob.perform_now(7)
    @platform = Platform.where(id: 7)
  end

  it 'gets a platform' do
    expect(@platform.length).to eq 1
  end

  it 'gets a game platform name' do
    expect(@platform.first.name).to eq "PlayStation"
  end

  it 'gets a game platform logo' do
    expect(@platform.first.logo_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/ptlxti6tzdpma71s5tkm.jpg"
  end

end
