// Requires unirest module. To install:
// npm install unirest

var unirest = require('unirest');

var API_KEY = "API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN";

var PATH = "/api/v2/tickets";
var URL =  "https://" + FD_ENDPOINT + ".freshdesk.com"+ PATH + "/ticket_id";

var fields = {
  'subject': 'Ticket update subject',
  'description': 'Ticket update description.',
  'priority': 2,
  'status': 3
}

var Request = unirest.put(URL);

Request.auth({
  user: API_KEY,
  pass: "X",
  sendImmediately: true
})
.type('json')
.send(fields)
.end(function(response){
  	console.log(response.body)
    console.log("Response Status : " + response.status)
  	if(response.status != 200){
    	console.log("X-Request-Id :" + response.headers['x-request-id']);
    }
  });
