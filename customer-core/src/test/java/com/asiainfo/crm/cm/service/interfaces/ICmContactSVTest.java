package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmGroupPartyValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmGroupContactValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmContactSVTest extends BaseTest {
    private ICmContactSV cmContactSV = (ICmContactSV) ServiceFactory.getService(ICmContactSV.class); // 假设这是被测试的接口实现

    //查询联系人信息
    @Test
    public void testQueryGroupPartyInfo() throws Exception {
        // 输入参数
        String criteria = "&lt;criteria&gt;";
        int startNum = 0;
        int endNum = 10;

        // 调用方法
        IQBOCmGroupPartyValue[] groupPartyValues = cmContactSV.queryGroupPartyInfo(null, startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(groupPartyValues, "查询结果不应为空");
        Assertions.assertEquals(10, groupPartyValues.length, "返回的记录数应为10");

        // 可以添加更多断言来验证返回的数据
    }
    ////根据联系人编号查询集团联系人信息
    @Test
    public void testQueryCustConByCustContId() throws Exception {
        // 输入参数
        long custContId = 1100215112L;

        // 调用方法
        IBOCmGroupContactValue contactValue = cmContactSV.queryCustConBycustContId(custContId);

        // 断言验证
        Assertions.assertNotNull(contactValue, "查询结果不应为空");
        Assertions.assertEquals(custContId, contactValue.getCustContId(), "客户联系ID不匹配");

        // 可以添加更多断言来验证返回的数据
    }
}
