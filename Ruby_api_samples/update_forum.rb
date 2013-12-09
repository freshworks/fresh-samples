#update forum information

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,forum_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/categories/4/forums/11.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/[category_id]/forums/[forum_id].json","sample@freshdesk.com","test")

#Forum type: 1-Questions,2-Ideas,3-Problems,4-Announcements	
#Forum_visibility: 1-All,2-Logged in users,3-Agents, 4- selected companies[need to provide customer_ids for this option]

response=site.put({:forum=>{:name=>"test",:description=>"test description",:forum_type=>3,:forum_visibility=>2,:customer_forums_attributes=>{:customer_id=>[1,2]}}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"