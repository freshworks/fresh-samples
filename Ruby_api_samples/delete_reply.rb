#delete a reply/comment in a topic

require "rubygems"
require "rest_client"
require "json"

# Need to specify post_id,forum_id,category_id,topic_id in url 
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/posts/6.json?forum_id=11&category_id=4&topic_id=4","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/posts/[post_id].json?forum_id=[id]&category_id=[id]&topic_id=[id]","sample@freshdesk.com","test")

response=site.delete(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"