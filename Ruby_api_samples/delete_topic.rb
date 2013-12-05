#delete a topic in forums

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/4/forums/11/topics/4.json","sample@freshdesk.com","test")

response=site.delete(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"