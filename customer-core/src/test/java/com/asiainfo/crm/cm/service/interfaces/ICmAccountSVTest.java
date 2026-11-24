package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmAccountSVTest extends BaseTest {

    private ICmAccountSV cmAccountSV=(ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class); // 假设这是被测试的接口实现
    long relCustd = configReader.getB2BCustId(); // 关联客户ID
    long acctId = 32102111864751L;
    @Test
    public void testQueryCustAcctRel() throws Exception {
        // 输入参数
        String acctName = ""; // 账户名称
        int installmentFlag =0; // 分期标志
        int paymethod = 0; // 支付方式
        int cycleType = 0; // 周期类型
        String custStatus = "1"; // 客户状态
        int start = 0; // 起始行索引
        int end = 10; // 结束行索引

        // 调用方法
        IBOCmCustAcctRelValue[] custAcctRels = cmAccountSV.queryCustAcctRel(
                relCustd, acctId, acctName, installmentFlag, paymethod, cycleType, custStatus, start, end
        );

        // 断言验证
        Assertions.assertNotNull(custAcctRels, "查询结果不应为空");
        Assertions.assertEquals(1, custAcctRels.length, "返回的客户账户关系数量应为1");
        // 验证第一个客户账户关系的属性
        IBOCmCustAcctRelValue firstCustAcctRel = custAcctRels[0];
        Assertions.assertEquals(relCustd, firstCustAcctRel.getRelCustId(), "关联客户ID不匹配");
        Assertions.assertEquals(acctId, firstCustAcctRel.getAcctId(), "账户ID不匹配");
        Assertions.assertEquals(0, firstCustAcctRel.getInstallmentFlag(), "分期标志不匹配");
        Assertions.assertEquals(2, firstCustAcctRel.getPayMethod(), "支付方式不匹配");
        Assertions.assertEquals(5, firstCustAcctRel.getCycleType(), "周期类型不匹配");
    }
    @Test
    public void testQueryCustAcctRel_EmptyResult() throws Exception {
        // 输入参数（无匹配条件）
        long relCustd = 99999211212L; // 不存在的关联客户ID
        long acctId = 99999L; // 不存在的账户ID
        String acctName = "NonExistentAccount"; // 不存在的账户名称
        int installmentFlag = 0; // 不存在的分期标志
        int paymethod = 0; // 不存在的支付方式
        int cycleType = 0; // 不存在的周期类型
        String custStatus = "1"; // 不存在的客户状态
        int start = 0; // 起始行索引
        int end = 10; // 结束行索引

        // 调用方法
        IBOCmCustAcctRelValue[] custAcctRels = cmAccountSV.queryCustAcctRel(
                relCustd, acctId, acctName, installmentFlag, paymethod, cycleType, custStatus, start, end
        );

        // 断言验证
        Assertions.assertNotNull(custAcctRels, "查询结果不应为空");
        Assertions.assertEquals(0, custAcctRels.length, "返回的客户账户关系数量应为0");
    }

    @Test
    public void testQueryCustAcctRel_MultipleResults() throws Exception {
        // 输入参数（匹配多个条件）
        long acctId = 0L; // 账户ID
        String acctName = ""; // 账户名称
        int installmentFlag = 0; // 分期标志
        int paymethod = 0; // 支付方式
        int cycleType = 0; // 周期类型
        String custStatus = "1"; // 客户状态
        int start = 0; // 起始行索引
        int end = 10; // 结束行索引

        // 调用方法
        IBOCmCustAcctRelValue[] custAcctRels = cmAccountSV.queryCustAcctRel(
                relCustd, acctId, acctName, installmentFlag, paymethod, cycleType, custStatus, start, end
        );

        // 断言验证
        Assertions.assertNotNull(custAcctRels, "查询结果不应为空");
        Assertions.assertTrue(custAcctRels.length > 1, "返回的客户账户关系数量应大于1");
    }


}