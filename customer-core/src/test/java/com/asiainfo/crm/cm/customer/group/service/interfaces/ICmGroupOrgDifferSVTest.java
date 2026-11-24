package com.asiainfo.crm.cm.customer.group.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmGroupOrgDifferValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmGroupOrgDifferSVTest extends BaseTest {

    private ICmGroupOrgDifferSV differSV = (ICmGroupOrgDifferSV) ServiceFactory.getService(ICmGroupOrgDifferSV.class);
    //Customer Hierarchy
    //集团组织结构差异结果
    @Test
    public void testQueryGroupOrgDifferCount() throws Exception {
        // 调用方法
        int count = differSV.queryGroupOrgDifferCount(configReader.getB2BCustId());

        // 断言验证
        Assertions.assertEquals(1, count, "差异数量应为1");
    }

    @Test
    public void testQueryGroupOrgDiffers() throws Exception {
        // 输入参数
        int startNum = 0;
        int endNum = 1;

        // 调用方法
        IQBOCmGroupOrgDifferValue[] differs = differSV.queryGroupOrgDiffers(configReader.getB2BCustId(), startNum, endNum);

        // 断言验证
        Assertions.assertNotNull(differs, "差异列表不应为空");
        Assertions.assertEquals(1, differs.length, "应返回1条差异记录");
        Assertions.assertEquals(configReader.getB2BCustId(), differs[0].getCustId(), "客户ID");
        Assertions.assertEquals(configReader.getB2BCustName(), differs[0].getCustName(), "客户ID");

    }
}