#Create a ticket with custom fields, cc_emails attributes.
require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets.json","sample@freshdesk.com","test")

response = site.post({:helpdesk_ticket=>{:description=>"Test ticket creation with attachments",:subject=>"new ticket sample",:email=>"test@abc.com",:custom_field=>{:license_1=>"ABCDEF"}},:cc_emails=>"myemail@gmail.com,test@gmail.com"},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"