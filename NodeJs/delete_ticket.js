// Requires unirest module. To install:
// npm install unirest

var unirest = require('unirest');

var API_KEY = "YOUR_API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN";

var PATH = "/api/v2/tickets";
var URL =  "https://" + FD_ENDPOINT + ".freshdesk.com"+ PATH + "/ticket_id";

var Request = unirest.delete(URL)

Request.auth({
  user: API_KEY,
  pass: "X",
  sendImmediately: true
})
.end(function(response){
  	if(response.status == 204){
      console.log("Successfully deleted the ticket");
    }
    else{
      console.log(response.body);
      console.log("Response Status : " + response.status)
      console.log("X-Request-Id :" + response.headers['x-request-id']);
    }
});
