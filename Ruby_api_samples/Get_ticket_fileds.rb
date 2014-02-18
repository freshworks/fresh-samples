#Get all ticket fields
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

site = RestClient::Resource.new("http://domain.freshdesk.com/ticket_fields.json","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"

