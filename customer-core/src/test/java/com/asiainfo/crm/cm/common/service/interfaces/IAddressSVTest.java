package com.asiainfo.crm.cm.common.service.interfaces;

import com.ai.appframe2.service.ServiceFactory;
import com.aie.test.BaseTest;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.common.util.ws.address4QryContion;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;

public class IAddressSVTest extends BaseTest {

    private IAddressSV addressSV = (IAddressSV) ServiceFactory.getService(IAddressSV.class);

    @Test
    public void testQueryAddressList() throws Exception {
        // 输入参数
        address4QryContion address = new address4QryContion(); // 假设这是一个查询条件对象
        int strIdx = 0;
        int endIdx = 10;
        address.setZipcode("4573");
        address.setStreetName("Gudmindrupvej");
        address.setHouseNumber("10");
        address.setAddressType("CPR_ADDRESS");
        address.setCity("Højby");
        // 调用方法
       address[] addresses = addressSV.queryAddressList(address, "XML", "21", strIdx, endIdx);

        // 断言验证
        Assertions.assertNotNull(addresses, "查询结果不应为空");
        Assertions.assertTrue(addresses.length > 0, "至少返回一个地址");
        Assertions.assertEquals("5716721",addresses[0].getAddressId(),"adressId");
    }
}