package com.asiainfo.crm.cm.common.service.interfaces;
import com.asiainfo.crm.inter.exe.webservice.client.copydan.CopyDanServiceClient;
import org.junit.jupiter.api.Test;

public class CopyDanServiceClientTest {

    @Test
    public void testGetAllCustomers() throws Exception {
        System.out.println(CopyDanServiceClient.getAllCustomers());
    }
}
