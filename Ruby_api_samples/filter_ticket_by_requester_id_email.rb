#Filter ticket by requester id and email

require "rubygems"
require "rest_client"
require "json"

#filter_name can be of type (all_tickets, new_my_open, monitored_by, spam, deleted)

# sample with requester_id
# site=RestClient::Resource.new("http://company.domain.com/helpdesk/tickets.json?requester_id=8888594&filter_name=all_tickets","sample@freshdesk.com","password")

site=RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets.json?email=test@test.com&filter_name=all_tickets","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"