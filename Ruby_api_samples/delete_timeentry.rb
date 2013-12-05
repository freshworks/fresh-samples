#delete time_entry
require "rubygems"
require "rest_client"

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/time_sheets/[id].xml","sample@freshdesk.com","test")

response = site.delete(:accept=>"application/xml")
puts "response: #{response.code} \n #{response.body}"
