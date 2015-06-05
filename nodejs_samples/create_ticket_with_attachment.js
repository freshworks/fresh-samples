// To make use of unirest module pls execute - npm install unirest , on the Terminal/Command Promt

var unirest = require('unirest');
var fs = require('fs');

var PROTOCOL = "https://";
var API_KEY = "your_api_key";
var FD_ENDPOINT = "your_domain.freshdesk.com";
var PATH = "/helpdesk/tickets.json";
var enocoding_method = "base64";
var auth = "Basic " + new Buffer(API_KEY + ":" + 'X').toString(enocoding_method);
var URL = PROTOCOL + FD_ENDPOINT + PATH;

var fields = {
  'helpdesk_ticket[email]': 'example@example.com',
  'helpdesk_ticket[subject]':'Test Ticket subject',
  'helpdesk_ticket[description]':'This is a sample ticket'
}

var headers = {
  'Authorization':auth
}

unirest.post(URL)
  .headers(headers)
  .field(fields)
  .attach('helpdesk_ticket[attachments][][resource]',fs.createReadStream("path_to_file/file1.ext")) 
  .attach('helpdesk_ticket[attachments][][resource]', fs.createReadStream("path_to_file/file2.ext"))
  .end(function(response){
    console.log(response.body);
  });