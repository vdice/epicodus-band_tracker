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
      expect(page).to have_content('The Sonics')
    end
  end
end
