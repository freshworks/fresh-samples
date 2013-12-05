#view all posts in a topic

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/69387/forums/275021/topics/35649.json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"