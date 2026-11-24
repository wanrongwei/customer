package com.asiainfo.crm.cm.dk.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustPerferInfoValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustPerferInfomationValue;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class ICmCustPreferenceInfoSVTest extends BaseTest {

    private ICmCustPreferenceInfoSV preferenceSV = (ICmCustPreferenceInfoSV) ServiceFactory.getService(ICmCustPreferenceInfoSV.class);

    @Test
    public void testQueryCustPreferInformation() throws Exception {
        // 输入参数
        long custId =23210317616422L;
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmCustPerferInfomationValue[] preferences = preferenceSV.queryCustPreferInformation(custId, start, end);

        // 断言验证
        Assertions.assertNotNull(preferences, "偏好信息列表不应为空");
        Assertions.assertEquals(2, preferences.length, "应返回2条偏好信息记录");
    }

    @Test
    public void testQueryCustPreferTimeInfor() throws Exception {
        // 输入参数
        long preferChannelId = 110000019613L;
        int start = 0;
        int end = 10;

        // 调用方法
        IBOCmCustPerferInfoValue[] timeInfos = preferenceSV.queryCustPreferTimeInfor(preferChannelId, start, end);

        // 断言验证
        Assertions.assertNotNull(timeInfos, "时间偏好信息列表不应为空");
        Assertions.assertEquals(1, timeInfos.length, "应返回1条时间偏好信息记录");
    }
}