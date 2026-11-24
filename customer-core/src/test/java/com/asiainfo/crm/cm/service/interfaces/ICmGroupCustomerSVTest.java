package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.TimeUtil;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.customer.group.bo.BOCmGroupRelIndustryBean;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmSegMgrGroupRelValue;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmGroupApprovalValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmGroupManagerValue;
import com.asiainfo.crm.common.util.CMUserInfoUtil;
import com.asiainfo.isub.base.common.DataTypeUtils;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

import java.util.ArrayList;
import java.util.List;

public class ICmGroupCustomerSVTest extends BaseTest {

    private ICmGroupCustomerSV groupCustomerSV = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);
    long industryRelId=2132132313123L;
    @Test
    public void testGetSAOrMAManagerInfo() throws Exception {
        // 输入参数
        String custId = "CUST_001";
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmGroupManagerValue[] managers = groupCustomerSV.getSAOrMAManagerInfo(custId, start, end);

        // 断言验证
        Assertions.assertNotNull(managers, "经理信息列表不应为空");
        Assertions.assertEquals(2, managers.length, "应返回2条经理信息记录");
    }

    @Test
    public void testQueryCmGroupApproval() throws Exception {
        // 输入参数
        String xmlCondition = "<query><custId>12345</custId></query>";
        int startIndex = 0;
        int endIndex = 10;

        // 调用方法
        IBOCmGroupApprovalValue[] approvals = groupCustomerSV.queryCmGroupApproval(xmlCondition, startIndex, endIndex);

        // 断言验证
        Assertions.assertNotNull(approvals, "审批列表不应为空");
        Assertions.assertEquals(3, approvals.length, "应返回3条审批记录");
    }

    @Test
    public void testQueryCmGroupApprovalCount() throws Exception {
        // 输入参数
        String xmlCondition = "<query><custId>12345</custId></query>";

        // 调用方法
        int count = groupCustomerSV.queryCmGroupApprovalCount(xmlCondition);

        // 断言验证
        Assertions.assertEquals(5, count, "审批数量应为5");
    }

    @Test
    public void testQueryOrgIdBySegmentZipCode() throws Exception {
        // 输入参数
        long segmentId = 12345L;
        long zipCode = 67890L;

        // 调用方法
        IBOCmSegMgrGroupRelValue orgId = groupCustomerSV.queryOrgIdBySegmentZipCode(segmentId, zipCode);

        // 断言验证
        Assertions.assertNotNull(orgId, "组织ID不应为空");
        Assertions.assertEquals(1001L, orgId.getOrgId(), "组织ID不匹配");
    }

    @Test
    public void testSaveGroupRelIndustry() throws Exception {
        IBOCmGroupRelIndustryValue industryValue = new BOCmGroupRelIndustryBean();
        // 调用方法
        saveIndustry(configReader.getB2BCustId());

    }

    @Test
    public void testDeleteGroupRelIndustry() throws Exception {
        IBOCmGroupRelIndustryValue groupIndustryValue = groupCustomerSV.queryIndustry(industryRelId);
        // 删除操作
        groupIndustryValue.delete();
        List<IBOCmGroupRelIndustryValue> list = new ArrayList<IBOCmGroupRelIndustryValue>();
        list.add(groupIndustryValue);
        groupCustomerSV.saveGroupRelIndustry(list.toArray(new BOCmGroupRelIndustryBean[0]));

    }
    private void saveIndustry(long custId) throws Exception {
        IBOCmGroupRelIndustryValue[] industrys=new BOCmGroupRelIndustryBean[1];
        IBOCmGroupRelIndustryValue industryValue = new BOCmGroupRelIndustryBean();
        industryValue.setSort(5);// 排序
        setCommonIndustry(custId, industryValue);
        industryValue.setRelId(industryRelId);
        industryValue.setIndustryId("01190000");
        industryValue.setIndustryId1("1");
        industryValue.setIndustryId2("A");
        industryValue.setIndustryId3("BB");
        industryValue.setIndustryId4("01033");
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
}