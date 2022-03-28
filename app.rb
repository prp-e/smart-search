require 'sinatra'
require 'httparty'
require 'json'

get '/' do
    erb :index
end

post '/search' do

    headers = {"user-agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:98.0) Gecko/20100101 Firefox/98.0"}

    @query = params[:query]
    @url = ENV['SEARP_API']
    @query_url = @url + @query

    @results = HTTParty.get(@query_url, :headers => headers)
    @results = JSON.parse(@results.body)
    @results = @results['organic_results']

    erb :search
end