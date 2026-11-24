package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.bce.ivalues.IBcePageValue;
import com.ai.bce.service.interfaces.IBceFrameSV;
import com.aie.test.BaseTest;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class ICs2CmSVTest extends BaseTest {
    private final ICs2CmSV iCs2CmSV = (ICs2CmSV) ServiceFactory.getService(ICs2CmSV.class);
    @Test
    void createTicketForCM() throws Exception{
        Map map= new HashMap();
        map.put("CUST_ID",configReader.getB2BCustId()+"");
        map.put("ERROR_CODE","123123");
        map.put("ERROR_MESSAGE","test for junit");
        map.put("SOURCE_SYSTEM","CM test");
        map.put("ERROR_EXT_INFO","CM test===========");
        iCs2CmSV.CreateTicketForCM(map);
    }

    @Test
    void queryTicketListForCm() throws Exception{
        IBceFrameSV sv = (IBceFrameSV) ServiceFactory.getService(IBceFrameSV.class);
        IBcePageValue bcePageValue = sv.getBcePage(6l);
        Assertions.assertEquals(6,bcePageValue.getPageId(),"page id not equal");
         
    }
    

    @Test
    void queryTicketListCountForCm() {
    }
}