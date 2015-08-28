require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues) }
  it { should validate_presence_of(:name) }

  it('should be saved with capitalized words no matter how they are entered') do
    lowercase_band = Band.create({:name => 'the sonics'})
    expect(lowercase_band.name()).to(eq('The Sonics'))
  end

  describe('#modifier') do
    it('should return appropriate modifier for a plural band name') do
      band = Band.create({:name => 'The Sonics'})
      expect(band.modifier()).to(eq('have'))
    end
    it('should return appropriate modifier for a singular band name') do
      band = Band.create({:name => 'Jessica Pratt'})
      expect(band.modifier()).to(eq('has'))
    end
  end
end
