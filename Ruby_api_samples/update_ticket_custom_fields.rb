#@author : John Paul.H
#Update ticket custom_fields
require "rubygems"
require "rest_client"
require "json"

ticket_id = 56

#you can also use apikey instead of user/passwd
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/#{ticket_id}.json","sample@freshdesk.com","test")

#'Status' property values can be found @ http://freshdesk.com/api/tickets
#custom field name passed to api is not the one displayed on portal, the actual name stored in db can be 
#found by going to http://yourcompany.domain.com/ticket_fields.xml.
response = site.put({:helpdesk_ticket=>{:status=>3,:custom_field=>{:license_1234=>"AMD-123"}},:content_type=>"application/json"})

puts "response: #{response.code} \n #{response.body}"