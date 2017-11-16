RSpec.describe GetDeveloperJob, vcr: true, type: :job do

  before(:each) do
    create(:company, id: 20)
    create(:game, id: 21)
    create(:game, id: 1377)
    GetDeveloperJob.perform_now(20)
  end

  it 'gets a developer' do
    expect(Developer.where(company_id: 20).length).to eq 2
  end
end
