#Create a ticket with attachments. 
require 'rubygems'
require "rest_client"
require 'json'

fd_domain = "domain.freshdesk.com"

api_key_or_user_name = "sample@freshdesk.com"

password_or_x = "test"

#attachments should be of the form array of Hash with files mapped to the key 'resource'.
multipart_payload = { :status => 2, 
                      :priority => 1, 
                      :email=>"test@xyz.com",
                      :description_html=>"<strong>Hi there</strong>Ticket with attachment",
                      :subject=>"hello",
                      :attachments=>[File.new("/path/to/your/file.png", 'rb'), File.new("/path/to/your/file2.png", 'rb')]}

site = RestClient::Resource.new('https://#{fd_domain}/api/v2/tickets.json',"#{api_key_or_user_name}","#{password_or_x}")

begin
  response = site.post(multipart_payload)
  puts "response_code: #{response.code} \nresponse_body: #{response.body} \n"
rescue => exception
  puts "response_code: #{exception.response.code} \nresponse_headers: #{exception.response.headers} \nresponse_body: #{exception.response.body} \n"
end