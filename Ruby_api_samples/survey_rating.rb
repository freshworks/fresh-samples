#Post a rating for the ticket response
require 'rubygems'
require "rest_client"
require 'json'


# rating possible values : [1=Awesome,2=Just Okay,3=Not Good]
#Specify your [ticket_id] in the below URL with your ticket id 
# site = RestClient::Resource.new('http://yourcompany.freshdesk.com/helpdesk/tickets/[ticket_id]/surveys/rate.json?rating=[rate_val]',"sample@freshdesk.com","test")
site = RestClient::Resource.new('http://domain.freshdesk.com/helpdesk/tickets/91/surveys/rate.json?rating=1',"sample@freshdesk.com","test")

#attachments should be of the form array of Hash with files mapped to the key 'resource'. 
payload = {:feedback=>"fast response"}

response = site.post(payload,:content_type=>"application/json")


puts "#{response} ::: #{response.code}"
