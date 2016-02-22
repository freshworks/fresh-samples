import time
import hashlib
import hmac
import urllib

def get_sso_url(email, name, base_url, key, redirect_url=None, phone=None, company=None):
    """This function returns the Freshdesk SSO URL.
    For more info look at https://goo.gl/NISgpr
    """
    utctime = int(time.time())
    plaintext = "%s%s%s" % (name, email, utctime)
    hash = hmac.new(key.encode(), plaintext.encode(), hashlib.md5).hexdigest()
    url = '%s/login/sso?name=%s&email=%s&timestamp=%s&hash=%s' % (base_url, urllib.quote(name), urllib.quote(email), utctime, hash)
    if redirect_url:
        url = "%s&redirect_to=%s" % (url, urllib.quote(redirect_url))
    if phone:
        url = "%s&phone=%s" % (url, urllib.quote(phone))
    if company:
        url = "%s&company=%s" % (url, urllib.quote(company))
    return url

print get_sso_url('test@myportal.com', 'Ciccio Pasticcio', 'https://support.example.com', '89128932983928912dw23', redirect_url='https://support.example.com/support/tickets')
