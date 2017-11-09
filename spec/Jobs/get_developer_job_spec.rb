RSpec.describe GetDeveloperJob, vcr: true, type: :job do

  before(:each) do
    create(:company, id: 20)
    create(:game, id: 21)
    create(:game, id: 1377)
    GetDeveloperJob.perform_now(20)
  end

  it 'gets a developer' do
    expect(Developer.all.length).to eq 2
    expect(Developer.first.company_id).to eq 20
    expect(Developer.first.game_id).to eq 21
    expect(Developer.last.game_id).to eq 1377
  end
end
