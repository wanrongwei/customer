package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.ivalues.IBOCmInsCmrelValue;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmCustRequestValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmCustContactMediumBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmContactContMediumValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContactMediumValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmCustContMediumAndTypeValue;
import com.asiainfo.crm.cm.model.ivalues.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
import org.springframework.test.context.event.annotation.AfterTestMethod;

import java.util.HashMap;
import java.util.Map;

public class ICmCustomerSVTest extends BaseTest {

    private ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
    long custContId =Long.valueOf(configReader.getProperty("custContId"));
    long custId =configReader.getB2BCustId();
    long tafCustId=23210113921822L;
    @Test
    public void testQueryCmInsCmrel() throws Exception {
        // 输入参数
        int startIndex = 0;
        int endIndex = 20;

        // 调用方法
        IBOCmInsCmrelValue[] insCmrels = customerSV.queryCmInsCmrel(custId, startIndex, endIndex);

        // 断言验证
        Assertions.assertNotNull(insCmrels, "客户关系列表不应为空");
        Assertions.assertEquals(12, insCmrels.length, "应返回24条客户关系记录");
        Assertions.assertEquals(42109110300032L, insCmrels[0].getUserId(), "应返回24条客户关系记录");

    }

    @Test
    public void testQueryCmInsCmrelCount() throws Exception {
        // 输入参数
        // 调用方法
        int count = customerSV.queryCmInsCmrelCount(custId);

        // 断言验证
        Assertions.assertEquals(12, count, "客户关系数量应为24");
    }

    @Test
    public void testQueryContactContMediumCount() throws Exception {
        // 调用方法
        int count = customerSV.queryContactContMediumCount(custContId);

        // 断言验证
        Assertions.assertEquals(2, count, "联系媒介数量应为2");
    }

    @Test
    public void testQueryContactContMediumForPage() throws Exception {
        // 输入参数
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmContactContMediumValue[] mediums = customerSV.queryContactContMediumForPage(custContId, start, end);
        // 断言验证
        Assertions.assertNotNull(mediums, "联系媒介列表不应为空");
        Assertions.assertEquals(2, mediums.length, "应返回2条联系媒介记录");
    }

    @Test
    public void testQueryCustContactMediumsForPage() throws Exception {
        // 输入参数
        long mediumType = 11L;
        long upMediumType = 1L;
        int start = 0;
        int end = 10;

        // 调用方法
        IQBOCmCustContMediumAndTypeValue[] mediums = customerSV.queryCustContactMediumsForPage(custId, mediumType, upMediumType, start, end);

        // 断言验证
        Assertions.assertNotNull(mediums, "联系媒介列表不应为空");
        Assertions.assertEquals(1, mediums.length, "应返回3条联系媒介记录");
    }

    @Test
    public void testQueryCustElectronicMediumForPage() throws Exception {
        // 输入参数
        int start = 0;
        int end = 10;

        // 调用方法
        IQBOCmCustContMediumAndTypeValue[] mediums = customerSV.queryCustElectronicMediumForPage(custId, start, end);

        // 断言验证
        Assertions.assertNotNull(mediums, "电子媒介列表不应为空");
        Assertions.assertEquals(0, mediums.length, "应返回1条电子媒介记录");
    }

    @Test
    public void testSaveCustContMedium() throws Exception {
        // 调用方法
          customerSV.saveCustContMedium(this.setContactMedia(1L));
    }
    @AfterTestMethod()
    public void testDeleteCustAddress() throws Exception {
        IBOCmCustContactMediumValue contactMediumValue = customerSV.queryCustContMediumById(1L);
        contactMediumValue.delete();
        IBOCmCustContactMediumValue phone = customerSV.queryCustContMediumById(2L);
        phone.delete();
        IBOCmCustContactMediumValue email = customerSV.queryCustContMediumById(3L);
        email.delete();
        customerSV.saveCustContMedium(new IBOCmCustContactMediumValue[] { contactMediumValue,phone,email });
    }

    private IBOCmCustContactMediumValue[]  setContactMedia(long custId) throws Exception {
        IBOCmCustContactMediumValue[] contactmediums=new IBOCmCustContactMediumValue[3];
        IBOCmCustContactMediumValue contactmedium= new BOCmCustContactMediumBean();
        contactmedium.setCustContRelaId(1L);
        contactmedium.setAddressId(5181639L);
        contactmedium.setCustId(custId);
        //法律地址
        contactmedium.setContMedTypeId(11L);
        contactmedium.setAddressDetail("Boulevarden 7 9000 Aalborg");
        contactmediums[0]=contactmedium;

        IBOCmCustContactMediumValue phone= new BOCmCustContactMediumBean();
        phone.setCustContRelaId(2L);
        phone.setCustId(custId);
        phone.setContNumber("21312222");
        phone.setContMedTypeId(31L);
        phone.setIsNoDisturbing(0L);
        phone.setPriority(1L);
        contactmediums[1]=phone;

        IBOCmCustContactMediumValue email= new BOCmCustContactMediumBean();
        email.setCustContRelaId(3L);
        email.setCustId(custId);
        email.setEmailAddress("yangjin@123.com");
        email.setContMedTypeId(21L);
        email.setIsNoDisturbing(0L);
        email.setPriority(2L);
        contactmediums[2]=email;
        return contactmediums;
     }

    @Test
    public void testQueryCustForManagerAndLog() throws Exception {
        // 输入参数

        Map<String, String> parameters=new HashMap<>();
        parameters.put(ICustomerValue.S_CustId,String.valueOf(custId));
        String xmlString = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",parameters);
        String segmentId = "200000000004";
        int start = -1;
        int end = -1;

        // 调用方法
        ICustomerValue[] customers = customerSV.queryCustForManagerAndLog(xmlString, segmentId, start, end);

        // 断言验证
        Assertions.assertNotNull(customers, "客户列表不应为空");
        Assertions.assertEquals(1, customers.length, "应返回1条客户记录");
        Assertions.assertEquals(configReader.getB2CCustName(), "testpassword", "客户名");
     }

    @Test
    public void testQueryCustForManagerSqlCount() throws Exception {
        // 输入参数
        Map<String, String> parameters=new HashMap<>();
        parameters.put(ICustomerValue.S_CustId,String.valueOf(custId));
        String xmlString = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",parameters);
        String segmentId = "200000000004";

        // 调用方法
        int count = customerSV.queryCustForManagerSqlCount(xmlString, segmentId);

        // 断言验证
        Assertions.assertEquals(1, count, "客户数量应为1");
    }



    @Test
    public void testQueryCustRequestTask() throws Exception {
        // 输入参数
        int startNum = 0;
        int endNum = 10;
        Map<String, String> parameters=new HashMap<>();
        parameters.put(ICustomerValue.S_CustName,"Kristine");
        String xmlCondition = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",parameters);

        // 调用方法
        IQBOCmCustRequestValue[] requests = customerSV.queryCustRequestTask(xmlCondition, startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(requests, "请求任务列表不应为空");
        Assertions.assertEquals(4, requests.length, "应返回3条请求任务记录");
        Assertions.assertEquals("Kristine Algot Erbak", requests[0].getCustName(), "应返回3条请求任务记录");
    }

    @Test
    public void testQueryCustomerCount() throws Exception {
        // 输入参数
        DataContainer conditionDC = new DataContainer(); // 假设这是一个查询条件对象
        conditionDC.set(ICustomerValue.S_CustId,custId);
        // 调用方法
        int count = customerSV.queryCustomerCount(conditionDC);

        // 断言验证
        Assertions.assertEquals(1, count, "客户数量应为1");
    }

    @Test
    public void testQueryCustomerMaskByCustIdAndLog() throws Exception {
        // 输入参数

        // 调用方法
        ICustomerValue customer = customerSV.queryCustomerMaskByCustIdAndLog(custId);

        // 断言验证
        Assertions.assertNotNull(customer, "客户信息不应为空");
        Assertions.assertEquals(configReader.getB2BCustName(), customer.getCustName(), "客户姓名不匹配");
    }

    @Test
    public void testQueryCustomers() throws Exception {
        // 输入参数
        DataContainer conditionDC = new DataContainer(); // 假设这是一个查询条件对象
        int startNum = 0;
        int endNum = 10;
        conditionDC.set(ICustomerValue.S_CustId,custId);
        // 调用方法
        ICustomerValue[] customers = customerSV.queryCustomers(conditionDC, startNum, endNum);
        // 断言验证
        Assertions.assertNotNull(customers, "客户列表不应为空");
        Assertions.assertEquals(1, customers.length, "应返回1条客户记录");
        Assertions.assertEquals(custId, customers[0].getCustId(), "客户ID");
        Assertions.assertEquals(configReader.getB2BCustName(), customers[0].getCustName(), "客户ID");

    }

    @Test
    public void testQueryGroupIndustryForPage() throws Exception {
        // 输入参数
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmGroupRelIndustryValue[] industries = customerSV.queryGroupIndustryForPage(custId, start, end);

        // 断言验证
        Assertions.assertNotNull(industries, "行业信息列表不应为空");
        Assertions.assertEquals(0, industries.length, "应返回2条行业信息记录");
    }

    @Test
    public void testQueryGroupMembersByCondition() throws Exception {
        // 输入参数
        String criteria = "MEMBER_CRITERIA";
        int startNum = 0;
        int endNum = 10;

        // 调用方法
        IGroupMemberValue[] members = customerSV.queryGroupMembersByCondition(criteria, startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(members, "群组成员列表不应为空");
        Assertions.assertEquals(3, members.length, "应返回3条群组成员记录");
    }

    @Test
    public void testQueryMainCustManagersByCustId() throws Exception {
        // 调用方法
        ICustManagerValue manager = customerSV.queryMainCustManagersByCustId(tafCustId);

        // 断言验证
        Assertions.assertNotNull(manager, "客户经理信息不应为空");
        Assertions.assertEquals("PA1TSM", manager.getStaffName(), "客户经理姓名不匹配");
    }
}