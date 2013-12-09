#create group

require "rubygems"
require "rest_client"
require "json"


# Need to specify group_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/groups/2.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk/groups/[group_id].json","sample@freshdesk.com","test")

response = site.put({:group=>{:name=>"ne group",:description=>"new group description",:assign_time=>1200,:escalate_to=>16,:agent_list=>[16,1]}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"