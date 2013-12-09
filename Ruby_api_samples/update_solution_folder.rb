#Update solution folder

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id and folder_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/1/folders/2.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/[category_id]/folders/[folder_id].json","sample@freshdesk.com","test")

#visibility : 1 = All, 2 = Logged in Users, 3 = Agents, 4 = Select Companies [need to provide customer_ids for this option]

response = site.put({:solution_folder=>{:name=>"test folder1",:visibility=>1,:description=>"This is a new folder"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"