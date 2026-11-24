package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.pce.ivalues.IOfferValue;
import com.aie.test.BaseTest;
import com.asiainfo.crm.so.order.rboss.service.interfaces.IOrdOTTSV;
import com.asiainfo.crm.so.order.rboss.service.interfaces.IPhoneBookSV;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class IOrderOTTTest extends BaseTest {
    private final IOrdOTTSV sv = (IOrdOTTSV) ServiceFactory.getService(IOrdOTTSV.class);
    IPhoneBookSV phoneBookSV = (IPhoneBookSV) ServiceFactory.getService(IPhoneBookSV.class);

    @Test
    void promoteViaplayToCust() throws Exception{
         sv.promoteViaplayToCust(configReader.getB2BCustId());
    }

    @Test
    void changePhonebookWhenModifyAddress() throws Exception{
        phoneBookSV.changePhonebookWhenModifyAddress(configReader.getB2BCustId(), 5716721L);
    }
}