require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:name) }

  it('should be saved with capitalized words no matter how they are entered') do
    lowercase_band = Band.create({:name => 'the sonics'})
    expect(lowercase_band.name()).to(eq('The Sonics'))
  end
end
