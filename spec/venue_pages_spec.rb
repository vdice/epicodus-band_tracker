require('spec_helper')

describe('the venue pages', {:type => :feature}) do

  describe('initial view') do
    it('greets the user with venue creation options') do
      visit('/')
      click_link('Manage Venues')
      expect(page).to have_content('You don\'t have any venues, yet!')
      expect(page).to have_content('Add a New Venue')
    end
  end

  describe('creating a venue') do
    it('allows the user to create a new venue') do
      visit('/venues')
      fill_in('venue_name', :with => 'cervante\'s masterpiece ballroom')
      click_button('Add')
      expect(page).to have_content('Your Venues:')
      expect(page).to have_content('Cervante\'s Masterpiece Ballroom')
    end
  end

end
