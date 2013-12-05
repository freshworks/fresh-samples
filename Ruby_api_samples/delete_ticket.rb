#Delete tickets.
require "rubygems"
require "rest_client"
require "json"

value = 58 #pass the ticket display_id here.
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/#{value}.json","sample@freshdesk.com","test")
response = site.delete(:accept=>"application/json")
puts "response: #{response.code} \n #{response.body}"
