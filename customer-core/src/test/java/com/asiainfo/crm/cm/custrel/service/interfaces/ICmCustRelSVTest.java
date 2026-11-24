package com.asiainfo.crm.cm.custrel.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.custrel.ivalues.IBOCmCustRelValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmCustRelSVTest extends BaseTest {

    private ICmCustRelSV custRelSV = (ICmCustRelSV) ServiceFactory.getService(ICmCustRelSV.class);

    @Test
    public void testQueryCustById() throws Exception {
        // 输入参数
        long custId = configReader.getB2BCustId();
        int startRowIndex = 0;
        int endRowIndex = 10;

        // 调用方法
        IBOCmCustRelValue[] custRels = custRelSV.queryCustById(custId, startRowIndex, endRowIndex);

        // 断言验证
        Assertions.assertNotNull(custRels, "客户关系列表不应为空");
        Assertions.assertEquals(0, custRels.length, "应返回1条客户关系记录");
    }
}