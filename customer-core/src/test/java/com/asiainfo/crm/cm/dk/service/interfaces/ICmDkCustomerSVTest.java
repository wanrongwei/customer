package com.asiainfo.crm.cm.dk.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.common.ivalues.IBOCmInsCmrelValue;
import com.asiainfo.crm.cm.common.ivalues.IBOIdentificationValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmDkCustomerSVTest extends BaseTest {

    private ICmDkCustomerSV dkCustomerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);

    @Test
    public void testQueryCustIdentifications() throws Exception {
        // 输入参数
        long partyId = Long.valueOf(configReader.getProperty("partyId"));
        int idenType = 17;
        String idenCode = "K23210013581024";

        // 调用方法
        IBOIdentificationValue[] identifications = dkCustomerSV.queryCustIdentifications(partyId, idenType, idenCode);

        // 断言验证
        Assertions.assertNotNull(identifications, "身份信息列表不应为空");
        Assertions.assertEquals(1, identifications.length, "应返回1条身份信息记录");
        Assertions.assertEquals(idenCode, identifications[0].getIdenNr(), "idenCode");

    }

    @Test
    public void testQueryGroupDeptBill() throws Exception {
        // 输入参数
        String criteria = "BILL_CRITERIA";
        int startNum = 0;
        int endNum = 10;

        // 调用方法
        DataContainer[] bills = dkCustomerSV.queryGroupDeptBill(criteria, startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(bills, "账单列表不应为空");
        Assertions.assertEquals(3, bills.length, "应返回3条账单记录");
    }

    @Test
    public void testQueryGroupDeptBillCount() throws Exception {
        // 输入参数
        String criteria = "BILL_CRITERIA";

        // 调用方法
        int count = dkCustomerSV.queryGroupDeptBillCount(criteria);

        // 断言验证
        Assertions.assertEquals(5, count, "账单数量应为5");
    }

    @Test
    public void testQueryGroupDeptUser() throws Exception {
        // 输入参数
        long custId = 12345L;
        String billId = "BILL_001";
        int startNum = 0;
        int endNum = 10;

        // 调用方法
        IBOCmInsCmrelValue[] users = dkCustomerSV.queryGroupDeptUser(custId, billId, startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(users, "用户列表不应为空");
        Assertions.assertEquals(2, users.length, "应返回2条用户记录");
    }

    @Test
    public void testQueryGroupDeptUserCount() throws Exception {
        // 输入参数
        long custId = 12345L;
        String billId = "BILL_001";

        // 调用方法
        int count = dkCustomerSV.queryGroupDeptUserCount(custId, billId);

        // 断言验证
        Assertions.assertEquals(3, count, "用户数量应为3");
    }
}