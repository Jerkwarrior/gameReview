RSpec.describe GetCompanyJob, vcr: true, type: :job do

  before(:each) do
    GetCompanyJob.perform_now(70)
    @company = Company.where(id: 70)
  end

  it 'gets a company' do
    expect(@company.length).to eq 1
  end

  it 'gets the company name' do
    expect(@company.first.name).to eq 'Nintendo'
  end

  it 'gets the company slug' do
    expect(@company.first.slug).to eq "nintendo"
  end

  it "gets the companies country" do
    expect(@company.first.country).to eq 392
  end

  it 'gets the company description' do
    expect(@company.first.description).to_not eq nil
  end

  xit 'gets the company logo' do
    expect(@company.first.logo_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/tglfbjdfbwjs6twvz6ga.jpg"
  end

end
