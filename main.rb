require 'sinatra'
require "json"

set :menu, [
  {title: "Home",
   route: "/"},
  {title: "About",
   route: "/about"},
  {title: "Newsletter",
   route: "/newsletter"},
   {title: "Gallery",
    route: "/gallery"}
]

get '/' do
  erb :index
end

# get '/contact' do
#   # this is where we will tell about us. can be a comment box giving suggestions. etc.
#   erb :contact
# end
#
# get '/newsletter' do
#   erb :newsletter
# end
#
# get '/gallery' do
#   erb :gallery
# end
# Below, code generates each link hardcoded above here
settings.menu[1..-1].each do |item|
  get item[:route] do
    erb item[:route][1..-1].to_sym
  end
end
