package com.asiainfo.crm.cm.service.impl;


import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.AIException;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.DataType;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.TimeUtil;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.ivalues.IBOCmInsCmrelValue;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.custgroup.utils.StringRandom;
import com.asiainfo.crm.cm.customer.group.bo.BOCmGroupCustomerBean;
import com.asiainfo.crm.cm.customer.group.bo.BOCmGroupRelIndustryBean;
import com.asiainfo.crm.cm.customer.group.bo.BoCmGroupAccountingBean;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmGroupAccountingValue;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmCustContactMediumBean;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmCustSegmentRelaBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmContactContMediumValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContactMediumValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustSegmentRelaValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmCustContMediumAndTypeValue;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean;
import com.asiainfo.crm.cm.ln.customer.group.bo.BOLnCmxGroupCustBean;
import com.asiainfo.crm.cm.ln.customer.group.ivalues.IBOLnCmxGroupCustValue;
import com.asiainfo.crm.cm.model.bean.VOCustAddressBean;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bo.CustManagerBean;
import com.asiainfo.crm.cm.model.bo.CustomerBean;
import com.asiainfo.crm.cm.model.ivalues.*;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.ICmGroupCustomerSV;
import com.asiainfo.crm.common.util.CMUserInfoUtil;
import com.asiainfo.crm.so.exe.ws.crmcallams.imswrapservice.MailGroupPost;
import com.asiainfo.isub.base.common.DataTypeUtils;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.awt.image.ImageProducer;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

public class CmCustomerSVImplTest extends BaseTest {
    ICmCustomerSV cmCustomerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
    ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);

    long custid=23210113921822L;

    /**
     * 查询客户基本信息
     * @throws Exception
     */
    @Test
    public void testQueryCustomerMaskByCustIdAndLog() throws Exception {
        ICustomerValue result = cmCustomerSV.queryCustomerMaskByCustIdAndLog(custid);
        Assertions.assertEquals(custid, result.getCustId(),"custId");
        Assertions.assertEquals("TAF_New_Con_2", result.getCustName(),"custName");
    }

    /**
     * 保存B2B客户
     * @throws Exception
     */
    @Test
    public void testSaveCustomer() throws Exception {
        IVOCustValue custValue = new VOCustBean();
        ICmCommonSV service=(ICmCommonSV)ServiceFactory.getService(ICmCommonSV.class);
        long custId=service.getCustId(CmConstants.CustomerType.GROUP);
        long partyId = service.getCommonNewSequence(BOCmPartyBean.class);
        // 创建集团业务
        custValue.setBusinessId(CmConstants.BusiLogId.GROUP_CREATE);

        //客户基本信息
        setCustomerBasic(custId,partyId,custValue);

        // 设置集团扩展信息
        customerExt(custValue);

        // 设置集团客户经理信息
        setCustManger(custValue, custId);

        // 设置集团会计信息
        setAccount(custValue, custId);

        // 设置集团联系媒体信息 法律地址
        setContactMedia(custValue,custId);

        // 设置集团客户细分
        setCustSegmentRel(custValue, custId);

        cmCustomerSV.saveCustomer(custValue);
        //集团行业
        saveIndustry(custId);

        System.out.println(custId);
    }

    /*
     * 查询行业信息
     */
    @Test
    public void testQueryGroupIndustryForPage() throws Exception {
        IBOCmGroupRelIndustryValue[] indstry = cmCustomerSV.queryGroupIndustryForPage(custid, 0, 10);
        Assertions.assertEquals(1,indstry.length,"indstry");
        Assertions.assertEquals(23210113921822L,indstry[0].getCustId(),"custId");
        Assertions.assertEquals("Growing of rice",indstry[0].getIndustryId(),"industryId");
    }

    @Test
    public void testQueryCustContactMediumsForPage() throws Exception {
        // 输入参数
        long mediumType = 14; // 媒介类型
        long upMediumType = 1; // 上级媒介类型
        int startRowIndex = 0; // 起始行索引
        int endRowIndex = 10; // 结束行索引

        // 调用方法
        IQBOCmCustContMediumAndTypeValue[] contactMediums = cmCustomerSV.queryCustContactMediumsForPage(custid, mediumType, upMediumType, startRowIndex, endRowIndex);

        // 断言验证
        Assertions.assertNotNull(contactMediums, "查询结果不应为空");
        Assertions.assertEquals(2, contactMediums.length, "返回的联系媒介数量应为1");

        // 验证第一个联系媒介的属性
        IQBOCmCustContMediumAndTypeValue firstMedium = contactMediums[0];
        Assertions.assertEquals(custid, firstMedium.getCustId(), "客户ID不匹配");
        Assertions.assertEquals(mediumType, firstMedium.getContMedTypeId(), "媒介类型不匹配");
        Assertions.assertEquals(5323988L, firstMedium.getAddressId(), "媒介类型不匹配");
    }

    @Test
    public void testQueryCustElectronicMediumForPage() throws Exception {
        // 输入参数
        int startRowIndex = 0; // 起始行索引
        int endRowIndex = 10; // 结束行索引

        // 调用方法
        IQBOCmCustContMediumAndTypeValue[] electronicMediums = cmCustomerSV.queryCustElectronicMediumForPage(custid, startRowIndex, endRowIndex);

        // 断言验证
        Assertions.assertNotNull(electronicMediums, "查询结果不应为空");
        Assertions.assertEquals(2, electronicMediums.length, "返回的电子媒介数量应为1");

        // 验证第一个电子媒介的属性
        IQBOCmCustContMediumAndTypeValue firstMedium = electronicMediums[0];
        Assertions.assertEquals(custid, firstMedium.getCustId(), "客户ID不匹配");
        Assertions.assertEquals("123@163.com", firstMedium.getEmailAddress(), "电子邮件不匹配");
    }

    /**
     * 查询客户列表
     * @throws Exception
     */
    @Test
    public void testQueryCusts4GroupAndLog() throws Exception {
         Map doducer=new HashMap<>() ;
        doducer.put("QRY_TYPE","1");
        doducer.put("CUST_ID","23210118262022");
        doducer.put(ICustomerValue.S_CustType,"3");
        String xmlComdition=ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer",  doducer);
        ICustomerValue[] custInfo = cmCustomerSV.queryCusts4GroupAndLog(xmlComdition, "", -1, -1);
        Assertions.assertEquals(1,custInfo.length,"custInfo");
        Assertions.assertEquals(23210118262022L,custInfo[0].getCustId(),"custId");
        Assertions.assertEquals("test_cust_name_yj45044",custInfo[0].getCustName(),"custName");
    }

    @Test
    public void testQueryAllCustMgrsByCustId() throws Exception {
        // 输入参数
        int startRowIndex = 0; // 起始行索引
        int endRowIndex = 10; // 结束行索引

        // 调用方法
        ICustManagerValue[] managers = cmCustomerSV.queryAllCustMgrsByCustId(custid, startRowIndex, endRowIndex);

        // 断言验证
        Assertions.assertNotNull(managers, "查询结果不应为空");
        Assertions.assertEquals(1, managers.length, "返回的客户经理数量应为1");

        // 验证第一个客户经理的属性
        ICustManagerValue firstManager = managers[0];
        Assertions.assertEquals(custid, firstManager.getCustId(), "客户ID不匹配");
        Assertions.assertEquals("PA1TSM", firstManager.getStaffName(), "客户经理姓名不匹配");
    }


    private void setCustSegmentRel(IVOCustValue custValue, long custId) throws Exception {
        IBOCmCustSegmentRelaValue custSegmentRela = new BOCmCustSegmentRelaBean();
        custSegmentRela.setCustId(custId);// 取得集团客户ID
        custSegmentRela.setSegmentId(DataType.getAsLong(custValue.getCustomer().getGroupSegmentId()));
        custSegmentRela.setIsRevisable(1L);// 设置是否可修订
        custSegmentRela.setIsCreditCalculated(1L);// 设置是否可计算信用
        custSegmentRela.setIsApprovable(0L);// 设置是否可审批
        custSegmentRela.setIsInheritable(1L);// 设置是否可继承
        custValue.setUserObject("cmSegmentRela", custSegmentRela);
    }

    private void setContactMedia(IVOCustValue custValue,long custId) throws Exception {
        IBOCmCustContactMediumValue[] contactmediums=new IBOCmCustContactMediumValue[3];
        IBOCmCustContactMediumValue contactmedium= new BOCmCustContactMediumBean();
        contactmedium.setAddressId(5181639L);
        contactmedium.setCustId(custId);
        //法律地址
        contactmedium.setContMedTypeId(11L);
        contactmedium.setAddressDetail("Boulevarden 7 9000 Aalborg");
        contactmediums[0]=contactmedium;

        IBOCmCustContactMediumValue phone= new BOCmCustContactMediumBean();
        phone.setCustId(custId);
        phone.setContNumber("21312222");
        phone.setContMedTypeId(31L);
        phone.setIsNoDisturbing(0L);
        phone.setPriority(1L);
        contactmediums[1]=phone;

        IBOCmCustContactMediumValue email= new BOCmCustContactMediumBean();
        email.setCustId(custId);
        email.setEmailAddress("yangjin@123.com");
        email.setContMedTypeId(21L);
        email.setIsNoDisturbing(0L);
        email.setPriority(2L);
        contactmediums[2]=email;
        custValue.addCustContMedium(contactmediums);
    }

    private void setAccount(IVOCustValue custValue, long custId) throws Exception {
        IBoCmGroupAccountingValue custAccounting = new BoCmGroupAccountingBean();
        custAccounting.setCustId(custId);
        // 设置操作员编号的逻辑
        custAccounting.setRatingCode("Rating");
        // 设置操作年份的逻辑
        custAccounting.setFiscalYear("1000");
        // 设置收入的逻辑
        custAccounting.setRevenue("2000");
        // 设置去年员工数的逻辑
        custAccounting.setLastYearEmployees(3000);
        // 设置账户备注的逻辑
        custAccounting.setAccountRemark("Remarks");
        custValue.addCustAccounting(custAccounting);
    }

    private void setCustManger(IVOCustValue custValue, long custId) throws Exception {
        ICustManagerValue custManagerValue = new CustManagerBean();
        custManagerValue.setCustId(custId);
        // 设置操作员编号
        custManagerValue.setManagerId(100000748);

        // 设置操作员工号
        custManagerValue.setStaffName("PA1TSM");

        // 设置手机号码
        custManagerValue.setBillId("2131231231");

        // 设置电子邮件
        custManagerValue.setContEmail("1122@123.com");

        // 设置操作类型为0
        custManagerValue.setOperType(0);

        // 设置关系类型为1
        custManagerValue.setRelType(1);

        custValue.addCustManager(custManagerValue);
    }

    private void customerExt(IVOCustValue custValue) throws Exception {
        IBOLnCmxGroupCustValue customerKZValue = new BOLnCmxGroupCustBean();
        customerKZValue.setCustId(custValue.getCustomer().getCustId());
        customerKZValue.setTaxId("98679878"); // CVR NO.
        customerKZValue.setDirectMarketingProtection(0); // Commercial Protection营销免打扰
        customerKZValue.setProtectEffDate(Timestamp.valueOf("2024-08-01 00:00:00")); // Effective Date营销免打扰生效时间
        customerKZValue.setProtectExpireDate(Timestamp.valueOf("2025-10-01 00:00:00")); // Expiry Date营销免打扰失效时间
        customerKZValue.setExt17("remark"); // Marketing Permission Remark营销免打扰备注
        customerKZValue.setExt1("1"); // NP Stop否可以携号转网
        customerKZValue.setTaxFlag(1); // Tax Flag免税标记
        customerKZValue.setLegalForm("AMT"); // Legal Form法律形式
        customerKZValue.setExt3("Invoice Username"); // Invoice Username账单显示名称
        customerKZValue.setRegistrationDate(Timestamp.valueOf("2024-09-01 00:00:00")); // Registration Date注册日期
        customerKZValue.setBiCompanyName("Bi Company Name"); // Bi Company Name商业名称
        customerKZValue.setFormerName("Former Name"); // Former Name曾用名
        customerKZValue.setHeadOffice("C/O Name"); // C/O Name总部名称
        customerKZValue.setExt5("Preferred Agent"); // Preferred Agent偏好坐席
        customerKZValue.setExt6("Preferred Work Group"); // Preferred Work Group偏好技术组
        customerKZValue.setExt7("Preferred Department"); // Preferred Department偏好部门
        customerKZValue.setExt22(0); // Stop Payment Fee
        custValue.setUserObject("cmxGrpCust", customerKZValue);// 设置集团扩展信息
    }

    private void setCustomerBasic(long custId,long partyId,IVOCustValue custValue) throws AIException {
        ICustomerValue customerValue=new CustomerBean();
        // Company Name
        customerValue.setCustId(custId);
        customerValue.setCustName("test_cust_name_yj"+ StringRandom.getStringRandomWithNumber(5));
        customerValue.setShortName("test_short_name");
        customerValue.setSegmentName("PA");
        customerValue.setSegmentId("200000000001");
        customerValue.setCustType(CmConstants.CustomerType.GROUP);
        customerValue.setPartyId(partyId); // 参与人ID
        customerValue.setNationality("00400");
        customerValue.setProvinceId("9999");
        customerValue.setCustSegment(200000000001L); // 集团客户细分
        customerValue.setCustCertType(17); // 客户证件类型(17KOB)
        customerValue.setCustStatus(0); // Status集团（客户）状态(0潜在)
        customerValue.setShortName("shortname"); // Short Name集团简称
        customerValue.setGroupSegmentId("200000000001"); // Segment
        customerValue.setGroupType(2); // Company Type集团类型
        customerValue.setDevelopType(1); // Missing KOB number Reason外国集团--类型区分
        customerValue.setStaffAmountType("N"); // Employee Number Range集团员工数量类型
        customerValue.setStaffAmount(500); // Employee Quantity集团员工数量
        customerValue.setCustZipcode("8000"); // Postcode邮政编码
        customerValue.setCustServiceLevel(11); // Category客户服务等级
        customerValue.setGroupSubType(1); // Subsegment集团客户子类型
        customerValue.setRegAmount(1122); // Registered Capital注册资金
        customerValue.setPerferLanguage("3"); // Preferred Language偏好语言
        customerValue.setCustPassword("888888"); // Customer Password客户密码
        customerValue.setCreditLevel("5"); // Credit Level信誉度等级
        customerValue.setCreditValue(200); // Credit Limit信誉度
        customerValue.setGroupWeb("website.xxxx.com"); // Website集团网址
        customerValue.setRemarks("remarks"); // Remarks备注信息
        custValue.setCustomer(customerValue);
    }

    private void saveIndustry(long custId) throws Exception {
        IBOCmGroupRelIndustryValue[] industrys=new BOCmGroupRelIndustryBean[1];
        IBOCmGroupRelIndustryValue industryValue = new BOCmGroupRelIndustryBean();
        industryValue.setSort(5);// 排序
        setCommonIndustry(custId, industryValue);
        industryValue.setIndustryId("01190000");
        industryValue.setIndustryId1("1");
        industryValue.setIndustryId2("A");
        industryValue.setIndustryId3("AA");
        industryValue.setIndustryId4("0100000");
        industrys[0]=industryValue;
        groupCustomerSV.saveGroupRelIndustry(industrys);
    }

    private void setCommonIndustry(long custId, IBOCmGroupRelIndustryValue industryValue) throws Exception {
        industryValue.setCreateDate(DataTypeUtils.getCurrentDate());
        industryValue.setDoneCode(CMUserInfoUtil.getDoneCode());
        industryValue.setDoneDate(DataTypeUtils.getCurrentDate());
        industryValue.setOpId(CMUserInfoUtil.getOpId());
        industryValue.setOrgId(CMUserInfoUtil.getOrgId());
        industryValue.setEffectiveDate(DataTypeUtils.getCurrentDate());
        industryValue.setExpireDate(TimeUtil.getMaxExpire());
        industryValue.setRegionId(CMUserInfoUtil.getRegionId());
        industryValue.setCreateOpId(CMUserInfoUtil.getOpId());
        industryValue.setCreateOrgId(CMUserInfoUtil.getOrgId());
        industryValue.setStsToNew();
        industryValue.setState(CmConstants.RecordState.USE);
        industryValue.setCustId(custId);
    }
    @Test
    public void testQueryContactContMediumForPage() throws Exception {
        // 输入参数
        long custContId = 1100236112L;
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmContactContMediumValue[] contactMediumValues = cmCustomerSV.queryContactContMediumForPage(custContId, start, end);

        // 断言验证
        Assertions.assertNotNull(contactMediumValues, "查询结果不应为空");
        Assertions.assertEquals(1, contactMediumValues.length, "返回的记录数应为10");
        Assertions.assertEquals(201, contactMediumValues[0].getContMedTypeId(), "媒介类型");
        Assertions.assertEquals("2131312@1234.com", contactMediumValues[0].getEmailAddress(), "邮箱");
        // 可以添加更多断言来验证返回的数据
    }

    @Test
    public void testQueryCmInsCmrel() throws Exception {
        // 输入参数
        int startIndex = 0;
        int endIndex = 5;

        // 调用方法
        IBOCmInsCmrelValue[] cmrelValues = cmCustomerSV.queryCmInsCmrel(custid, startIndex, endIndex);

        // 断言验证
        Assertions.assertNotNull(cmrelValues, "查询结果不应为空");
        Assertions.assertEquals(5, cmrelValues.length, "返回的记录数应为5");

        // 可以添加更多断言来验证返回的数据
    }

    @Test
    public void testQueryCustOrganizeById() throws Exception {
        // 输入参数
        long depid=410000956438L;
        // 调用方法
        ICustOrganizeValue customerOrganizationValues = cmCustomerSV.queryCustOrganizeById(depid);

        // 断言验证
        Assertions.assertNotNull(customerOrganizationValues, "查询结果不应为空");
        Assertions.assertEquals(custid, customerOrganizationValues.getCustId(), "客户ID");

        // 可以添加更多断言来验证返回的数据
    }
}

//Generated with love by TestMe :) Please report issues and submit feature requests at: http://weirddev.com/forum#!/testme