## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

api_key = "YOUR_API_KEY"
domain = "YOUR_DOMAIN"
password = "x"

# Id of the ticket to be updated
ticket_id = 'TICKET_ID'

headers = { 'Content-Type' : 'application/json' }

ticket = {
  'subject' : 'Updated Title',
  'description' : 'Updated description',
  'priority' : 3,
}

r = requests.put("https://"+ domain +".freshdesk.com/api/v2/tickets/"+ticket_id, auth = (api_key, password), headers = headers, data = json.dumps(ticket))

if r.status_code == 200:
  print "Ticket updated successfully, the response is given below" + r.content
else:
  print "Failed to update ticket, errors are displayed below,"
  response = json.loads(r.content)
  errors = response["errors"]
  for error in errors:
      print "Field : " + error["field"] + " |  Message : " + error["message"] + " | Code : " + error["code"]

  print "x-request-id : " + r.headers['x-request-id']