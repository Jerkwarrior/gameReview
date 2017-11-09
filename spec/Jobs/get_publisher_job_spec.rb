RSpec.describe GetPublisherJob, vcr: true, type: :job do

  before(:each) do
    # HACK Will need to move job creation to company job
    GetCompanyJob.perform_now(2)
    GetGameJob.perform_now(22975)
    GetGameJob.perform_now(13784)
    GetGameJob.perform_now(25299)
    GetGameJob.perform_now(22963)
    GetPublisherJob.perform_now(2)
  end

  it 'gets a publisher' do
    expect(Publisher.all.length).to eq 4
    expect(Publisher.first.company_id).to eq 2
    expect(Publisher.first.game_id).to eq 13784
    expect(Publisher.last.game_id).to eq 22975
  end
end
