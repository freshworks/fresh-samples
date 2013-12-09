#view all groups

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://localhost:3000/groups.json","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"