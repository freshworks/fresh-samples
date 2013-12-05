#update a customer
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd
# site = RestClient::Resource.new("http://yourcompany.domain.com/customers/[id].json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/customers/14.json","sample@freshdesk.com","test")

# only name is mandatory for the customers. 
response = site.put({:customer=>{:note=>"ISO 9001 Company",:domains=>"abcde",:description=>"East Coast, USA"},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"

