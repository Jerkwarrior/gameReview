RSpec.describe GetPublisherJob, vcr: true, type: :job do

  before(:each) do
    GetCompanyJob.perform_now(70)
    @company = Company.where(id: 70)
  end

  xit 'gets a publisher' do
    expect(Publisher.first.company_id).to eq 70
  end
end
