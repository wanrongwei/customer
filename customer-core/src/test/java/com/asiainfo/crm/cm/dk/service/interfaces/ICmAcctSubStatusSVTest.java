package com.asiainfo.crm.cm.dk.service.interfaces;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustPerferInfomationValue;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ICmAcctSubStatusSVTest  extends BaseTest {
    long custId =21210511245951L;
    long acctId=32100110149542L;
    long substate=2L;

    private ICmAcctSubStatusSV cmAcctSubStatusSV = (ICmAcctSubStatusSV) ServiceFactory.getService(ICmAcctSubStatusSV.class);

    @Test
    public void testQueryAcctSubStatusValuesCountInAll() throws Exception {
        // 调用方法
        int cont = cmAcctSubStatusSV.queryAcctSubStatusValuesCountInAll(custId,acctId,substate);
        // 断言验证
        Assertions.assertEquals(1, cont, "应返回2条偏好信息记录");
    }
    @Test
    public void testQueryAcctSubStatusValuesInAll() throws Exception {
        int startIndex = 0;
        int endIndex = 5;
        // 调用方法
        DataContainerInterface[] val = cmAcctSubStatusSV.queryAcctSubStatusValuesInAll(custId, acctId, substate, startIndex, endIndex);

        Assertions.assertNotNull(val, "acctount不为空");
        // 断言验证
        Assertions.assertEquals(1, val.length, "应返回2条偏好信息记录");
        Assertions.assertEquals(custId, val[0].getAsLong("CUST_ID"), "客户ID");

    }
}
