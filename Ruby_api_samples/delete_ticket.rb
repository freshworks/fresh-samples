#Delete tickets.
require "rubygems"
require "rest_client"
require "json"

fd_domain = "domain.freshdesk.com"

api_key_or_user_name = "sample@freshdesk.com"

password_or_x = "test"

ticket_id = 58 #pass the ticket display_id here.
site = RestClient::Resource.new("https://#{fd_domain}/api/v2/tickets/#{ticket_id}.json","#{api_key_or_user_name}","#{password_or_x}")

begin
  response = site.delete(:accept=>"application/json")
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue => exception
  puts "response_code: #{exception.response.code} \nresponse_headers: #{exception.response.headers} \nresponse_body: #{exception.response.body} \n"
end