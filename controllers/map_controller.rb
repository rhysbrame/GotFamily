get '/maps/' do
  redirect '/maps'
end

get '/maps' do
  erb(:'maps/index')
end