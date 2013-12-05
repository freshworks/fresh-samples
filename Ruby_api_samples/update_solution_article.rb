#Update solution article

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/6/folders/4/articles/1.json?tags=213","sample@freshdesk.com","test")

#Status: 1-Draft,2-Published	
#art_type: 1-Permanent,2-Workaround

response = site.put({:solution_article=>{:title=>"updated article",:status => 1,:art_type => 1, :description => "Testing",:folder_id=>4}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"