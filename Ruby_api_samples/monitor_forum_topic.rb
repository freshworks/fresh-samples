#monitor a forum topic

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/2/forums/5/topics/1/monitorship.json","sample@freshdesk.com","test")

response=site.post(:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"