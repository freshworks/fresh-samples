#create solution category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories.json","sample@freshdesk.com","test")

response = site.post({:solution_category=>{:name=>"new category",:description=>"Testing solution category"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"