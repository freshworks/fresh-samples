Python  and OpenSSL Versions
============================

Freshdesk API supports only TLS 1.1 and 1.2. [TLS 1.0 has been deprecated] since November 30, 2016.

Ensure that your Python and Openssl Supports the correct versions. To check which openssl version you are using execute the following within python
```sh
import ssl
print ssl.OPENSSL_VERSION
```
To have support for the higher versions you need OpenSSL version 1.0.2 or 1.0.1. If you have only 1.0.0 or 0.9.8 you need to upgrade your python+OpenSSL.
Please look into this [Stack Overflow thread] for more information


  [TLS 1.0 has been deprecated]: <https://support.freshdesk.com/support/solutions/articles/221629-tls-1-0-support-deprecation>
  [Stack Overflow thread]: http://stackoverflow.com/questions/38501531/forcing-requests-library-to-use-tlsv1-1-or-tlsv1-2-in-python
