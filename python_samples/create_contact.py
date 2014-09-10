## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

FRESHDESK_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "YOUR_API_TOKEN"

user_info = {"user":{"name":"Example User", "email":"example@example.com"}}
my_headers = {"Content-Type": "application/json"}

r = requests.post(FRESHDESK_ENDPOINT + '/contacts.json',
        auth=(FRESHDESK_KEY, "X"), data=json.dumps(user_info),
        headers=my_headers)

print r.status_code
print r.content
