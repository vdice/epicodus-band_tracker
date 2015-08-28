ENV['RACK_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
require('capybara/poltergeist')
require('phantomjs')
require('tilt/erb')
require('./app')

# RSpec/Unit config
RSpec.configure do |config|
  config.after(:each) do
    Band.all().each() do |band|
      band.destroy()
    end

    Venue.all().each() do |venue|
      venue.destroy()
    end
  end
end

# Capybara/Integration config
Capybara.app = Sinatra::Application

# Poltergeist driver setup for integration tests that depend on javascript
@config = {:type => :feature}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :phantomjs => Phantomjs.path, :js_errors => false)
end
Capybara.javascript_driver = :poltergeist
