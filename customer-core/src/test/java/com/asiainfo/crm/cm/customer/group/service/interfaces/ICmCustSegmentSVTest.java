package com.asiainfo.crm.cm.customer.group.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmCustSegmentSVTest extends BaseTest {

    private ICmCustSegmentSV segmentSV = (ICmCustSegmentSV) ServiceFactory.getService(ICmCustSegmentSV.class);

    @Test
    public void testQuerySegmentByParentIdfromCache() throws Exception {
        // 输入参数
        long segId = 200000000001L;
        String segName = "PA";
        long parentSegId = 2L;
        String regionId = "012";

        // 调用方法
        IBoCmCustSegmentValue[] segments = segmentSV.querySegmentByParentIdfromCache(segId, segName, parentSegId, regionId);

        // 断言验证
        Assertions.assertNotNull(segments, "客户分群列表不应为空");
        Assertions.assertEquals(1, segments.length, "应返回1个分群结果");
        Assertions.assertEquals(segName, segments[0].getSegmentName(), "细分名");

    }
}