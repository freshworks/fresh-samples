## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import json
import requests

FRESHDESK_ENDPOINT = "https://domain.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "API_KEY"

r = requests.get(FRESHDESK_ENDPOINT + '/helpdesk/tickets.json', 
        auth=(FRESHDESK_KEY, "X"))

print 'HTTP response code: ' + str(r.status_code)
print 'HTTP response body: ' + str(r.content)

