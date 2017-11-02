RSpec.describe Company, type: :model do
  it 'has a working factory' do
    expect(build(:company).save).to be true
  end
  it 'checks the company has a valid website' do
    expect(build(:company, name: "").save).to be false
  end
end
