require 'sinatra'


get '/' do
  erb :index
end

get '/contact' do
  erb :contact
end

get '/newsletter' do
  erb :newsletter
end

get '/gallery' do
  erb :gallery
end
