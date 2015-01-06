#view all forums in a category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/discussions/categories.json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"