package com.asiainfo.crm.cm.common.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.bo.BOCmCustPermissionClauseBean;
import com.asiainfo.crm.cm.common.ivalues.IBOCmCustPermissionClauseValue;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmCustPermissionClauseSVTest extends BaseTest {
    String clauseId="99";
    private ICmCustPermissionClauseSV clauseSV = (ICmCustPermissionClauseSV) ServiceFactory.getService(ICmCustPermissionClauseSV.class);

    @Test
    public void testQryCmCustPermissionClause() throws Exception {
        // 输入参数
        String parentClauseId = "20";
        int startIndex = 0;
        int endIndex = 5;

        // 调用方法
        IBOCmCustPermissionClauseValue[] clauses = clauseSV.qryCmCustPermissionClause(parentClauseId, startIndex, endIndex);

        // 断言验证
        Assertions.assertNotNull(clauses, "权限条款列表不应为空");
        Assertions.assertEquals(2, clauses.length, "应返回2条权限条款");
    }
    @Test
    public void testSaveCustPermission() throws Exception {
        // 输入参数
        IBOCmCustPermissionClauseValue clauseValue=new BOCmCustPermissionClauseBean();
        // 调用方法
        clauseValue.setClauseId(99L);
        clauseValue.setLevel(3);
        clauseValue.setParentClauseId(2L);
        clauseValue.setSeqNo(1L);
        clauseValue.setClauseContent("xtete");
        clauseValue.setRegionId(CmCommonUtil.getDefaultRegionId());
        clauseValue.setState(CmConstants.RecordState.USE);
        clauseSV.saveCustPermission(new IBOCmCustPermissionClauseValue[]{clauseValue});
        IBOCmCustPermissionClauseValue value = clauseSV.qryCmCustPermissionInfo(clauseId);
        // 断言验证
        Assertions.assertNotNull(value, "权限条款列表不应为空");
        Assertions.assertEquals(Long.valueOf(clauseId),value.getClauseId(), "权限条款ID");
    }
    @Test
    public void testDeleteCustPermissionClause() throws Exception {
        // 输入参数
        IBOCmCustPermissionClauseValue value = clauseSV.qryCmCustPermissionInfo(clauseId);
        value.delete();
        clauseSV.saveCustPermission(new IBOCmCustPermissionClauseValue[] {value});
        IBOCmCustPermissionClauseValue val = clauseSV.qryCmCustPermissionInfo(clauseId);
        // 断言验证
        Assertions.assertNull(val, "权限条款列表为空");
    }
}