function testCreateCategory() {

  var headers = {
    'Content-type': 'application/json',
    'Authorization': 'Basic TOKEN:X_BASE64ENCODED='
  };
  
  var payload = '{"solution_category":{"name":"API test","description":"API related documents"},"tags":{"name":""}}';
  
  var url = 'http://DOMAIN.freshdesk.com/solution/categories.json';
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
