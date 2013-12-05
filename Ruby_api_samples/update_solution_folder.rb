#Update solution folder

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/1813/folders/3216.json","sample@freshdesk.com","test")

#visibility : 1 = All, 2 = Logged in Users, 3 = Agents, 4 = Select Companies [need to provide customer_ids for this option]

response = site.put({:solution_folder=>{:name=>"test folder1",:visibility=>1,:description=>"This is a new folder"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"