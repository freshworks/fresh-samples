#Create a time_entry for a ticket
require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/time_sheets.json","sample@freshdesk.com","test")

#default billable =false
#user_id can be any of your agent's user_id. this is the only mandatory attribute.
#hhmm can be used to set a time spent, setting this will by default disable timer_running to false. 
response = site.post({:time_entry=>{:user_id=>1234,:billable=>false,:hhmm=>10.40,:note=>"new time entry sample"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"

