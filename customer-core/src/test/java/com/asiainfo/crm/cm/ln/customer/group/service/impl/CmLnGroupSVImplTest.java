package com.asiainfo.crm.cm.ln.customer.group.service.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmGroupAccountingValue;
import com.asiainfo.crm.cm.ln.customer.group.ivalues.IBOLnCmxGroupCustValue;
import com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class CmLnGroupSVImplTest extends BaseTest {
    ICmLnGroupSV cmLnGroupSV = (ICmLnGroupSV) ServiceFactory.getService(ICmLnGroupSV.class);
    long custid=23210113921822L;

    /**
     * 查询集团客户增量信息BOLnCmxGroupCust
     * @throws Exception
     */
    @Test
    public void testQueryCustomerMaskByCustIdAndLog() throws Exception {
        IBOLnCmxGroupCustValue result = cmLnGroupSV.queryGroupCustExtByIdAndLog(custid);
        Assertions.assertEquals(custid, result.getCustId(),"custId");
        Assertions.assertEquals("534221EL123", result.getTaxId(),"TaxId");
    }

    @Test
    public void testQueryGroupAccountingById() throws Exception {
        // 输入参数
        long custId = 23210812402173L; // 客户ID

        // 调用方法
        IBoCmGroupAccountingValue accounting = cmLnGroupSV.queryGroupAccountingById(custId);

        // 断言验证
        Assertions.assertNotNull(accounting, "查询结果不应为空");
        Assertions.assertEquals(custId, accounting.getCustId(), "客户ID不匹配");
        Assertions.assertEquals("B56", accounting.getRatingCode(), "账户号码不匹配");
    }


}
