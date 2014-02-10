#create solution article

require "rubygems"
require "rest_client"
require "json"

#Need to specify the category_id and folder_id in url
#eg:
#site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/4/folders/5/articles.json?tags=test","sample@freshdesk.com","test")

site = RestClient::Resource.new("http://domain.freshdesk.com/solution/categories/[category_id]/folders/[folder_id]/articles.json?tags=test","sample@freshdesk.com","test")

#Status: 1-Draft,2-Published	
#art_type: 1-Permanent,2-Workaround

response = site.post({:solution_article=>{:title=>"test title",:status=>1,:art_type=>2,:description=>"Testing",:folder_id=>5,:attachments=>{''=>[{:resource=>File.new("/document.rtf", 'rb')}]}}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body} \n"