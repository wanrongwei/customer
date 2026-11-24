package com.asiainfo.crm.teaminvoke.client;

import com.ai.common.bo.BOBsStaticDataBean;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.StaticDataUtil;
import com.asiainfo.crm.util.LocaleResourceFactory;
import org.apache.commons.lang.StringUtils;

public class SoDataFactory {

    public static IBOBsStaticDataValue[] getI18ResStaticData(String codeType) throws Exception {
        if (StringUtils.isNotBlank(codeType)) {
            IBOBsStaticDataValue[] iboBsStaticDataValues = StaticDataUtil.getStaticData(codeType);
            if (null != iboBsStaticDataValues && iboBsStaticDataValues.length > 0) {
                BOBsStaticDataBean[] arrayOfBOBsStaticDataBean = new BOBsStaticDataBean[iboBsStaticDataValues.length];
                for (int i = 0; i < iboBsStaticDataValues.length; i++) {
                    arrayOfBOBsStaticDataBean[i] = new BOBsStaticDataBean();
                    arrayOfBOBsStaticDataBean[i].setCodeDesc(iboBsStaticDataValues[i].getCodeDesc());
                    arrayOfBOBsStaticDataBean[i].setCodeType(iboBsStaticDataValues[i].getCodeType());
                    arrayOfBOBsStaticDataBean[i].setCodeValue(iboBsStaticDataValues[i].getCodeValue());
                    arrayOfBOBsStaticDataBean[i].setExternCodeType(iboBsStaticDataValues[i].getExternCodeType());
                    String codeName = iboBsStaticDataValues[i].getCodeName();
                    if (StringUtils.isNotBlank(codeName) && codeName.matches("[A-Z]{2}[S]\\d+")) {
                        arrayOfBOBsStaticDataBean[i].setCodeName(LocaleResourceFactory.getResource(codeName));
                    } else {
                        arrayOfBOBsStaticDataBean[i].setCodeName(codeName);
                    }
                }
                return (IBOBsStaticDataValue[])arrayOfBOBsStaticDataBean;
            }
            return null;
        }
        return null;
    }

    public static IBOBsStaticDataValue getI18ResStaticData(String codeType, String codeValue) throws Exception {
        if (StringUtils.isNotBlank(codeType) && StringUtils.isNotBlank(codeValue)) {
            IBOBsStaticDataValue iboBsStaticDataValue = StaticDataUtil.getStaticData(codeType, codeValue);
            if (iboBsStaticDataValue != null) {
                BOBsStaticDataBean bOBsStaticDataBean = new BOBsStaticDataBean();
                bOBsStaticDataBean.setCodeDesc(iboBsStaticDataValue.getCodeDesc());
                bOBsStaticDataBean.setCodeType(iboBsStaticDataValue.getCodeType());
                bOBsStaticDataBean.setCodeValue(iboBsStaticDataValue.getCodeValue());
                bOBsStaticDataBean.setExternCodeType(iboBsStaticDataValue.getExternCodeType());
                String codeName = iboBsStaticDataValue.getCodeName();
                if (StringUtils.isNotBlank(codeName) && codeName.matches("[A-Z]{2}[S]\\d+")) {
                    bOBsStaticDataBean.setCodeName(LocaleResourceFactory.getResource(codeName));
                } else {
                    bOBsStaticDataBean.setCodeName(codeName);
                }
                return (IBOBsStaticDataValue)bOBsStaticDataBean;
            }
            return null;
        }
        return null;
    }
}
