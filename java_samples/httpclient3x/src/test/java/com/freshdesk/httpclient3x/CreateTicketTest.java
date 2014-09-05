package com.freshdesk.httpclient3x;

import static org.junit.Assert.*;

/**
 *
 * @author subhash
 */
public class CreateTicketTest {

    /**
     * Test of createTicket method, of class CreateTicket.
     */
    @org.junit.Test
    public void testCreateTicket() throws Exception {
        System.out.println("createTicket");
        CreateTicket instance = new CreateTicket();
        int expectedStatus = 200;
        int status = instance.createTicket(APITokenEndpoint.apiToken,
                APITokenEndpoint.apiEndpoint);
        assertEquals(expectedStatus, status);
    }
    
}
