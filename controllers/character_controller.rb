require_relative( '../models/character' )

get '/characters/' do
  redirect '/characters'
end

get '/characters' do
  @characters = Character.all()
  erb(:'characters/index')
end

get '/characters/new' do
  @houses = House.all()
  erb(:'characters/new')
end

post '/characters' do
  @character = Character.new(params)
  @character.save()
  redirect '/characters'
end

get '/characters/:id' do
  @character = Character.find(params[:id])
  erb( :'characters/show' )
end

get '/characters/:id/edit' do
  @houses = House.all
  @character = character.find(params[:id])
  erb ( :'characters/edit' )
end

post '/characters/:id' do
  @character = character.new(params)
  @character.update()
  erb ( :'characters/show' )
end

# No delete method necessary
# post '/characters/:id/delete' do
#   @character = character.find(params[:id])
#   @character.delete()
#   redirect '/characters'
# end