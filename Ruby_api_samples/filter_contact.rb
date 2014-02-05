#Filter contact

require "rubygems"
require "rest_client"
require "json"
	
#contacts can also be filtered by phone,email etc

params = URI.escape("query=phone is 123245890")

puts "#{params}"

#state can be of type [verified/unverified/all/deleted]

site=RestClient::Resource.new("http://yourcompany.freshdesk.com/contacts.json?#{params}&state=all","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
