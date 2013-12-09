#view all posts in a topic

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,forum_id,topic_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/1/forums/2/topics/3.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id]/topics/[topic_id].json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"