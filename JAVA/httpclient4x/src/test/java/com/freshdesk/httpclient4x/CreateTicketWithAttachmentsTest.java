package com.freshdesk.httpclient4x;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ganesh
 */
public class CreateTicketWithAttachmentsTest {
    
    /**
     * Test of createTicketWithAttachments method, of class CreateTicketWithAttachments.
     */
    @Test
    public void testCreateTicketWithAttachments() throws Exception {
        System.out.println("createTicketWithAttachments");
        String apiToken = APITokenEndpoint.apiToken;
        String apiEndpoint = APITokenEndpoint.apiEndpoint;
        CreateTicketWithAttachments instance = new CreateTicketWithAttachments();
        int expResult = 201;
        int result = instance.createTicketWithAttachments(apiToken, apiEndpoint);
        assertEquals(expResult, result);
    }
    
}
