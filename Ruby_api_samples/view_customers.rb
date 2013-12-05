#view customers
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

#to view all customers 
# site = RestClient::Resource.new("http://yourcompany.domain.com/customers.json","sample@freshdesk.com","test")

#to view specific customers
# site = RestClient::Resource.new("http://yourcompany.domain.com/customers/[id].json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/customers/3.json","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"

