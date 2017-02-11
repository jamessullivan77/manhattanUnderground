require 'sinatra'
require 'sendgrid-ruby'
require 'ruby_http_client'

get '/' do
  erb :index
end

get '/contact' do
  erb :contact
end

get '/newsletter' do
  erb :newsletter
end
##########################################
#Collecting emails Using Sendgrid
##########################################
post '/newsletter' do 
	# erb :newsletter


# fistName = params[:first_name]
# lastName = params[:last_name]
subject = "#{params[:first_name]} #{params[:last_name]}"
from = SendGrid::Email.new email: params[:email]
to = SendGrid::Email.new(email: "jsully77@gmail.com")

content = SendGrid::Content.new(
	type: "text/plain", 
	value: "My name is #{params[:first_name]} and I would Like to receive your news letter as well as more information about #{params[:ocupation]}!" 
	)
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])

response = sg.client.mail._('send').post(request_body: mail.to_json)
    #params.inspect
    response.inspect

puts response

redirect ('/newsletter')
end

get '/gallery' do
  erb :gallery
end
