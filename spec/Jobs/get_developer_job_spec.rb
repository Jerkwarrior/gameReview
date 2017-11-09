RSpec.describe GetDeveloperJob, vcr: true, type: :job do

  before(:each) do
    GetCompanyJob.perform_now(20)
    GetGameJob.perform_now(21)
    GetGameJob.perform_now(1377)
    GetDeveloperJob.perform_now(20)
  end

  it 'gets a developer' do
    expect(Developer.all.length).to eq 2
    expect(Developer.first.company_id).to eq 20
    expect(Developer.first.game_id).to eq 21
    expect(Developer.last.game_id).to eq 1377
  end
end
