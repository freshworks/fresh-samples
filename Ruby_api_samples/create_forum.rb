#create forum under a category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/3/forums.json","sample@freshdesk.com","test")

#Forum type: 1-Questions,2-Ideas,3-Problems,4-Announcements	
#Forum_visibility: 1-All,2-Logged in users,3-Agents, 4- selected companies[need to provide customer_ids for this option]

response = site.post({:forum=>{:description=>"fresh forums",:forum_type=>2,:forum_visibility=>4,:customer_forums_attributes=>{:customer_id=>[1,2]},:name=>"fresh forums"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"