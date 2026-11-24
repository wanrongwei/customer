package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.CustomProperty;
import com.ai.appframe2.web.DataContainerList;
import com.ai.appframe2.web.HttpUtil;
import com.ai.bce.ivalues.IBceDealReturnData;
import com.ai.bce.valuebean.BceDataBean;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmPartyValue;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.dk.bo.BOCmBillFormatDtlBean;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmBillFormatDtlValue;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmCustContMediumAndTypeValue;
import com.asiainfo.crm.cm.support.bce.service.interfaces.ICmAccountBceDealSV;
import com.asiainfo.crm.cm.vo.CmAccountInfoVo;
import com.asiainfo.crm.util.BceUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class BillBFImpl {
    public Map delBillFormatDtl(long acctId,long dtlNo,int billingType) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            ICmBillingAcctSV acctSV = (ICmBillingAcctSV) ServiceFactory.getService(ICmBillingAcctSV.class);
            IBOCmBillFormatDtlValue billFormatDtlValue = new BOCmBillFormatDtlBean();
            billFormatDtlValue.setAcctId(acctId);
            billFormatDtlValue.setDtlNo(dtlNo);
            billFormatDtlValue.setBillingType(billingType);
            billFormatDtlValue.delete();
            acctSV.saveBillFormatDtl(billFormatDtlValue);
            retMsg = CrmLocaleFactory.getResource("CMS8000047");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("",e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map saveBillFormatDtl(Map bean) throws Exception {
        Object oldData = bean.get("oldData");
        DataContainer ds = DataContainerUtils.wrap1((Map) bean.get("data"));
        if(oldData!=null&& oldData instanceof Map && !((Map) oldData).isEmpty()){
            DataContainer oldDc = DataContainerUtils.wrap1((Map) oldData);
            oldDc.setStsToOld();
            ds=DataContainerUtils.setFontMap(oldDc,ds);
        }
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (bean == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                ICmBillingAcctSV billingAcctSV = (ICmBillingAcctSV) ServiceFactory.getService(ICmBillingAcctSV.class);
                IBOCmBillFormatDtlValue billFormatDtlValue = new BOCmBillFormatDtlBean();
                billFormatDtlValue.copy(ds);
                billingAcctSV.saveBillFormatDtl(billFormatDtlValue);
                // 操作成功!
                retMsg = CrmLocaleFactory.getResource("CMS8000047");
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("",e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }
//已经在AccountBF中有相同的
//    public IBceDealReturnData dealAccount(CmAccountInfoVo voAccountValue, Long bceFrameId, String businessId) throws Exception{
//        BceDataBean accountNew = new BceDataBean();
//        accountNew.addUserData(BceUtil.BUSIOPER_ID_KEY,businessId);
//        DataContainer frmBillCycle = new DataContainer();
//
//        frmBillCycle.set("CYCLE_TYPE",voAccountValue.getFrmBillCycle().getCycleType());
//        frmBillCycle.set("BILL_DAY",voAccountValue.getFrmBillCycle().getBillDay());
//
//        DataContainer frmAccount = new DataContainer();
//        frmAccount.set("URGE_STOP_FLAG",voAccountValue.getFrmAccount().getUrgeStopFlag());
//        frmAccount.set("PAY_METHOD",voAccountValue.getFrmAccount().getPayMethod());
//        frmAccount.set("INSTALLMENT_FLAG",voAccountValue.getFrmAccount().getInstallmentFlag());
//        frmAccount.set("CUST_ID",voAccountValue.getFrmAccount().getCustId());
//        frmAccount.set("ACCT_BEHALF_PHONE",voAccountValue.getFrmAccount().getAcctBehalfPhone());
//        frmAccount.set("CUST_NAME",voAccountValue.getFrmAccount().getCustName());
//        frmAccount.set("FIRST_NAME",voAccountValue.getFrmAccount().getFirstName());
//        frmAccount.set("LAST_NAME",voAccountValue.getFrmAccount().getLastName());
//        frmAccount.set("CUST_CRED_CODE",voAccountValue.getFrmAccount().getCustCredCode());
//        frmAccount.set("TAX_ID",voAccountValue.getFrmAccount().getTaxId());
//        frmAccount.set("ACCT_TYPE",voAccountValue.getFrmAccount().getAcctType());
//        frmAccount.set("ACCT_NAME",voAccountValue.getFrmAccount().getAcctName());
//        frmAccount.set("PAYMENT_ACCOUNT_NAME",voAccountValue.getFrmAccount().getPaymentAccountName());
//        frmAccount.set("BANK_CONTRACT",voAccountValue.getFrmAccount().getBankContract());
//        frmAccount.set("ACCT_STATUS",voAccountValue.getFrmAccount().getAcctStatus());
//        frmAccount.set("REGION_ID",voAccountValue.getFrmAccount().getRegionId());
//        frmAccount.set("EFFECTIVE_DATE",voAccountValue.getFrmAccount().getEffectiveDate());
//        frmAccount.set("EXPIRE_DATE",voAccountValue.getFrmAccount().getExpireDate());
//
//        DataContainer[] dcs0= new DataContainer[]{frmAccount};
//        DataContainer[] dcs1= new DataContainer[]{frmBillCycle};
//        accountNew.addNormalRowsetInfo("frmAccount",dcs0);
//        accountNew.addNormalRowsetInfo("frmBillCycle",dcs1);
//
//        ICmAccountBceDealSV service = (ICmAccountBceDealSV) ServiceFactory.getService(ICmAccountBceDealSV.class);
//        // 业务处理
//        return service.deal(accountNew, bceFrameId);
//    }

    public Map getBillingAddress(long acctId,long custId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        String addressId = "";
        String addressDetail = "";
        String partyName = "";
        String contNumber = "";
        String email = "";
        try {
            ICmDkCustomerSV dkCustomerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
            Map result = dkCustomerSV.queryBillingAddress(custId, acctId);
            if (result != null) {
                partyName = result.get(IQBOCmPartyValue.S_PartyName) == null ? "" : result.get(IQBOCmPartyValue.S_PartyName).toString();
                addressDetail = result.get(IQBOCmCustContMediumAndTypeValue.S_AddressDetail) == null ? "" : result.get(IQBOCmCustContMediumAndTypeValue.S_AddressDetail).toString();
                addressId = result.get(IQBOCmCustContMediumAndTypeValue.S_AddressId) == null ? "" : result.get(IQBOCmCustContMediumAndTypeValue.S_AddressId).toString();
                contNumber = result.get(IQBOCmCustContMediumAndTypeValue.S_ContNumber) == null ? "" : result.get(IQBOCmCustContMediumAndTypeValue.S_ContNumber).toString();
                email = result.get(IQBOCmCustContMediumAndTypeValue.S_EmailAddress) == null ? "" : result.get(IQBOCmCustContMediumAndTypeValue.S_EmailAddress).toString();
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("",e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("addressId", addressId);
            cp.put("addressDetail", addressDetail);
            cp.put("partyName", partyName);
            cp.put("contNumber", contNumber);
            cp.put("email", email);
        }
        return cp;
    }

    public List<Map> queryBillFormatEnum(int custType, int  billingType, int paymentMethod, int mailCode, int  isPrimary, long acctId) throws Exception {
        List<Map> cp = new ArrayList<Map>();
        try {
            ICmBillingAcctSV acctSV = (ICmBillingAcctSV) ServiceFactory.getService(ICmBillingAcctSV.class);
            IBOBsStaticDataValue[] result = acctSV.queryBillFormatEnum(custType, billingType, paymentMethod, mailCode, isPrimary, acctId);
            if (result != null) {
                for(IBOBsStaticDataValue value:result){
                    cp.add(value.getProperties());
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("",e);
            }
        }
        return cp;
    }
}
