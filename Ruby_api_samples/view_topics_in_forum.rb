#view topics in a forum

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,forum_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/32/forums/534.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id].json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body}"