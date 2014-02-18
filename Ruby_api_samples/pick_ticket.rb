#Pick a ticket
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

#The current user will pick the ticket
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/pick_tickets.json","sample@freshdesk.com","test")

response=site.put(:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"

