#Filter timesheet by billable and start time

require "rubygems"
require "rest_client"
require "json"

#can filter timesheet by single param also.

site=RestClient::Resource.new("http://domain.freshdesk.com/time_sheets.json?start_date=2013-11-25","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
