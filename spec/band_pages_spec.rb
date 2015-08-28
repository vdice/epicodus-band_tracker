require('spec_helper')

describe('the band pages', {:type => :feature}) do

  describe('initial view') do
    it('greets the user with band management options') do
      visit('/')
      click_link('Manage Bands')
      expect(page).to have_content('You don\'t have any bands to manage, yet!')
      expect(page).to have_content('Add a New Band')
    end
  end

  describe('adding a new band') do
    it('allows the user to add a new band') do
      visit('/bands')
      fill_in('band_name', :with => 'the sonics')
      click_button('Add')
      expect(page).to have_content('Your Bands:')
      expect(page).to have_content('The Sonics')
    end
  end

  describe('deleting a band') do
    it('allows the user to delete a band') do
      band = Band.create({:name => 'The Sonics'})
      visit('/bands')
      click_link(band.name())
      click_button('Delete')
      expect(page).to have_content('You don\'t have any bands to manage, yet!')
    end
  end

  describe('updating a band\'s name') do
    it('allows the user to update a band\'s name') do
      band = Band.create({:name => 'The Sonics'})
      visit("/bands/#{band.id()}")
      fill_in('band_name', :with => 'Thee Sonics')
      click_button('Update')
      expect(page).to have_content('Thee Sonics')
    end
  end

  describe('updating a band\'s list of venues') do
    it('allows the user to update a band\'s list of venues') do
      band = Band.create({:name => 'The Sonics'})
      venue_one = Venue.create({:name => 'Glasgow Royal Concert Hall'})
      venue_two = Venue.create({:name => 'Portland International Raceway'})
      visit("/bands/#{band.id()}")
      expect(page).to have_content(band.name() + ' hasn\'t played any venues yet.')
      find('#venue_select').find("#option_#{venue_one.id()}").select_option
      click_button('Add')
      expect(page).to have_selector('#venue_listing', text: venue_one.name())
      expect(page).to_not have_selector('#venue_listing', text: venue_two.name())
    end
  end
end
