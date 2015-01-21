## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import json
import requests

FRESHDESK_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "YOUR_API_KEY"

headers = {'Content-Type': 'application/json'}

payload = {
    'helpdesk_ticket': {
        'subject': 'Ticket title',
        'description': 'Ticket detail',
        'email': 'example@example.com',
        'priority': 1,
        'status': 2
    },
    'cc_emails': 'example1@example.com'
}

print json.dumps(payload)

r = requests.post(FRESHDESK_ENDPOINT + '/helpdesk/tickets.json',
        auth=(FRESHDESK_KEY, "X"),
        headers=headers,
        data=json.dumps(payload))

print 'HTTP response code: ' + str(r.status_code)
o = json.loads(r.content)
print 'New ticket id: ' + str(o['helpdesk_ticket']['display_id'])
