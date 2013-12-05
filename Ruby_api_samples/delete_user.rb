#Delete Contact
require "rubygems"
require "rest_client"
require "json"

# eg:
#site = RestClient::Resource.new("http://mycompany.freshdesk.com/contacts/5123.json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/contacts/[user_id].json","sample@freshdesk.com","test")

response = site.delete(:accept=>"application/json")
puts "response: #{response.code} \n #{response.body}"
