#create group

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk/groups.json","sample@freshdesk.com","test")

#agent_list contains the user_id of the agents
#escalate_to is the user_id of agent to whom it should be escalated

response = site.post({:group=>{:name=>"new group",:description=>"new group description",:assign_time=>1200,:escalate_to=>16,:agent_list=>[16,1]}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"