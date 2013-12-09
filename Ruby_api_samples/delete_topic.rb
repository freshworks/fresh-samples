#delete a topic in forums

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,forum_id,topic_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/4/forums/11/topics/4.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id]/topics/[topic_id].json","sample@freshdesk.com","test")

response=site.delete(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"