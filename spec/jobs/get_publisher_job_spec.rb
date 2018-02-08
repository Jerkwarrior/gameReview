RSpec.describe GetPublisherJob, vcr: true, type: :job do

  before(:each) do
    create(:company, id: 2)
    create(:game, id: 22975)
    create(:game, id: 13784)
    create(:game, id: 25299)
    create(:game, id: 22963)
    GetPublisherJob.perform_now(2)
  end

  it 'gets a publisher' do
    expect(Publisher.where(company_id: 2).length).to eq 4
  end
end
