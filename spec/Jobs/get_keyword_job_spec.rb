RSpec.describe GetKeywordJob, vcr: true, type: :job do

  it 'gets a keyword' do
    GetKeywordJob.perform_now(1)
    expect(Keyword.where(id: 1).length).to eq 1
  end

  it 'gets the keyword name' do
    GetKeywordJob.perform_now(1)
    expect(Keyword.where(id: 1).first.name).to eq 'modern warfare'
  end
end
