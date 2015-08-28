require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }
  it { should validate_presence_of(:name) }

  it('should be saved with capitalized words no matter how they are entered') do
    lowercase_venue = Venue.create({:name => 'cervante\'s masterpiece ballroom'})
    expect(lowercase_venue.name()).to(eq('Cervante\'s Masterpiece Ballroom'))
  end
end
