#Assign an agent to the ticket
require "rubygems"
require "rest_client"
require "json"

#here you need to specify the user_id of the agent to whom this ticket is to be assigned.
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/assign.json?responder_id=[user_id]","sample@freshdesk.com","test")

#status property is mandatory.
response = site.put({},:content_length=>0)

puts "response: #{response.code} \n #{response.body}"
