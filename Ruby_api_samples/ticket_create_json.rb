#Create a ticket with custom fields, cc_emails attributes.
require "rubygems"
require "rest_client"
require "json"

fd_domain = "domain.freshdesk.com"

api_key_or_user_name = "sample@freshdesk.com"

password_or_x = "test"

json_payload = { :status => 2, 
                 :priority => 1, 
                 :description=>"test ticket creation with attachments",
                 :subject=>"new ticket sample",:email=>"test@abc.com",
                 :cc_emails=>["myemail@testexample.com","test@testexample.com"],
                 :email => "test@test.com" 
               }.to_json

site = RestClient::Resource.new("https://#{fd_domain}/api/v2/tickets", "#{api_key_or_user_name}", "#{password_or_x}")

begin
  response = site.post(json_payload, :content_type=>"application/json")
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue => exception
  puts "response_code: #{exception.response.code} \nresponse_headers: #{exception.response.headers} \nresponse_body: #{exception.response.body} \n"
end