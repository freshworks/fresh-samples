#Restore a deleted ticket
require "rubygems"
require "rest_client"
require "json"

#here you need to specify the ticket id as part of the URL 
# eg: "http://yourcompany.domain.com/helpdesk/tickets/123/restore.json"

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/restore.json","sample@freshdesk.com","test")

#status property is mandatory.
response = site.put({},:content_length=>0)

puts "response: #{response.code} \n #{response.body}"
