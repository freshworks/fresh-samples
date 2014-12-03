function testCreateTicket() {
  
  var API_KEY = 'YOUR_API_KEY';
  var ENDPOINT = 'http://YOUR_DOMAIN.freshdesk.com'; // change to https if SSL is configured.
  
  var headers = {
    'Content-type': 'application/json',
    'Authorization': 'Basic ' + Utilities.base64Encode(API_KEY + ':X')
  };
  
  var payload = '{"helpdesk_ticket":{"description":"Description ...","subject":"Title","email":"example@example.com","priority":1,"status":2},"cc_emails":"example1@example.com"}';
  var url = ENDPOINT + '/helpdesk/tickets.json';
  
  var options = {
    'method': 'post',
    'headers': headers,
    'payload': payload,
    muteHttpExceptions: true
  };
  
  var response = UrlFetchApp.fetch(url, options);
  
  Logger.log("code: " + response.getResponseCode());
  Logger.log("text: " + response.getContentText());
}

