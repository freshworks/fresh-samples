// Requires unirest module. To install:
// npm install unirest

var unirest = require('unirest');

var API_KEY = "YOUR_API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN";

var PATH = "/api/v2/tickets";
var URL =  "https://" + FD_ENDPOINT + ".freshdesk.com"+ PATH;

var fields = {
  'email': 'email@yourdomain.com',
  'subject': 'Ticket subject',
  'description': 'Ticket description.',
  'status': 2,
  'priority': 1
}

var Request = unirest.post(URL);

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
  if(response.status == 201){
    console.log("Location Header : "+ response.headers['location'])
  }
  else{
    	console.log("X-Request-Id :" + response.headers['x-request-id']);
  }
  });
