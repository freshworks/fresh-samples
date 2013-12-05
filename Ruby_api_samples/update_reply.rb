#update reply/comment in a topic

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/posts/2.json?forum_id=11&category_id=4&topic_id=1","sample@freshdesk.com","test")

response=site.put({:post=>{:body_html=>"123"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"