package com.asiainfo.crm.cm.common.util;

import com.ai.common.ivalues.IBOBsParaDetailValue;
import com.aie.test.BaseTest;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


public class CmCommonUtilTest extends BaseTest {

    @Test
    void getDkCreditClass() throws Exception {
        IBOBsParaDetailValue[] value = CmCommonUtil.getDkCreditClass();
        Assertions.assertNotNull(value, "客户分群列表不应为空");
    }
}