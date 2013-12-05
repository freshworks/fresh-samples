#Get the survey result for the ticket.
require 'rubygems'
require "rest_client"
require 'json'


# rating possible values : [1=Awesome,2=Just Okay,3=Not Good]
#Specify your [ticket_id] in the below URL with your ticket id
# site = RestClient::Resource.new('http://yourcompany.domain.com/helpdesk/tickets/[ticket_id]/surveys.json',"sample@freshdesk.com","test")
site = RestClient::Resource.new('http://domain.freshdesk.com/helpdesk/tickets/91/surveys.json',"sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "#{response} ::: #{response.code}"
