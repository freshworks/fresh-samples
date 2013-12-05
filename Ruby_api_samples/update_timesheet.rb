#update time sheets
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

#update time_sheets.
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/helpdesk/tickets/62/time_sheets/4.json","sample@freshdesk.com","test")
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[ticket_id]/time_sheets/[id].json","sample@freshdesk.com","test")


response = site.put({:time_entry=>{:note=>"testing"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"

