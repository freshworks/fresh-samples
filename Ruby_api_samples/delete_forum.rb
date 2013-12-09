#delete forums in a category

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id and forum_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/2/forums/5.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id].json","sample@freshdesk.com","test")

response=site.delete(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"