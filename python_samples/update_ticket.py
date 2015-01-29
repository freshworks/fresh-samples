## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import json
import requests

FRESHDESK_ENDPOINT = "https://DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "FRESHDESK_API_KEY"

headers = {'Content-Type': 'application/json'}

payload = {
    'helpdesk_ticket': {
        'status': 5
    }
}

print json.dumps(payload)

#Example : url = FRESHDESK_ENDPOINT + '/helpdesk/tickets/2.json' 
url = FRESHDESK_ENDPOINT + '/helpdesk/tickets/[ticket_id].json' 

r = requests.put(url,
        auth=(FRESHDESK_KEY, "X"),
        headers=headers,
        data=json.dumps(payload),
        allow_redirects=False)

print 'HTTP response code: ' + str(r.status_code)
