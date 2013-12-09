#delete solution folder

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id and folder_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/6/folders/8.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/[category_id]/folders/[folder_id].json","sample@freshdesk.com","test")

response = site.delete(:accept=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"