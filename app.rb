require 'sinatra'
require 'httparty'

get '/' do
    erb :index
end

post '/search' do
    @query = params[:query]
    
end