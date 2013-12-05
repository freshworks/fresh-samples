#create folder under a solution category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/4/folders.json","sample@freshdesk.com","test")

#visibility : 1 = All, 2 = Logged in Users, 3 = Agents, 4 = Select Companies [need to provide customer_ids for this option]

response = site.post({:solution_folder=>{:name=>"test topic",:visibility=>4,:customer_folders_attributes=>{:customer_id=>[1,2]},:description=>"This is a new topic"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"