package com.asiainfo.crm.cm.teaminvoke.in.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.service.ServiceFactory;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrAgreementHValue;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrOfferRlaHValue;
import com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.IContract2CmSV;

import java.sql.Timestamp;


public class Contract2CmSVImpl implements IContract2CmSV {
    private static IAgreementFSV getAgreementFSV() {
        return (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
    }

    @Override
    public byte[] previewEshopAgreement(String businessId, DataContainer[] agreementParams) throws Exception {
        return getAgreementFSV().previewEshopAgreement(businessId, agreementParams);
    }

    @Override
    public DataContainer[] getOfferDiscountByAgrId(long agreementId, String agrDate, String ownerId) throws Exception {
        return getAgreementFSV().getOfferDiscountByAgrId(agreementId, agrDate, ownerId);
    }

    @Override
    public DataContainer[] getAgreementOfferDiscount(String agrCode) throws Exception {
        return  getAgreementFSV().getAgreementOfferDiscount(agrCode);
    }

    @Override
    public IBOAgrAgreementHValue getAgreementValueByCust(long custId, long agreementId) throws Exception {
        return getAgreementFSV().getAgreementValueByCust(custId, agreementId);
    }

    @Override
    public DataContainer queryAgreementBillCycle(long agreementId, String agreementCode, long custId) throws Exception {
        return getAgreementFSV().queryAgreementBillCycle(agreementId, agreementCode, custId);
    }

    @Override
    public DataContainer queryCurrentAgreementBillCycle(long agreementId, String agreementCode, long custId) throws Exception {
        return getAgreementFSV().queryCurrentAgreementBillCycle(agreementId, agreementCode, custId);
    }

    @Override
    public IBOAgrOfferRlaHValue[] getOfferBargainParamsByGroupId(long custId, long agreementId, long offerId, String groupId) throws Exception {
        return getAgreementFSV().getOfferBargainParamsByGroupId(custId, agreementId, offerId, groupId);
    }

    @Override
    public int getLicenseStaircaseFlag(long agreementId, long offerId) throws Exception {
        return getAgreementFSV().getLicenseStaircaseFlag(agreementId, offerId);
    }

    @Override
    public DataContainer[] getB2BAgreementListForOSByCond(long custId, String agrName, String agrCode, long agrStatus, Timestamp startDate, Timestamp endDate) throws Exception {
        return getAgreementFSV().getB2BAgreementListForOSByCond(custId, agrName, agrCode, agrStatus, startDate, endDate);
    }
}
