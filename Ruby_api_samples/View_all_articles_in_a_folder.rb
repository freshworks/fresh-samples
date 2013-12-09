#view all solution article in folder

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id,folder_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/1/folders/2.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/[category_id]/folders/folder_id.json","sample@freshdesk.com","test")

response = site.get(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"