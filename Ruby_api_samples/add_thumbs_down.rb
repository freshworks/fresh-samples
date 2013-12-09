#Adding thumbs down

require "rubygems"
require "rest_client"
require "json"

#Need to specify the article_id in the url 
#eg:
#site = RestClient::Resource.new("http://domain.freshdesk.com/support/articles/1/thumbs_down.json","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/support/articles/[article_id]/thumbs_down.json","sample@freshdesk.com","test")

response = site.put(:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"