#Update ticket properties.(both default and custom properties.)
require "rubygems"
require "rest_client"
require "json"

fd_domain = "domain.freshdesk.com"

api_key_or_user_name = "sample@freshdesk.com"

password_or_x = "test"

ticket_id = 12

json_payload = {:status=>4}.to_json

#here you need to specify the ticket id as part of the URL "https://yourcompany.domain.com/api/v2/tickets/ticketid" [REST standards for update]
site = RestClient::Resource.new("https://#{fd_domain}/api/v2/tickets/#{ticket_id}.json", "#{api_key_or_user_name}","#{password_or_x}")

begin
  response = site.put(json_payload, :content_type=>"application/json")
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue => exception
  puts "response_code: #{exception.response.code} \nresponse_headers: #{exception.response.headers} \nresponse_body: #{exception.response.body} \n"
end