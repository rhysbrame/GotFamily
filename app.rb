require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/character_controller')
require_relative('./controllers/house_controller')
require_relative('./controllers/allegiance_controller')
require_relative('./controllers/religion_controller')
require_relative('./controllers/map_controller')

get '/' do
  erb(:index)
end

get '' do
  redirect '/'
end