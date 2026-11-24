package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.omframe.util.SoServiceFactory;
import com.ai.pce.ivalues.IOfferValue;
import com.ai.pce.ivalues.IUpItemFeatureValue;
import com.ai.pce.service.interfaces.IProductFSV;
import com.asiainfo.crm.constant.BBossConst;
import com.asiainfo.crm.constant.RBossConst;
import com.asiainfo.crm.so.cloudpbx.service.interfaces.ICloudPbxSV;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.IProduct2CrmSV;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

@Slf4j
public class BbossSoBFImpl {
    public Map getOfferTypeByOfferId(long offerId){
        Map cp = new HashMap();
        String isO365="Y";
        String featureValue="";
        try{
            IOfferValue offerValue = SoServiceFactory.getCrmProductServce().getOfferByOfferId(offerId);
            if(null != offerValue && RBossConst.OFFER_PLAN_OTT.equals(offerValue.getOfferType())){
                cp.put("type", RBossConst.OFFER_PLAN_OTT);
            }
            if(null != offerValue && RBossConst.OFFER_VAS_OTT.equals(offerValue.getOfferType())){
                cp.put("type", RBossConst.OFFER_VAS_OTT);
            }
            IProduct2CrmSV product2CrmSV = (IProduct2CrmSV) ServiceFactory.getService(IProduct2CrmSV.class);
            IUpItemFeatureValue feature=product2CrmSV.getItemFeatureByProdAndFeatureIdAndValue(offerId,RBossConst.FEATURE_ID_OTT,"21");
            if(null!=feature&&null!=feature.getFeatureValue()&&(RBossConst.MDM_OTT_FEATURE_VALUE.equals(feature.getFeatureValue()))){
                isO365="N";
            }
            if(null!=feature&&null!=feature.getFeatureValue()){
                featureValue=feature.getFeatureValue();
            }
            cp.put("isO365", isO365);
            cp.put("featureValue", featureValue);
        }catch (Exception e)
        {
            log.error("error in getOfferTypeByOfferId",e);
        }
        return cp;
    }

    public Map isCompanyOffer(long offerId){
        Map cp = new HashMap();
        try{
            String retValue = BBossConst.SO_No;
            log.error("isCompanyOffer offerId="+offerId);
            ICloudPbxSV pbxSv = (ICloudPbxSV) ServiceFactory.getService(ICloudPbxSV.class);
            boolean isCompanyOffer = isCompany(offerId);
            if(isCompanyOffer) {
                retValue = BBossConst.SO_Yes;
            }
            cp.put("retValue", retValue);
        }catch (Exception e) {
            log.error("ERROR",e);
            cp.put("retValue", BBossConst.SO_No);
        }
        return cp;
    }

    public static boolean isCompany(long offerId) throws Exception {
        IProductFSV productFSV = (IProductFSV)ServiceFactory.getService(IProductFSV.class);
        IUpItemFeatureValue itemFeatureValue =  productFSV.getItemFeatureByProdAndFeatureId(offerId, RBossConst.CPBX_MULTIPLAN_BUSINESS_TYPE_FEATURE_ID);
        if(itemFeatureValue != null && StringUtils.equalsIgnoreCase(RBossConst.FEATURE_VALUE_COMPANY_OFFER, itemFeatureValue.getFeatureValue())) {
            return true;
        }
        return false;
    }
}
