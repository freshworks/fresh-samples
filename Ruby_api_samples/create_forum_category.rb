#create forum category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/discussions/categories.json","sample@freshdesk.com","test")

response = site.post({:forum_category=>{:name=>"testing",:description=>"test"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"

