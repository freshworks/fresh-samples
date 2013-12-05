#Update contact properties.
require "rubygems"
require "rest_client"
require "json"

# eg:
#site = RestClient::Resource.new("http://mycompany.freshdesk.com/contacts/5123.json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/contacts/[user_id].json","sample@freshdesk.com","test")

# response = site.put({:user=>{:name=>"newname",:customer_id=>8}},:content_type=>"application/json")

response = site.put({:user=>{:name=>"newname",:email=>"newmail@abc.com"}},:content_type=>"application/json")
puts "response: #{response.code} \n #{response.body}"
