require_relative( '../models/allegiance' )

get '/allegiances/' do
  redirect '/allegiances'
end

get '/allegiances' do
  @allegiances = Allegiance.all()
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