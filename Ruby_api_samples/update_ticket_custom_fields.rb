#@author : John Paul.H
#Update ticket custom_fields
require "rubygems"
require "rest_client"
require "json"

fd_domain = "domain.freshdesk.com"

api_key_or_user_name = "sample@freshdesk.com"

password_or_x = "test"

ticket_id = 776

#'Status' property values can be found @ http://developer.freshdesk.com/api/tickets
#custom field name passed to api is not the one displayed on portal, the actual name can be 
#found by going to https://yourcompany.domain.com/api/v2/ticket_fields
json_payload = {:custom_fields=>{:license=>"AMD-123"}}.to_json

#you can also use apikey instead of user/passwd
site = RestClient::Resource.new("https://#{fd_domain}/api/v2/tickets/#{ticket_id}","#{api_key_or_user_name}","#{password_or_x}")

begin
  response = site.put(json_payload, :content_type=>"application/json")
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue => exception
  puts "response_code: #{exception.response.code} \nresponse_headers: #{exception.response.headers} \nresponse_body: #{exception.response.body} \n"
end