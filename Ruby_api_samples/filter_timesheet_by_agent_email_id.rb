#Filter timesheet by agent id and email

require "rubygems"
require "rest_client"
require "json"

#sample with agent email
#site=RestClient::Resource.new("http://company.domain.com/helpdesk/time_sheets.json?email=test@freshdesk.com","test@freshdesk.com","password")
#Here agent_id refers to the user_id of the agent

site=RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/time_sheets.json?agent_id=16","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"
