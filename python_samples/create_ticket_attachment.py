## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests

FRESHDESK_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com" # check if you have configured https, modify accordingly
FRESHDESK_KEY = "YOUR_API_KEY"

multipart_data = [
    ('helpdesk_ticket[email]', ('','example@example.com')),
    ('helpdesk_ticket[subject]', ('', 'Ticket Title')),
    ('helpdesk_ticket[description]', ('', 'Ticket description.')),
    ('helpdesk_ticket[attachments][][resource]', ('create_ticket_attachment.py', open('create_ticket_attachment.py', 'rb'), 'text/plain')),
    ('helpdesk_ticket[attachments][][resource]', ('logo.png', open('logo.png', 'rb'), 'image/png'))
]
r = requests.post(FRESHDESK_ENDPOINT + '/helpdesk/tickets.json',
        auth=(FRESHDESK_KEY, "X"),
        files=multipart_data)

print r.status_code
print r.content
