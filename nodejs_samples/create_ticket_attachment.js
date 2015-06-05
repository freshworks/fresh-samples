// Requires needle module. To install:
// npm install needle

var needle = require('needle');

var API_KEY = "YOUR_API_KEY";
var FD_ENDPOINT = "YOUR_DOMAIN.freshdesk.com";

var fdUrl = "http://" + API_KEY + ":X@" + FD_ENDPOINT + "/helpdesk/tickets.json";

var data = {
  'helpdesk_ticket[email]': 'example@example.com',
  'helpdesk_ticket[subject]': 'Ticket title',
  'helpdesk_ticket[description]': 'Ticket description',
  'helpdesk_ticket[attachments][][resource]': {file: 'logo.png', content_type: 'image/png'}
};

needle.post(fdUrl, data, {multipart: true}, function(err, resp, body){
  console.log(body);
});
