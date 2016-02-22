## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

api_key = "YOUR_API_KEY"
domain = "YOUR_DOMAIN"
password = "x"

r = requests.get("https://"+ domain +".freshdesk.com/api/v2/tickets", auth = (api_key, password))

if r.status_code == 200:
  print "Request processed successfully, the response is given below"
  print r.content
else:
  print "Failed to read tickets, errors are displayed below,"
  response = json.loads(r.content)
  errors = response["errors"]
  for error in errors:
      print "Field : " + error["field"] + " |  Message : " + error["message"] + " | Code : " + error["code"]

  print "x-request-id : " + r.headers['x-request-id']