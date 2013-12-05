#create topics in forum

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/2/forums/5/topics.json","sample@freshdesk.com","test")

#set sticky and locked to be true or false with 1 or 0

response = site.post({:topic=>{:sticky=>0,:locked=>0,:title=>"test topic for freshdesk",:body_html=>"This is the first topic in this post"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"