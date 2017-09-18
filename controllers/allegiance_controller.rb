require_relative( '../models/allegiance' )
require_relative( '../models/house' )

get '/allegiances/' do
  redirect '/allegiances'
end

get '/allegiances' do
  @allegiances = Allegiance.all()
  @houses = House.all()
  erb(:'allegiances/index')
end

get '/allegiances/new' do
  erb ( :'allegiances/new')
end

post '/allegiances' do
  @allegiance = Allegiance.new(params)
  @allegiance.save
  redirect '/allegiances'
end

get '/allegiances/:id' do
  @allegiance = Allegiance.find(params[:id])
  @houses = House.all()
  erb ( :'allegiances/show' )
end

get '/allegiances/:id/edit' do
  @allegiance = Allegiance.find(params[:id])
  erb ( :'allegiances/edit')
end

post '/allegiances/:id' do
  @allegiance = Allegiance.new(params)
  @allegiance.update
  erb ( :'allegiances/show' )
end