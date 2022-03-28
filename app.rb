require 'sinatra'
require 'httparty'

get '/' do
    erb :index
end

post '/search' do
    @query = params[:query]
    @url = ENV['SEARP_API']
    @query_url = @url + @query

    {:query => @query, :url => @query_url}.to_json
end