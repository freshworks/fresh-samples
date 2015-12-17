'use strict'
/**
*
* GasFreshdesk - OO Freshdesk API Class for Google Apps Script
*
* GasFreshdesk is a easy to use Freshdesk API Javascript Class for GAS(Google Apps Script)
* It provides a OO(Object-Oriented) way to use Freshdesk Ticket / Contacts, etc.
*
* Github - https://github.com/zixia/gas-freshdesk
*
* Example:
```javascript
var MyFreshdesk = new Freshdesk('https://mikebo.freshdesk.com', 'Jrg0FQNzX3tzuHbiFjYQ')

var ticket = new MyFreshdesk.Ticket({
  helpdesk_ticket: {
    description:'A description'
    , subject: 'A subject'
    , email: 'you@example.com'
  }
})

ticket.assign(9000658396)
ticket.addNote({
  body: 'Hi tom, Still Angry'
  , private: true
})
ticket.setPriority(2)
ticket.setStatus(2)

ticket.del()
ticket.restore()
```
*/

function gasFreshdeskExample() {

  /**
  *
  * Include GasFreshdesk Library
  *
  */
  if ((typeof Freshdesk)==='undefined') { // GasFreshdesk Initialization. (only if not initialized yet.)
    eval(UrlFetchApp.fetch('https://raw.githubusercontent.com/zixia/gas-freshdesk/master/src/gas-freshdesk-lib.js').getContentText())
  } // Class Freshdesk is ready for use now!

  /**
  *
  * Initialization Freshdesk Account
  *
  */
  // This is my test account, don't worry about it. ;]
  var FRESHDESK_URL = 'https://mikebo.freshdesk.com' 
  // key for agent 'zixia@zixia.net' at 'https://mikebo.freshdesk.com'
  var FRESHDESK_KEY = PropertiesService.getScriptProperties().getProperty('FreshDeskApiToken')


  var MyFreshdesk = new Freshdesk(FRESHDESK_URL, FRESHDESK_KEY)


  /**
  *
  * Ticket
  *
  */
  var existingTicket = new MyFreshdesk.Ticket(1)
  Logger.log('Ticket id is ' + existingTicket.getId())

  var newTicket = new MyFreshdesk.Ticket({
    helpdesk_ticket: {
      description:'A totally rad description of a what the problem is'
      , subject:'Something like "Cannot log in"'
      , email: 'you@example.com'
      , attachments: [ 
        { resource: Utilities.newBlob('TEST DATA').setName('test-data.dat') }
        , {resource: Utilities.newBlob('TEST DATA2').setName('test-data2.dat') }
      ]
    }
  })

  newTicket.assign(9005923143) // mike

  newTicket.addNote({
    helpdesk_note: {
      body: 'Hi tom, Still Angry'
      , private: true
      , attachments: [ 
        { resource: Utilities.newBlob('TEST DATA').setName('test-data.dat') }
        , {resource: Utilities.newBlob('TEST DATA2').setName('test-data2.dat')}
      ]
    }
  })

  newTicket.setPriority(2)
  newTicket.setStatus(2)
  newTicket.del()
  newTicket.restore()
  newTicket.del()


  /**
  *
  * Contact
  *
  */
  var contact = MyFreshdesk.listContacts({ email: 'you@example.com' })
  Logger.log('Contact name is ' + contact.getName())
  Logger.log('Contact id is ' + contact.getId())
  contact.setName('You You')

}
