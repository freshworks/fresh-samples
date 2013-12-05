#view forums in a category

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/categories/122.json","sample@freshdesk.com","test")

response=site.get(:accept=>"application/json")

