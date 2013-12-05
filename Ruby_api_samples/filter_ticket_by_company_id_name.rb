#Filter ticket by company id and name

require "rubygems"
require "rest_client"
require "json"


#filter_name types: all_tickets, new_my_open, monitored_by, spam, deleted
#sample with company_name
#site = RestClient::Resource.new("http://company.domain.com/helpdesk/tickets.json?company_name=freshdesk&filter_name=all_tickets","test@freshdesk.com","password")

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets.json?company_id=1&filter_name=all_tickets","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"