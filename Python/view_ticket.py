## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

domain = "YOUR_DOMAIN"
api_key = "YOUR_API_KEY"
password = "x"

# Id of the ticket to be updated
ticket_id = 'TICKET_ID'

r = requests.get("https://{0}.freshdesk.com/api/v2/tickets/{1}".format(domain, ticket_id), auth = (api_key, password))

if r.status_code == 200:
  print ("Request processed successfully, the response is given below")
else:
  print ("Failed to read ticket, errors are displayed below")
response = json.loads(r.content)

t = r.json()
print(r.json())
