// Requires httpsync module. To install:
// npm install httpsync

var httpsync = require("httpsync");

var API_KEY = "YOUR_API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN.freshdesk.com";

var fdUrl = "http://" + API_KEY + ":X@" + FD_ENDPOINT + "/helpdesk/tickets.json";
var ticketBody = {
  "helpdesk_ticket":{
    "subject":"Ticket title",
    "description":"Ticket description.",
    "email":"example@example.com",
    "priority":1,
    "status":2
  }
}

var params = {
  url: fdUrl,
  method: "POST",
  headers: {"Content-type": "application/json"}
}

var req = httpsync.request(params);
req.write(JSON.stringify(ticketBody));
var res = req.end();

console.log(res);
