## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

api_key = "YOUR_API_KEY"
domain = "YOUR_DOMAIN"
password = "x"

# id of the ticket to add a note
ticket_id = 'TICKET_ID'

headers = { 'Content-Type' : 'application/json' }

note = {
    'body' : 'Sample reply'
}

r = requests.post("https://"+ domain +".freshdesk.com/api/v2/tickets/"+ticket_id+"/reply", auth = (api_key, password), headers = headers, data = json.dumps(note))

if r.status_code == 201:
  print "Reply added successfully, the response is given below" + r.content
else:
  print "Failed to add reply, errors are displayed below,"
  response = json.loads(r.content)
  errors = response["errors"]
  for error in errors:
      print "Field : " + error["field"] + " |  Message : " + error["message"] + " | Code : " + error["code"]

  print "x-request-id : " + r.headers['x-request-id']