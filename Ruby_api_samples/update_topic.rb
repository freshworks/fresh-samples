#update topic information

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/2/forums/5/topics/1.json","sample@freshdesk.com","test")

#set sticky and locked to be true or false with 1 or 0

response=site.put({:topic=>{:sticky=>0,:locked=>1,:title=>"testing topic",:body_html=>"This is the first topic in this post"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"