#Create a ticket from twitter
require "rubygems"
require "rest_client"
require "json"

site = RestClient::Resource.new("http://domain.freshdesk.com/helpdesk/tickets.json","sample@freshdesk.com","test")

response = site.post({:helpdesk_ticket=>{:description=>"Test ticket creation with attachments",:subject=>"new ticket sample",:source=>5,:twitter_id=>"requester_handle","tweet_attributes"=>{"twitter_handle_id"=>"1","tweet_id"=>"1"}}},:content_type=>"application/json")

puts "response: #{response.code} \n #{response.body}"

#twitter_id, should be a valid twitter handle, if invalid is provided, ticket will be created but the twitter_id will not receive tweets in twitter when replied in freshdesk.

#twitter_handle_id, should be given if reply option needs to be enabled for a ticket belonging to 'twitter' source, it can be found out by visiting 'http://domain.freshdesk.com/admin/social/streams' and hovering on the delete icon of the respective stream. This handle is used to send tweets in twitter from freshdesk.

#tweet_id, should be a unique id w.r.t. an account, if valid twitter tweet id(https://twitter.com/<twitter_handle>/status/<tweet_id>) is given, the replies in freshdesk will get posted to that tweet.
