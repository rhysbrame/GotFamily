require_relative( '../models/religion' )

get '/religions/' do
  redirect '/religions'
end

get '/religions' do
  @religions = Religion.all()
  erb(:'religions/index')
end

get '/religions/new' do
  erb ( :'religions/new')
end

post '/religions' do
  @religion = Religion.new(params)
  @religion.save
  redirect '/religions'
end

get '/religions/:id' do
  @religion = Religion.find(params[:id])
  erb ( :'religions/show' )
end

get '/religions/:id/edit' do
  @religion = Religion.find(params[:id])
  erb ( :'religions/edit')
end

post '/religions/:id' do
  @religion = Religion.new(params)
  @religion.update
  erb ( :'religions/show' )
end