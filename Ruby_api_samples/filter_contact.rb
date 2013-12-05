#Filter contact

require "rubygems"
require "rest_client"
require "json"
	
#contacts can also be filtered by name,phone,email etc

params = URI.escape("query=name is test")

puts "#{params}"

#state can be of type [verified/unverified/all/deleted]

site=RestClient::Resource.new("http://localhost:3000/contacts.json?#{params}&state=all","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
