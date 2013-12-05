#@author : John Paul.H
#Create a user,along with the avatar image.
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd
site = RestClient::Resource.new("http://domain.freshdesk.com/contacts.json","sample@freshdesk.com","test")

#avatar_attributes is the property to set the image file.
response = site.post({:user=>{:name=>"newcustomer1",:email=>"newcustomer1@freshdesk.com","avatar_attributes"=>{:content=>File.open("mypic.jpg")}},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"

