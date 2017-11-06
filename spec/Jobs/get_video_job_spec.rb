RSpec.describe GetVideoJob, vcr: true, type: :job do

  it 'gets a video' do
    GetVideoJob.perform_now(1)
    expect(Video.where(id: 1).length).to eq 1
  end

  it 'gets the video name' do
    GetVideoJob.perform_now(1)
    expect(Video.where(id: 1).first.name).to eq 'Trailer'
  end

  it 'gets the youtube slug' do
    GetVideoJob.perform_now(1)
    expect(Video.where(id: 1).first.youtube_slug).to eq '9C543B6uJ88'
  end

end
