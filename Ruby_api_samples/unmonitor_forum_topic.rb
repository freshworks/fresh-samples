#unmonitor a forum topic

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,forum_id,topic_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/2/forums/5/topics/1/monitorship.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id]/topics/[topic_id]/monitorship.json","sample@freshdesk.com","test")

response=site.delete(:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"