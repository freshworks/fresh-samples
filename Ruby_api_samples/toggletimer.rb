#start/stop timer for timesheets
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd

#toggling the timer. If the timer_running is true, this will be set to false and vice-versa.
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/time_sheets/[id]/toggle_timer.json","sample@freshdesk.com","test")

response = site.put(:content_type=>"application/json",:content_length=>0)

puts "response: #{response.code} \n #{response.body}"

