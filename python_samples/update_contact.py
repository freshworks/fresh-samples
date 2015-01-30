## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

FRESHDESK_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "YOUR_API_TOKEN"

user_info = {"user":{"name":"Sample User", "job_title":"Super Hero"}}
my_headers = {"Content-Type": "application/json"}

#Example : url = FRESHDESK_ENDPOINT + '/contacts/2.json' 
url = FRESHDESK_ENDPOINT + '/contacts/[id].json' 

r = requests.post(url,
        auth=(FRESHDESK_KEY, "X"), data=json.dumps(user_info),
        headers=my_headers)

print r.status_code
print r.content
