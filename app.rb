require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

# Create/Read Bands

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  Band.create({:name => params.fetch('band_name')})
  @bands = Band.all()
  erb(:bands)
end

# Update/Delete Band

get('/bands/:id') do
  @venues = Venue.all()
  @band = Band.find(params.fetch('id').to_i())
  erb(:band)
end

delete('/bands/:id') do
  Band.find(params.fetch('id').to_i()).destroy()
  redirect('/bands')
end

patch('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i())
  new_band_name = params.fetch('band_name')
  @band.update({:name => new_band_name})
  redirect("/bands/#{@band.id()}")
end

patch('/bands/:id/add_venue') do
  @band = Band.find(params.fetch('id').to_i())
  new_venue = Venue.find(params.fetch('venue_select').to_i())
  @band.venues.push(new_venue)
  redirect("/bands/#{@band.id()}")
end

# Create/Read Venues

get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  Venue.create({:name => params.fetch('venue_name')})
  @venues = Venue.all()
  erb(:venues)
end
