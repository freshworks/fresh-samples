#Create a private note with attachments. I had my attachments in the current directory.
#You can use body or body_html to set the note content.
#You can also pass the user_id if you want to add the note by that particular user.
require 'rubygems'
require "rest_client"
require 'json'

#Specify your [ticket_id] in the below URL with your ticket id for which you wish to add note.
site = RestClient::Resource.new('http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/conversations/note.json',"sample@freshdesk.com","test")
# site = RestClient::Resource.new('http://mycompany.freshdesk.com/helpdesk/tickets/91/conversations/note.json',"sample@freshdesk.com","test")

#you can set private to false to make it a public note
#attachments should be of the form array of Hash with files mapped to the key 'resource'. 
temp = {:body_html=>"<strong>Hi there</strong>Notes with attachment added 1",:private=>true,:attachments=>{''=>[{:resource=>File.new("tommy.jpg", 'rb')},{:resource=>File.new("tommy1.jpg", 'rb')}]}}

response = site.post({:helpdesk_note=>temp},:content_type=>"application/json")


puts "#{response} ::: #{response.code}"
