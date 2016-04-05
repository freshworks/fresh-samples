## This script requires "requests": http://docs.python-requests.org/
## To install: pip install requests

import requests
import json

api_key = "YOUR_API_KEY"
domain = "YOUR_DOMAIN"
password = "x"

multipart_data = [
    ('email', ('','example@example.com')),
    ('subject', ('', 'Ticket Title')),
    ('status', ('', '2')),
    ('priority', ('', '2')),
    ('cc_emails[]', ('', 'sample_email@domain.com')),
    ('cc_emails[]', ('', 'user_email@domain.com')),
    ('attachments[]', ('logo.png', open('logo.png', 'rb'), 'image/png')),
    ('attachments[]', ('create_ticket_attachment.py', open('create_ticket_attachment.py', 'rb'), 'text/plain')),
    ('description', ('', 'Ticket description.'))
]

r = requests.post("https://"+ domain +".freshdesk.com/api/v2/tickets", auth = (api_key, password), files = multipart_data)

if r.status_code == 201:
  print "Ticket created successfully, the response is given below" + r.content
  print "Location Header : " + r.headers['Location']
else:
  print "Failed to create ticket, errors are displayed below,"
  response = json.loads(r.content)
  print response["errors"]

  print "x-request-id : " + r.headers['x-request-id']
  print "Status Code : " + str(r.status_code)