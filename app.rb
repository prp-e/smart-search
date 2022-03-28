require 'sinatra'
require 'httparty'
require 'json'

get '/' do
    erb :index
end

post '/search' do
    @query = params[:query]
    @url = ENV['SEARP_API']
    @query_url = @url + @query

    @results = HTTParty.get(@query_url)
    @results = JSON.parse(@results.body)
    @results = @results['organic_results']

    redirect_to '/search'
end

get '/search'
    erb :search
end 