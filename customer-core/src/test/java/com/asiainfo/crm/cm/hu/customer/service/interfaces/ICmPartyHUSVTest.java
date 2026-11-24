package com.asiainfo.crm.cm.hu.customer.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.TimeUtil;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.hu.party.BOCmPartyPermissionBean;
import com.asiainfo.crm.cm.hu.party.IBOCmPartyPermissionValue;
import com.asiainfo.crm.common.util.CMUserInfoUtil;
import com.asiainfo.isub.base.common.DataTypeUtils;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmPartyHUSVTest extends BaseTest {

    private ICmPartyHUSV partyHUSV = (ICmPartyHUSV) ServiceFactory.getService(ICmPartyHUSV.class);

    @Test
    public void testQueryPartyPermissionByIdAndRole() throws Exception {
        // 输入参数
        long partyId = 110004511490L;
        int type = 1;
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmPartyPermissionValue[] permissions = partyHUSV.queryPartyPermissionByIdAndRole(partyId, type, start, end);

        // 断言验证
        Assertions.assertNotNull(permissions, "权限列表不应为空");
        Assertions.assertEquals(1, permissions.length, "应返回1条权限记录");
    }

    @Test
    public void testSavePartyPermission() throws Exception {
        // 输入参数
        long partyId = 110004511490L;
        IBOCmPartyPermissionValue temp = new BOCmPartyPermissionBean();
        temp.setPartyId(partyId);
        temp.setRelId(1L);
        temp.setPermissonType(4L);
        temp.setPermissionValue("1");
        temp.setState("U");
        temp.setCreateDate(DataTypeUtils.getCurrentDate());
        temp.setDoneCode(CMUserInfoUtil.getDoneCode());
        temp.setDoneDate(DataTypeUtils.getCurrentDate());
        temp.setOpId(CMUserInfoUtil.getOpId());
        temp.setOrgId(CMUserInfoUtil.getOrgId());
        temp.setEffectiveDate(DataTypeUtils.getCurrentDate());
        temp.setExpireDate(TimeUtil.getMaxExpire());
        temp.setRegionId(CMUserInfoUtil.getRegionId());
        temp.setCreateOpId(CMUserInfoUtil.getOpId());
        temp.setCreateOrgId(CMUserInfoUtil.getOrgId());
        // 调用方法
        partyHUSV.savePartyPermission(new IBOCmPartyPermissionValue[]{temp});
        IBOCmPartyPermissionValue partyPermissionValue = partyHUSV.queryPartyPermissionById(1L);
        Assertions.assertNotNull(partyPermissionValue, "权限记录不应为空");
    }

    @Test
    public void testDeletePartyPermission() throws Exception {
        IBOCmPartyPermissionValue partyPermissionValue = partyHUSV.queryPartyPermissionById(1L);
        Assertions.assertNotNull(partyPermissionValue, "权限记录不应为空");
        partyPermissionValue.delete();
        partyHUSV.savePartyPermission(new IBOCmPartyPermissionValue[] { partyPermissionValue });
         partyPermissionValue = partyHUSV.queryPartyPermissionById(1L);
        Assertions.assertNull(partyPermissionValue, "权限记录为空");
    }
}