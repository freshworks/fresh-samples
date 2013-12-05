#Filter timesheet by cutomer name,email and id

require "rubygems"
require "rest_client"
require "json"

#sample with customer_name
#site=RestClient::Resource.new("http://company.domain.com/helpdesk/time_sheets.json?customer_name=Freshdesk","test@freshdesk.com","password")
#sample with email
#site=RestClient::Resource.new("http://company.domain.com/helpdesk/time_sheets.json?contact_email=test@freshdesk.com","test@freshdesk.com","password")

site=RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/time_sheets.json?customer_name=Test","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
