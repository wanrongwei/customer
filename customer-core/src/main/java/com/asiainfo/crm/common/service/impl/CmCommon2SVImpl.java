package com.asiainfo.crm.common.service.impl;


import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.StaticDataUtil;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.common.service.interfaces.ICmCommon2SV;


public class CmCommon2SVImpl implements ICmCommon2SV {
    public String queryAcctCategory(long custId,String categoryId) throws Exception {
        int custType = CmCommonUtil.getCustType(custId);
        IBOBsStaticDataValue staticValue;
        if (custType == CmConstants.CustomerType.GROUP) {
           staticValue= StaticDataUtil.getStaticData("CM_GRP_INSTALLMENT_FLAG", categoryId);
        } else {
            staticValue= StaticDataUtil.getStaticData("CM_INSTALLMENT_FLAG",categoryId);
        }
        if (staticValue!=null){
            return staticValue.getCodeName();
        }
        return null;
    }
}
