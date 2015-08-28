require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

# View/Add Bands

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  Band.create({:name => params.fetch('band_name')})
  @bands = Band.all()
  erb(:bands)
end
