package com.asiainfo.crm.cm.teaminvoke.out.service.interfaces;

import com.ai.common.ivalues.IBOBsStaticDataValue;

public interface ICMFunctionSV {
    public  IBOBsStaticDataValue[] genStaticDataDs(boolean isChoose, boolean isAll, String codeType) throws Exception;
    public IBOBsStaticDataValue[] genStaticDataDs(boolean isChoose, String codeType) throws Exception ;

    public  IBOBsStaticDataValue[] genStaticDataDsAndFilterCodeValues(String codeType, String codeValue, boolean isDisplay) throws Exception ;
    public IBOBsStaticDataValue[] getStaticDataByTenantID(String codeType) throws Exception;

    }
