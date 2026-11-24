package com.asiainfo.crm.cm.inner.customer.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustSegmentRelaValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmCustSegmentRelaSVTest extends BaseTest {

    private ICmCustSegmentRelaSV segmentRelaSV = (ICmCustSegmentRelaSV) ServiceFactory.getService(ICmCustSegmentRelaSV.class);

    @Test
    public void testQuerySegmentRelaByCustId() throws Exception {
        // 输入参数
        long custId = configReader.getB2BCustId();

        // 调用方法
        IBOCmCustSegmentRelaValue segmentRela = segmentRelaSV.querySegmentRelaByCustId(custId);

        // 断言验证
        Assertions.assertNotNull(segmentRela, "分群关系不应为空");
        Assertions.assertEquals(200000000004L, segmentRela.getSegmentId(), "分群ID不匹配");
    }
}