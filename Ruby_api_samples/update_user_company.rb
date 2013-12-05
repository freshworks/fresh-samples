#@author : John Paul.H
#Update a user with the company details
require "rubygems"
require "rest_client"
require "json"

contact_id = 3213088

#you can also use apikey instead of user/passwd
site = RestClient::Resource.new("http://domain.freshdesk.com/contacts/#{contact_id}.json","sample@freshdesk.com","test")

#you can update the company details of the user using the customer_id/ customer attribute.

#Using customer attribute, pass the existing company name if not present new company will be created.
# site.put({:user=>{:name=>"newcustomer11",:email=>"newcustomer1@freshdesk.com",:customer=>"abc"},:content_type=>"application/json"})

#Using customer_id attribute, there is no validation for existing customer id so if wrongly assigned you will not see any customer associated.
response = site.put({:user=>{:name=>"newcustomer11",:email=>"newcustomer1@freshdesk.com",:customer_id=>300},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"