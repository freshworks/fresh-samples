function testCreateTicketWithAttachments() {
  
  var API_KEY = 'YOUR_API_KEY';
  var ENDPOINT = 'https://YOUR_DOMAIN.freshdesk.com'; // change to https if SSL is configured.
                                                      // must use ssl, or api return error - by z. 201510
  
  var payload = [
    ['helpdesk_ticket[description_html]', 'this is description']
    , ['helpdesk_ticket[subject]', 'this is subject']
    , ['helpdesk_ticket[email]', 'from@test.com']
    , ['cc_emails', 'cc1@test.com, cc2@test.com']
  ]

  var fileBlob1 = UrlFetchApp
                  .fetch('https://circleci.com/gh/AKAMobi/ucapp/tree/master.svg?style=svg')
                  .getBlob()

  var fileBlob2 = UrlFetchApp
                  .fetch('https://circleci.com/gh/zixia/whoru/tree/master.svg?style=svg')
                  .getBlob()

  var attachments = [fileBlob1, fileBlob2]

  for (var i=0; i<attachments.length; i++) {
    payload.push(
      [
        'helpdesk_ticket[attachments][][resource]'
        , attachments[i]
      ]
    )
  }
  
  var boundary = '-----CUTHEREelH7faHNSXWNi72OTh08zH29D28Zhr3Rif3oupOaDrj'
  
  payload = makeMultipartBody(payload, boundary)

  var headers = {
    'Authorization': 'Basic ' + Utilities.base64Encode(API_KEY + ':X')
  }

  var options = {
    contentType: "multipart/form-data; boundary=" + boundary
    , headers: headers
    , payload: payload
    , method: 'post'
    , muteHttpExceptions: true
  }
  
  var url = ENDPOINT + '/helpdesk/tickets.json'
  
  var response = UrlFetchApp.fetch(url, options)
  
  Logger.log("code: " + response.getResponseCode());
  Logger.log("text: " + response.getContentText());
}


/**
*
* HTTP Post Multipart Body Helper function
*
*/
function makeMultipartBody(payload, boundary) {
  
  var body = Utilities.newBlob('').getBytes()
  
  for (var i in payload) {
    var [k, v] = payload[i]
    
    if (v.toString() == 'Blob'
       || v.toString() == 'GmailAttachment' 
    ) {
      
      // attachment
      body = body.concat(
        Utilities.newBlob(
          '--' + boundary + '\r\n'
          + 'Content-Disposition: form-data; name="' + k + '"; filename="' + v.getName() + '"\r\n'
        + 'Content-Type: ' + v.getContentType() + '\r\n\r\n'
      ).getBytes())
      
      body = body
      .concat(v.getBytes())
      .concat(Utilities.newBlob('\r\n').getBytes())
      
    } else {
      
      // string
      body = body.concat(
        Utilities.newBlob(
          '--'+boundary+'\r\n'
          + 'Content-Disposition: form-data; name="' + k + '"\r\n\r\n'
          + v + '\r\n'
        ).getBytes()
      )
      
    }
  
  }
  
  body = body.concat(Utilities.newBlob('--' + boundary + "--\r\n").getBytes())
  
  return body
 
}
