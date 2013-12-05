#@author John paul.H
#Code to create a contact using Net::Http 
require "rubygems"
require "net/http"  

uri = URI.parse("http://domain.freshdesk.com/contacts.xml")

    
request = Net::HTTP::Post.new(uri.request_uri)


#replace your user/passwd or the apiKey
  request.basic_auth("sample@freshdesk.com","test")


#Set the content type.p
  request['Content-Type']='application/xml'

connection = Net::HTTP.new(uri.host,uri.port)

	#needed only if ssl is enabled
	#connection.use_ssl = true
    #connection.verify_mode = OpenSSL::SSL::VERIFY_NONE


post_data = Hash.new

#The set_form_data does not parse the xml content, and it recognizes only the Map datatype. So either we can parse the xml and construct...
# the map data or we can directly set the data as mentioned below

post_data["user[name]"]='Valluvar'
post_data["user[email]"]='valluvar@tamilnadu.com'


request.set_form_data(post_data)
response= connection.request(request)

puts "#{response.code}"
puts "#{response.body}"
