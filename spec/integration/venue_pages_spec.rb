require('spec_helper')

describe('Band Tracker: the venue pages', @config) do

  describe('initial view', {:js => true}) do
    it('greets the user with venue creation options') do
      visit('/')
      find('#venues_button').click
      expect(page).to have_content('You don\'t have any venues, yet!')
      expect(page).to have_content('Add a New Venue')
    end
  end

  describe('creating a venue') do
    it('allows the user to create a new venue') do
      visit('/venues')
      fill_in('venue_name', :with => 'cervante\'s masterpiece ballroom')
      click_button('Add')
      expect(page).to have_content('Cervante\'s Masterpiece Ballroom')
    end
  end

  describe('viewing all venues') do
    it('allows the users to view all created venues') do
      venue_one = Venue.create({:name => 'Glasgow Royal Concert Hall'})
      venue_two = Venue.create({:name => 'Portland International Raceway'})
      visit('/venues')
      expect(page).to have_content('Your Venues:')
      expect(page).to have_content(venue_one.name())
      expect(page).to have_content(venue_two.name())
    end
  end
end
