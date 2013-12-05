#Adding thumbs up

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/support/articles/1/thumbs_up.json","sample@freshdesk.com","test")

response = site.put(:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"