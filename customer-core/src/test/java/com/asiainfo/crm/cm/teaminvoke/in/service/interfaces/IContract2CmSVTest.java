package com.asiainfo.crm.cm.teaminvoke.in.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrAgreementHValue;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class IContract2CmSVTest extends BaseTest {
    long custid=23210113921822L;
    long agreementid=3109804383L;
    long levelid=100172L;
    String agreementcode="8020152891";
    IContract2CmSV iContract2CmSV = (IContract2CmSV) ServiceFactory.getService(IContract2CmSV.class);

    @Test
    void getAgreementValueByCust() throws Exception {
        IBOAgrAgreementHValue agr = iContract2CmSV.getAgreementValueByCust(custid, agreementid);
        Assertions.assertNotNull(agr);
        Assertions.assertEquals(custid, agr.getOwnerId(),"ownerId");
        Assertions.assertEquals(levelid, agr.getAgrLevelId(),"AgrLevelId");
    }

    @Test
    void queryAgreementBillCycle() throws Exception {
        DataContainer dc = iContract2CmSV.queryAgreementBillCycle(agreementid, "", custid);
        Assertions.assertNotNull(dc);
        Assertions.assertEquals("1", dc.getAsString("BILL_CYCLE"),"BILL_CYCLE");
        Assertions.assertEquals(agreementcode, dc.getAsString("AGREEMENT_CODE"),"AGREEMENT_CODE");

    }


}