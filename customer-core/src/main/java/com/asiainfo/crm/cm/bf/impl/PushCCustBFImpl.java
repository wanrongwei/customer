package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.util.CenterUtil;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.omframe.util.SoServiceFactory;
import com.aie.common.CrmException;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2CsSV;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.ICust2CrmSV;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class PushCCustBFImpl {


    public Map queryCustomer(String queryType, String queryValue) {
        Map custProp = new HashMap<>();
        ICustomerValue cust = null;

        try {
            if ("1".equals(queryType)) {
                cust = getCustInfoByBillId(queryValue);
            } else if ("0".equals(queryType)) {
                ICm2CsSV sv = (ICm2CsSV) ServiceFactory.getService(ICm2CsSV.class);
                cust = sv.queryCustByEmail(queryValue);
            }

            if (cust != null) {
                custProp.put("rsltVal", "Y");
                custProp.put("customerId", cust.getCustId());
                custProp.put("customerName", cust.getCustName());
            } else {
                custProp.put("rsltVal", "N");
                custProp.put("rsltMsg", "No Data!");
            }
        } catch (Exception var8) {
            custProp.put("rsltVal", "N");
            custProp.put("rsltMsg", var8.getMessage());
        }
        return custProp;
    }


    public ICustomerValue getCustInfoByBillId(String phoneNumber) throws Exception {
        try {
            CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, phoneNumber);
        } catch (Exception e) {
            log.error("setCenterInfoByTypeAndValue",e);
            throw new CrmException(CrmLocaleFactory.getResource("SOS3031774",phoneNumber));
        }
        IInsUserValue user = SoServiceFactory.getInstanceQrySV().getInstUserByBillId(phoneNumber);
        if (user != null) {
            ICust2CrmSV custSV = (ICust2CrmSV) ServiceFactory.getService(ICust2CrmSV.class);
            ICustomerValue customerValue = custSV.queryCustInfoById(user.getCustId());
            return customerValue;
        }
        return null;
    }


}
