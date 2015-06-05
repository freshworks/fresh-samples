// Requires unirest module. To install:
// npm install unirest

var unirest = require('unirest');
var fs = require('fs');

var PROTOCOL = "https://";
var API_KEY = "YOUR_API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN.freshdesk.com";

var PATH = "/helpdesk/tickets.json";
var enocoding_method = "base64";
var auth = "Basic " + new Buffer(API_KEY + ":" + 'X').toString(enocoding_method);
var URL = PROTOCOL + FD_ENDPOINT + PATH;

var fields = {
  'helpdesk_ticket[email]': 'example@example.com',
  'helpdesk_ticket[subject]': 'Ticket subject',
  'helpdesk_ticket[description]': 'Ticket description.'
}

var headers = {
  'Authorization': auth
}

unirest.post(URL)
  .headers(headers)
  .field(fields)
  .attach('helpdesk_ticket[attachments][][resource]', fs.createReadStream('/path/to/file1.ext'))
  .attach('helpdesk_ticket[attachments][][resource]', fs.createReadStream('/path/to/file2.ext'))
  .end(function(response){
    console.log(response.body);
  });
