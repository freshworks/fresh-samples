## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

api_key = "YOUR_API_KEY"
domain = "YOUR_DOMAIN"
password = "x"

# Id of the ticket to be updated
ticket_id = 'TICKET_ID'

r = requests.get("https://"+ domain +".freshdesk.com/api/v2/tickets/"+ticket_id, auth = (api_key, password))

if r.status_code == 200:
  print "Request processed successfully, the response is given below" + r.content
else:
  print "Failed to read ticket, errors are displayed below,"
  response = json.loads(r.content)
  print response["errors"]

  print "x-request-id : " + r.headers['x-request-id']
  print "Status Code : " + r.status_code