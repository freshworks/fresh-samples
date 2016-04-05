#Update ticket properties.
require "rubygems"
require "rest_client"
require "json"

# Your freshdesk domain
fd_domain = 'YOUR_DOMAIN'

# It could be either your user name or api_key.
user_name_or_api_key = 'YOUR_API_KEY'

# If you have given api_key, then it should be x. If you have given user name, it should be password
password_or_x = 'X'

ticket_id = 12

json_payload = {:status=>4}.to_json

api_path = "api/v2/tickets"

ticket_id = 12

api_url  = "https://#{fd_domain}.freshdesk.com/#{api_path}/#{ticket_id}"

site = RestClient::Resource.new(api_url, user_name_or_api_key, password_or_x)

begin
  response = site.put(json_payload, :content_type=>'application/json')
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue RestClient::Exception => exception
  puts "API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id"
  puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
  puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
end