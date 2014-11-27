var https = require("https");

var API_KEY = "YOUR-API-KEY";
var FD_ENDPOINT = "domain.freshdesk.com";
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
  hostname : FD_ENDPOINT ,
  path : "/helpdesk/tickets.json",
  method: "POST",
  headers: {"Content-type": "application/json",
            "Content-length":JSON.stringify(ticketBody).length},
  auth : API_KEY + ":X"  
        
}

var req = https.request(params);
req.write(JSON.stringify(ticketBody));
var res = req.end();

console.log(req,res);