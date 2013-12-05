#view tickets
require "rubygems"
require "rest_client"
require "json"

#you can also use apikey instead of user/passwd
# to view all tickets
#pass 'page' attribute to see the specific page. Default only 30 tickets per page is listed
# site = RestClient::Resource.new("http://yourcompany.freshdesk.com/helpdesk/tickets.json?page=1","sample@freshdesk.com","test")

#view specific tickets
site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets/[id].json","sample@freshdesk.com","test")

#avatar_attributes is the property to set the image file.
response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"

