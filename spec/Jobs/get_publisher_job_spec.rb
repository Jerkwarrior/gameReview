RSpec.describe GetPublisherJob, vcr: true, type: :job do

  before(:each) do
    create(:company, id: 2)
    create(:game, id: 22975)
    create(:game, id: 13784)
    create(:game, id: 25299)
    GetPublisherJob.perform_now(2)
  end

  it 'gets a publisher' do
    expect(Publisher.all.length).to eq 4
    expect(Publisher.first.company_id).to eq 2
    expect(Publisher.first.game_id).to eq 13784
    expect(Publisher.last.game_id).to eq 22975
  end
end
