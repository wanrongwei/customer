package com.asiainfo.crm.cm.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.log.ivalues.IBOCmHisRecordValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmBusiLogSVTest extends BaseTest {

    private ICmBusiLogSV busiLogSV = (ICmBusiLogSV) ServiceFactory.getService(ICmBusiLogSV.class);

    @Test
    public void testQueryHisRecordByCdn() throws Exception {
        // 输入参数
        long id = 23210218267222L;
        String name = "test_cust_name_yj62851";
        int type = 8;
        String startDate = "2025-02-01";
        String endDate = "2025-03-31";
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmHisRecordValue[] records = busiLogSV.queryHisRecordByCdn(id, name, type, startDate, endDate, start, end);

        // 断言验证
        Assertions.assertNotNull(records, "历史记录列表不应为空");
        Assertions.assertEquals(1, records.length, "应返回1条历史记录");
    }
}