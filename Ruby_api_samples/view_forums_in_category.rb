#view forums in a category

require "rubygems"
require "rest_client"
require "json"

# Need to specify category_id in url
# eg:
# site = RestClient::Resource.new("http://domain.freshdesk.com/discussions/categories/122.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/discussions/categories/[category_id].json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

