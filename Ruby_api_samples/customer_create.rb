#Create a customer
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd
# site = RestClient::Resource.new("http://yourcompany.domain.com/customers.json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/customers.json","sample@freshdesk.com","test")

# only name is mandatory for the customers. 
response = site.post({:customer=>{:name=>"abcd",:domains=>"abcd",:description=>"My new company"},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"

