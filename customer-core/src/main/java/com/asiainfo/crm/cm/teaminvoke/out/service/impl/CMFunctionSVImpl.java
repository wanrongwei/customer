package com.asiainfo.crm.cm.teaminvoke.out.service.impl;

import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.asiainfo.crm.cm.common.util.CmStaticDataUtil;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICMFunctionSV;

public class CMFunctionSVImpl implements ICMFunctionSV {

    @Override
    public IBOBsStaticDataValue[] genStaticDataDs(boolean isChoose, boolean isAll, String codeType) throws Exception {
        return CmStaticDataUtil.genStaticDataDs(isChoose, isAll, codeType);
    }

    @Override
    public IBOBsStaticDataValue[] genStaticDataDs(boolean isChoose, String codeType) throws Exception {
        return CmStaticDataUtil.genStaticDataDs(isChoose, codeType);
    }

    @Override
    public IBOBsStaticDataValue[] genStaticDataDsAndFilterCodeValues(String codeType, String codeValue, boolean isDisplay) throws Exception {
        return CmStaticDataUtil.genStaticDataDsAndFilterCodeValues(codeType, codeValue, isDisplay);
    }

    @Override
    public IBOBsStaticDataValue[] getStaticDataByTenantID(String codeType) throws Exception {
        return CmStaticDataUtil.getStaticDataByTenantID(codeType);
    }
}
