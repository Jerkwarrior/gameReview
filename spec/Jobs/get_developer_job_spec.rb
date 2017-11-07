RSpec.describe GetDeveloperJob, vcr: true, type: :job do

  before(:each) do
    GetCompanyJob.perform_now(70)
    @company = Company.where(id: 70)
  end

  xit 'gets a developer' do
    expect(Developer.first.company_id).to eq 70
  end
end
