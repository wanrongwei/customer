package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class IPushc2CmSVTest extends BaseTest {
    private final IPushc2CmSV sv = (IPushc2CmSV) ServiceFactory.getService(IPushc2CmSV.class);


    @Test
    void triggerEvent() throws Exception{
        Assertions.assertEquals(sv.getEventSwitch("aaaa"),"N","开关打开");

    }

    @Test
    void getEventSwitch() throws Exception{
        Assertions.assertEquals(sv.getEventSwitch("aaaa"),"N","开关打开");
    }
}