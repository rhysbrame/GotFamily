require_relative( '../models/house' )
require_relative( '../models/allegiance' )

get '/houses/' do
  redirect '/houses'
end

get '/houses' do
  @houses = House.all()
  erb(:'houses/index')
end

get '/houses/new' do
  erb ( :'houses/new')
end

post '/houses' do
  @house = House.new(params)
  @house.save
  redirect '/houses'
end

get '/houses/:id' do
  @house = House.find(params[:id])
  @houses = House.all()
  erb ( :'houses/show' )
end

get '/houses/:id/edit' do
  @house = House.find(params[:id])
  erb ( :'houses/edit')
end

# post '/houses/:id' do
#   @house = House.new(params)
#   @house.update
#   erb ( :'houses/show' )
# end

# No delete method necessary
# post '/houses/:id/delete' do
#   @house = House.find(params[:id])
#   @house.delete()
#   redirect '/house'
# end