require('spec_helper')

describe('Band Tracker: the band pages', @config) do

  describe('initial view', {:js => true}) do
    it('greets the user with band management options') do
      visit('/')
      find('#bands_button').click
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

  describe('viewing all bands') do
    it('allows the users to view all created bands') do
      band_one = Band.create({:name => 'Homeshake'})
      band_two = Band.create({:name => 'Cate Le Bon'})
      visit('/bands')
      expect(page).to have_content('Your Bands:')
      expect(page).to have_content(band_one.name())
      expect(page).to have_content(band_two.name())
    end
  end

  describe('deleting a band') do
    it('allows the user to delete a band') do
      band = Band.create({:name => 'The Sonics'})
      visit('/bands')
      click_link(band.name())
      find('#delete_button').click
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
      expect(page).to have_content("#{band.name()} #{band.modifier()}n't played any venues yet.")
      find('#venue_select').find("#option_#{venue_one.id()}").select_option
      click_button('Add')
      expect(page).to have_selector('#venue_listing', text: venue_one.name())
      expect(page).to_not have_selector('#venue_listing', text: venue_two.name())
    end

    it('will not add a duplicate entry') do
      band = Band.create({:name => 'The Sonics'})
      venue = Venue.create({:name => 'Glasgow Royal Concert Hall'})
      visit("/bands/#{band.id()}")
      find('#venue_select').find("#option_#{venue.id()}").select_option
      click_button('Add')
      find('#venue_select').find("#option_#{venue.id()}").select_option
      click_button('Add')
      expect(page).to_not have_selector('#venue_listing > ul > li:nth-child(2)')
    end
  end
end
