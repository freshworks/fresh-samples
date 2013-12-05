#create solution article

require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/4/folders/5/articles.json?tags=test","sample@freshdesk.com","test")

#Status: 1-Draft,2-Published	
#art_type: 1-Permanent,2-Workaround

response = site.post({:solution_article=>{:title=>"test title",:status=>1,:art_type=>2,:description=>"Testing",:folder_id=>5}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"