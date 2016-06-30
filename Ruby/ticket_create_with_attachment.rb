#Create a ticket with attachments.
require 'rubygems'
require 'rest_client'
require 'json'

# Your freshdesk domain
freshdesk_domain = 'YOUR_DOMAIN'

# It could be either your user name or api_key.
user_name_or_api_key = 'YOUR_API_KEY'

# If you have given api_key, then it should be x. If you have given user name, it should be password
password_or_x = 'X'

#attachments should be of the form array of Hash with files mapped to the key 'resource'.
multipart_payload = { status: 2,
                      priority: 1,
                      email: 'test@xyz.com',
                      description: '<strong>Hi there</strong>Ticket with attachment',
                      subject: 'hello',
                      attachments: [File.new('/path/to/your/file.png', 'rb'), File.new('/path/to/your/file2.png', 'rb')]}

freshdesk_api_path = 'api/v2/tickets'

freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

site = RestClient::Resource.new(freshdesk_api_url, user_name_or_api_key, password_or_x)

begin
  response = site.post(multipart_payload)
  puts "response_code: #{response.code} \nLocation Header: #{response.headers[:Location]} \nresponse_body: #{response.body} \n"
rescue RestClient::Exception => exception
  puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
  puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
  puts "Response Code: #{exception.response.code} \nResponse Body: #{exception.response.body} \n"
end