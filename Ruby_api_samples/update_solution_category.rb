#Update solution category

require "rubygems"
require "rest_client"
require "json"

# Need category_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/6.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/[category_id].json","sample@freshdesk.com","test")

response = site.put({:solution_category=>{:name=>"freshdesk",:description=>"Testing solution category"}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"