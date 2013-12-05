#@author : John Paul.H
#Create a ticket with attachments. I had my attachments in the current directory. Also using description_html
#to set the ticket content instead of description.
require 'rubygems'
require "rest_client"
require 'json'

site = RestClient::Resource.new('http://domain.freshdesk.com/helpdesk/tickets.json',"sample@freshdesk.com","test")

#attachments should be of the form array of Hash with files mapped to the key 'resource'.
temp = {:email=>"test@xyz.com",:description_html=>"<strong>Hi there</strong>Ticket with attachment",:subject=>"hello",:attachments=>{''=>[{:resource=>File.new("tommy.jpg", 'rb')},{:resource=>File.new("tommy1.jpg", 'rb')}]}}

response = site.post({:helpdesk_ticket=>temp},:content_type=>"application/json")


puts "#{response} ::: #{response.code}"