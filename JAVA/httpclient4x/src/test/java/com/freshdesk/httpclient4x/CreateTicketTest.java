package com.freshdesk.httpclient4x;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ganesh
 */
public class CreateTicketTest {

    /**
     * Test of createTicket method, of class CreateTicket.
     */
    @Test
    public void testCreateTicket() throws Exception {
        System.out.println("createTicket");
        String apiToken = APITokenEndpoint.apiToken;
        String apiEndpoint = APITokenEndpoint.apiEndpoint;
        CreateTicket instance = new CreateTicket();
        int expResult = 201;
        int result = instance.createTicket(apiToken, apiEndpoint);
        assertEquals(expResult, result);
    }
    
}
