package com.asiainfo.crm.cm.customer.group.service.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import com.asiainfo.crm.cm.customer.group.service.interfaces.ICmCustSegmentSV;
import com.asiainfo.crm.cm.ln.customer.group.ivalues.IBOLnCmxGroupCustValue;
import com.asiainfo.crm.cm.ln.customer.group.service.interfaces.ICmLnGroupSV;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class CmCustSegmentSVImplTest extends BaseTest {
    ICmCustSegmentSV sv = (ICmCustSegmentSV) ServiceFactory.getService(ICmCustSegmentSV.class);

    @Test
    public void testQuerySegmentByParentIdfromCache() throws Exception {
        IBoCmCustSegmentValue[] result = sv.querySegmentFromCache(2L);
        Assertions.assertEquals(6, result.length,"Segment length");
        Assertions.assertEquals(200000000000L, result[0].getSegmentId(),"SegmentId");
        Assertions.assertEquals("NO_SEGMENT", result[0].getSegmentName(),"SegmentName");

    }
}
