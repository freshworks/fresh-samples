#Filter tickets by requester_email .
require "rubygems"
require "rest_client"
require "json"
require "cgi"

# Your freshdesk domain
fd_domain = 'YOUR_DOMAIN'

# It could be either your user name or api_key.
user_name_or_api_key = 'YOUR_API_KEY'

# If you have given api_key, then it should be x. If you have given user name, it should be password
password_or_x = 'X'

# email should be properly encoded if it has any special characters.
email = CGI::escape("email+112@emailtest.email")

# example with requester_id api_path = 'api/v2/tickets?requester_id=23'
api_path = "api/v2/tickets?email=#{email}"

api_url  = "https://#{fd_domain}.freshdesk.com/#{api_path}"

site = RestClient::Resource.new(api_url, user_name_or_api_key, password_or_x)

begin
  response = site.get(:accept=>'application/json')
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue RestClient::Exception => exception
  puts "API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id"
  puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
  puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
end