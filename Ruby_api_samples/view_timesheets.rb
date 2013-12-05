#view time sheets
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

# fetch by timesheet_id.
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/helpdesk/tickets/[ticket_id]/time_sheets/[id].json","sample@freshdesk.com","test")

# view by tickets (fetch timesheets for the ticket)
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/helpdesk/tickets/[ticket_id]/time_sheets.json","sample@freshdesk.com","test")

#view all time_sheets.
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/time_sheets.json","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"

