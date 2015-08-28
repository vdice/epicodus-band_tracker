require('spec_helper')

describe('Band Tracker: general navigation', @config) do

  describe('going home', {:js => true}) do
    it('allows the user to return home from venues page') do
      visit('/venues')
      find('#home_button').click
      expect(page).to have_selector('#venues_tab')
    end
    it('allows the user to return home from bands page') do
      visit('/bands')
      find('#home_button').click
      expect(page).to have_selector('#bands_tab')
    end
    it('allows the user to return home from a band page') do
      band = Band.create({:name => 'Jessica Pratt'})
      visit("/bands/#{band.id()}")
      find('#home_button').click
      expect(page).to have_selector('#bands_tab')
    end
  end
end
