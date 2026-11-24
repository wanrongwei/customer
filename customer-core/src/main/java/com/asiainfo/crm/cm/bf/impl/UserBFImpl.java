package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;

import com.ai.common.util.CenterUtil;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartySV;
import com.asiainfo.crm.cm.vo.InsUserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class UserBFImpl {
    public Map<String, Object> getCustId(String partyId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        cp.put("custId", "");
        try {
            ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            long custId = partySV.queryCustIdForUser(Long.parseLong(partyId));
            if (custId > 0) {
                cp.put("custId", String.valueOf(custId));
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("getCustId exception.", e);
            }

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public Map<String, Object> saveInsUser(InsUserVO insUserVO) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        cp.put("retFlag", "");
        try {
            String[] insValues = insUserVO.getUserInfos();
            String regionId = "";
            if(insValues.length > 0){
                for (int i = 0; i < insValues.length; i++) {
                    regionId = insValues[i].split(",")[2];
                }
            }
            if(StringUtils.isNotEmpty(regionId)){
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, regionId);
            }
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            service.dealAssignNum(insUserVO.getCustId(), insValues, insUserVO.getOwnerCustId());
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            log.info(e.getMessage(), e);

            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }
}
