package com.asiainfo.crm.cm.teaminvoke.in.service.impl;

import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.model.ivalues.ISoUserValue;
import com.asiainfo.crm.cm.model.ivalues.IValueObject;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICmTeamInvokeInSV;
import com.asiainfo.crm.so.exe.ws.crmcallams.imswrapservice.SValidity;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CmTeamInvokeInSVImplTest extends BaseTest {
    ICmTeamInvokeInSV cmTeamInvokeInSV=(ICmTeamInvokeInSV) ServiceFactory.getService(ICmTeamInvokeInSV.class);

    @Test
    void testGetSoUserByUserId() throws Exception {
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, "2100");
        ISoUserValue iValueObject = cmTeamInvokeInSV.getSoUserByUserId(configReader.getLongValue("userId"));
        Assertions.assertNotNull(iValueObject);
        Assertions.assertEquals(configReader.getProperty("billId"),iValueObject.getBillId(),"获取BillId");
    }

    @Test
    void getSoUserByBillId() throws Exception{
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, "2100");
        ISoUserValue iValueObject = cmTeamInvokeInSV.getSoUserByBillId(configReader.getProperty("billId"));
        Assertions.assertNotNull(iValueObject);
        Assertions.assertEquals(configReader.getLongValue("userId"),iValueObject.getUserId(),"获取userId");

    }
}