#update forum category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/3.json","sample@freshdesk.com","test")

response = site.put({:forum_category=>{:name=>"testinge forum",:description=>"testupdates"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"