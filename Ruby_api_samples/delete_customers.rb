#view customers
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

# site = RestClient::Resource.new("http://yourcompany.domain.com/customers/[id].json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/customers/5123.json","sample@freshdesk.com","test")

response = site.delete(:accept=>"application/json")
puts "response: #{response.code} \n #{response.body}"


