// Requires unirest module. To install:
// npm install unirest

var unirest = require('unirest');

var API_KEY = "API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN";

var PATH = "/api/v2/tickets";
var URL =  "https://" + FD_ENDPOINT + ".freshdesk.com"+ PATH;

var Request = unirest.get(URL);

Request.auth({
  user: API_KEY,
  pass: "X",
  sendImmediately: true
})
.end(function(response){
    console.log(response.body)
    console.log("Response Status : " + response.status)
    if(response.status != 200){
      console.log("X-Request-Id :" + response.headers['x-request-id']);
    }
  });
