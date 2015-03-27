## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import json
import requests

FRESHDESK_ENDPOINT = "https://YOUR_DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "YOUR_API_KEY"

#Example: /helpdesk/tickets/30.json
r = requests.get(FRESHDESK_ENDPOINT + '/helpdesk/tickets/[id].json',
        auth=(FRESHDESK_KEY, "X"))

print 'HTTP response code: ' + str(r.status_code)
print 'HTTP response body: ' + str(r.content)

