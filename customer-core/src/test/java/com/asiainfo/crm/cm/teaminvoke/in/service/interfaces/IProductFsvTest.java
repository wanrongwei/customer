package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.pce.ivalues.IOfferValue;
import com.ai.pce.service.interfaces.IProductFSV;
import com.aie.test.BaseTest;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class IProductFsvTest extends BaseTest {
    private final IProductFSV sv = (IProductFSV) ServiceFactory.getService(IProductFSV.class);


    @Test
    void getOfferById() throws Exception{
        long offerId=90131643L;
        IOfferValue offer = sv.getOfferById(offerId);
        Assertions.assertNotNull(offer);
        Assertions.assertEquals(offerId, offer.getOfferId(),"offerId");
        Assertions.assertEquals("CloudPBX Multiplan Company Offer-02", offer.getOfferName(),"offer name");
    }
}