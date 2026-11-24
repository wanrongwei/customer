package com.asiainfo.crm.cm.teaminvoke.out.service.support;

import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.DataStructInterface;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.common.util.TimeUtil;
import com.ai.omframe.common.service.interfaces.CenterConst;
import com.ai.omframe.instance.ivalues.IInsSrvAttrValue;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.omframe.order.ivalues.IOrdCustValue;
import com.ai.omframe.util.SoServiceFactory;
import com.ai.oneframe.inter.ivalues.B2BCustInfoBean;
import com.ai.oneframe.inter.ivalues.CustomerSearchCondBean;
import com.asiainfo.crm.agreement.agreement.ivalues.IBOAgrAgreementValue;
import com.asiainfo.crm.agreement.teaminvoke.out.service.interfaces.IAgreementFSV;
import com.asiainfo.crm.cm.dk.common.CmDkConstants;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmBillingAcctValue;
import com.asiainfo.crm.cm.inner.account.bo.BOCmCustAcctRelBean;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2InterFSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV;
import com.asiainfo.cs.base.tm.inter.common.service.interfaces.ITicketMgrRemoteSV;
import com.asiainfo.crm.inter.exe.webservice.client.imswrapservice.DoGetCaInvIndexResponse;
import com.asiainfo.crm.inter.exe.webservice.client.imswrapservice.IImsWrapQueryServiceFactory;
import com.asiainfo.crm.inter.exe.webservice.client.imswrapservice.RequestHead;
import com.asiainfo.crm.inter.exe.webservice.client.imswrapservice.SgetCaInvIndexReq;
import com.asiainfo.crm.res.phone.ivalues.IBOResPhoneNumUsedValue;
import com.asiainfo.crm.res.simcard.ivalues.IBOResSimCardUsedValue;
import com.asiainfo.crm.res.teaminvoke.out.service.interfaces.IRes2InterFSV;
import com.asiainfo.crm.so.common.RBossConst;
import com.asiainfo.crm.so.common.party.ivalues.IBOInsSrvAttrIdxValue;
import com.asiainfo.crm.so.common.party.service.interfaces.IInsSrvAttrIdxSV;
import com.asiainfo.crm.so.order.rboss.ivalues.IBOOrdUserHisInfoValue;
import com.asiainfo.crm.so.teaminvoke.in.service.interfaces.IRes2CrmSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmExtFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

/**
 * Extracted from {@code com.asiainfo.crm.inter.exe.remote.impl.CRM4OneframeRemoteFSVImpl} — B2B advance search only
 * ({@link #getCustomerCountOfB2BByCond}, {@link #queryCustomerOfB2BByCond}) so CM-core does not depend on UIP-interface.
 */
public final class Crm4B2BCustomerSearchDelegate {

    private static final Log LOG = LogFactory.getLog(Crm4B2BCustomerSearchDelegate.class);

    private Crm4B2BCustomerSearchDelegate() {
    }

    private static long parseManagerId(CustomerSearchCondBean bean) {
        try {
            Object v = bean.getAccountManager();
            if (v == null) {
                return 0L;
            }
            if (v instanceof Number) {
                return ((Number) v).longValue();
            }
            String s = String.valueOf(v).trim();
            return s.isEmpty() ? 0L : Long.parseLong(s);
        } catch (Exception e) {
            return 0L;
        }
    }

    private static long parseManagerGroupId(CustomerSearchCondBean bean) {
        try {
            Object v = bean.getCustMamaGroup();
            if (v == null) {
                return 0L;
            }
            if (v instanceof Number) {
                return ((Number) v).longValue();
            }
            String s = String.valueOf(v).trim();
            return s.isEmpty() ? 0L : Long.parseLong(s);
        } catch (Exception e) {
            return 0L;
        }
    }

    public static int getCustomerCountOfB2BByCond(CustomerSearchCondBean bean) throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
        long[] custIds = new long[]{};
        long addressId = 0;
        if (StringUtils.isNotBlank(bean.getKobNumber())) {
            ICm2InterFSV fsv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
            ICustomerValue[] values = fsv.queryGroupCustomersByCdns(null, null, bean.getKobNumber(), 0, null);
            if (values != null && values.length > 0) {
                custIds = new long[]{values[0].getCustId()};
            } else {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getContractNumber())) {
            IAgreementFSV fsv = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
            IBOAgrAgreementValue value = fsv.getAgreementValueByAgrCode(bean.getContractNumber());
            if (value != null) {
                custIds = new long[]{value.getOwnerId()};
            } else {
                return 0;
            }
        } else if (bean.getCustId() > 0) {
            custIds = new long[]{bean.getCustId()};
        } else if (bean.getAccountId() > 0) {
            ICm2InterFSV fsv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
            ICustomerValue customer = fsv.queryCustomerByAcctId(bean.getAccountId());
            if (null != customer) {
                custIds = new long[]{customer.getCustId()};
            } else {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getOldB2BAccountId())) {
            custIds = getCustIdArrayByOldAcct(bean.getOldB2BAccountId());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getCircuitB2BNumber())) {
            custIds = getCustIdArrayByCirCuit(bean.getCircuitB2BNumber());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getSubscriberNumber())) {
            custIds = getCustIdArrayByPhoneNumber(bean.getSubscriberNumber());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getEanNumber()) || StringUtils.isNotBlank(bean.getPBSNumber())) {
            custIds = getCustIdsForEANPBS(bean.getPBSNumber(), bean.getEanNumber());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getCpeNumber())) {
            custIds = getCustIdsForAttrValueNew(RBossConst.SO_SRV_ATTR_CPE_SN, bean.getCpeNumber());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getIpAddress())) {
            custIds = getCustIdsForAttrValue(String.valueOf(RBossConst.SO_SRV_ATTR_IP), bean.getIpAddress());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getImsiNumber())) {
            CenterUtil.generatorRegionId();
            IRes2CrmSV fsv = (IRes2CrmSV) ServiceFactory.getService(IRes2CrmSV.class);
            IBOResSimCardUsedValue value = fsv.getUsedSimCardInfoByImsi(bean.getImsiNumber(), null);
            if (null != value) {
                String billId = value.getBillId();
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
                ICrmFSV crmfsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                IInsUserValue insValue = crmfsv.getInsUser(0, billId);

                if (insValue != null) {
                    custIds = new long[]{insValue.getCustId()};
                } else {
                    return 0;
                }
            } else {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getIccId())) {
            IRes2InterFSV fsv = (IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
            IBOResSimCardUsedValue value = fsv.getUsedSimCardInfoByIccId(bean.getIccId(), null, null);
            if (null != value) {
                String billId = value.getBillId();
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
                ICrmFSV crmfsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                IInsUserValue insValue = crmfsv.getInsUser(0, billId);

                if (insValue != null) {
                    custIds = new long[]{insValue.getCustId()};
                } else {
                    return 0;
                }
            } else {
                return 0;
            }

        } else if (StringUtils.isNotBlank(bean.getEmailAddress())) {
            custIds = getCustIdsForEmailAddress(bean.getEmailAddress());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getOrderID())) {
            custIds = getCustIdsForOrderId(bean.getOrderID());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getTicketID())) {
            custIds = getCustIdsForTicketId(bean.getTicketID());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getInvoiceNumber())) {
            long custId = getCustIdForInvoiceNumber(bean.getInvoiceNumber());
            if (custId > 0) {
                custIds = new long[]{custId};
            } else {
                return 0;
            }
        } else if (StringUtils.isNotBlank(bean.getOpennetCustId())) {
            custIds = getCustIdsForAttrValue(String.valueOf(RBossConst.OpenNet.SO_SRV_ATTR_Opennet_subscriptionId),
                    bean.getOpennetCustId());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        } else if ("TDC_ADDRESS".equals(bean.getAddressType())) {
            CenterUtil.generatorRegionId();
            ICrmFSV fsv = (ICrmFSV) ServiceFactory.getCrossCenterService(ICrmFSV.class);
            IInsUserValue[] insValue = fsv.getInsUserByUserAddress(bean.getAddressId(), -1);
            if (insValue == null || insValue.length == 0) {
                return 0;
            }
            custIds = new long[insValue.length];
            for (int index = 0; index < insValue.length; index++) {
                custIds[index] = insValue[index].getCustId();
            }
        } else if ("BIL_ADDRESS".equals(bean.getAddressType())) {
            custIds = getCustIdsForBillingAddress(bean.getAddressId());
            if (null == custIds || custIds.length == 0) {
                return 0;
            }
        }

        if ("KOB_ADDRESS".equals(bean.getAddressType())) {
            addressId = bean.getAddressId();
        }

        long mgrId = parseManagerId(bean);
        long mgrGrp = parseManagerGroupId(bean);

        return sv.queryGroupCustomersCount(custIds, bean.getCustState(), bean.getCustStatus(), bean.getCvrNumber(),
                bean.getShortName(), bean.getCustomerName(), addressId, bean.getContactPhoneNumber(), mgrId, mgrGrp,
                bean.getSegment(), bean.getCategory(), bean.getOldCustId());
    }

    public static List<B2BCustInfoBean> queryCustomerOfB2BByCond(CustomerSearchCondBean bean, int start, int end)
            throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
        List<B2BCustInfoBean> list = new ArrayList<>();
        long[] custIds = new long[]{};
        long addressId = 0;
        long curCustId = 0L;
        if (StringUtils.isNotBlank(bean.getKobNumber())) {
            ICm2InterFSV fsv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
            ICustomerValue[] values = fsv.queryGroupCustomersByCdns(null, null, bean.getKobNumber(), 0, null);
            if (values != null && values.length > 0) {
                custIds = new long[]{values[0].getCustId()};
            } else {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getContractNumber())) {
            IAgreementFSV fsv = (IAgreementFSV) ServiceFactory.getService(IAgreementFSV.class);
            IBOAgrAgreementValue value = fsv.getAgreementValueByAgrCode(bean.getContractNumber());
            if (value != null) {
                custIds = new long[]{value.getOwnerId()};
            } else {
                return list;
            }
        } else if (bean.getCustId() > 0) {
            custIds = new long[]{bean.getCustId()};
        } else if (bean.getAccountId() > 0) {
            ICm2InterFSV fsv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
            ICustomerValue customer = fsv.queryCustomerByAcctId(bean.getAccountId());
            if (null != customer) {
                custIds = new long[]{customer.getCustId()};
            } else {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getOldB2BAccountId())) {
            custIds = getCustIdArrayByOldAcct(bean.getOldB2BAccountId());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getCircuitB2BNumber())) {
            custIds = getCustIdArrayByCirCuit(bean.getCircuitB2BNumber());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getSubscriberNumber())) {
            custIds = getCustIdArrayByPhoneNumber(bean.getSubscriberNumber());
            if (null == custIds || custIds.length == 0) {
                return list;
            } else {
                curCustId = custIds[custIds.length - 1];
            }
        } else if (StringUtils.isNotBlank(bean.getEanNumber()) || StringUtils.isNotBlank(bean.getPBSNumber())) {
            custIds = getCustIdsForEANPBS(bean.getPBSNumber(), bean.getEanNumber());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getCpeNumber())) {
            custIds = getCustIdsForAttrValueNew(RBossConst.SO_SRV_ATTR_CPE_SN, bean.getCpeNumber());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getIpAddress())) {
            custIds = getCustIdsForAttrValue(String.valueOf(RBossConst.SO_SRV_ATTR_IP), bean.getIpAddress());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getImsiNumber())) {
            CenterUtil.generatorRegionId();
            IRes2CrmSV fsv = (IRes2CrmSV) ServiceFactory.getService(IRes2CrmSV.class);
            IBOResSimCardUsedValue value = fsv.getUsedSimCardInfoByImsi(bean.getImsiNumber(), null);
            if (null != value) {
                String billId = value.getBillId();
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
                ICrmFSV crmfsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                IInsUserValue insValue = crmfsv.getInsUser(0, billId);

                if (insValue != null) {
                    custIds = new long[]{insValue.getCustId()};
                } else {
                    return list;
                }
            } else {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getIccId())) {
            IRes2InterFSV fsv = (IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
            IBOResSimCardUsedValue value = fsv.getUsedSimCardInfoByIccId(bean.getIccId(), null, null);
            if (null != value) {
                String billId = value.getBillId();
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
                ICrmFSV crmfsv = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
                IInsUserValue insValue = crmfsv.getInsUser(0, billId);

                if (insValue != null) {
                    custIds = new long[]{insValue.getCustId()};
                } else {
                    return list;
                }
            } else {
                return list;
            }

        } else if (StringUtils.isNotBlank(bean.getEmailAddress())) {
            custIds = getCustIdsForEmailAddress(bean.getEmailAddress());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getOrderID())) {
            custIds = getCustIdsForOrderId(bean.getOrderID());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getTicketID())) {
            custIds = getCustIdsForTicketId(bean.getTicketID());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getInvoiceNumber())) {
            long custId = getCustIdForInvoiceNumber(bean.getInvoiceNumber());
            if (custId > 0) {
                custIds = new long[]{custId};
            } else {
                return list;
            }
        } else if (StringUtils.isNotBlank(bean.getOpennetCustId())) {
            custIds = getCustIdsForAttrValue(String.valueOf(RBossConst.OpenNet.SO_SRV_ATTR_Opennet_subscriptionId),
                    bean.getOpennetCustId());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        } else if ("TDC_ADDRESS".equals(bean.getAddressType())) {
            CenterUtil.generatorRegionId();
            ICrmFSV fsv = (ICrmFSV) ServiceFactory.getCrossCenterService(ICrmFSV.class);
            IInsUserValue[] insValue = fsv.getInsUserByUserAddress(bean.getAddressId(), -1);
            if (insValue == null || insValue.length == 0) {
                return list;
            }
            custIds = new long[insValue.length];
            for (int index = 0; index < insValue.length; index++) {
                custIds[index] = insValue[index].getCustId();
            }
        } else if ("BIL_ADDRESS".equals(bean.getAddressType())) {
            custIds = getCustIdsForBillingAddress(bean.getAddressId());
            if (null == custIds || custIds.length == 0) {
                return list;
            }
        }

        if ("KOB_ADDRESS".equals(bean.getAddressType())) {
            addressId = bean.getAddressId();
        }

        long mgrId = parseManagerId(bean);
        long mgrGrp = parseManagerGroupId(bean);

        DataContainerInterface[] datas = sv.queryGroupCustomers(custIds, bean.getCustState(), bean.getCustStatus(),
                bean.getCvrNumber(), bean.getShortName(), bean.getCustomerName(), addressId, bean.getContactPhoneNumber(),
                mgrId, mgrGrp, bean.getSegment(), bean.getCategory(), bean.getOldCustId(), start, end);
        if (datas != null) {
            B2BCustInfoBean b2b;
            for (int index = 0; index < datas.length; index++) {
                b2b = new B2BCustInfoBean();
                if (curCustId != 0) {
                    if (datas[index].getAsLong("CUST_ID") == curCustId) {
                        b2b.setIsHistory("Y");
                    } else {
                        b2b.setIsHistory("N");
                    }
                }
                b2b.setCustId(datas[index].getAsString("CUST_ID"));
                b2b.setCompanyName(datas[index].getAsString("CUST_NAME"));
                b2b.setShortName(datas[index].getAsString("SHORT_NAME"));
                b2b.setDescription("");
                b2b.setCvrNumber(datas[index].getAsString("TAX_ID"));
                b2b.setKobNumber(datas[index].getAsString("CUST_CERT_CODE"));
                b2b.setSegment(datas[index].getAsString("SEGMENT_NAME"));
                b2b.setCategory(datas[index].getAsString("CUST_SERVICE_LEVEL"));
                b2b.setSubSegment(datas[index].getAsString("GROUP_SUB_TYPE"));
                b2b.setLegalPersonId(datas[index].getAsString("LEGAL_CUST_ID"));
                b2b.setWebSite(datas[index].getAsString("GROUP_WEB"));
                b2b.setStatus(datas[index].getAsString("CUST_STATUS"));
                b2b.setPhoneNo("");
                b2b.setAccountManager(datas[index].getAsString("MANAGER_ID"));
                b2b.setContactpoint(datas[index].getAsString("IS_CONTACT_POINT"));
                b2b.setMajorAccountNumber(datas[index].getAsString(""));
                b2b.setPassWord(datas[index].getAsString("CUST_PASSWORD"));
                b2b.setCustomerLegalAddress(datas[index].getAsString("ADDRESS_DETAIL"));
                b2b.setBiCompanyName(datas[index].getAsString("BI_COMPANY_NAME"));
                b2b.setLegalForm(datas[index].getAsString("LEGAL_FORM"));
                b2b.setRating(datas[index].getAsString("RATING_CODE"));
                b2b.setCompanyType(datas[index].getAsString("GROUP_TYPE"));
                b2b.setRegistrationDate(datas[index].getAsString("REGISTRATION_DATE"));
                b2b.setMktPermission(datas[index].getAsString("DIRECT_MARKETING_PROTECTION"));
                b2b.setAksStatus(datas[index].getAsString("AKS_STATUS"));
                b2b.setAksRegistrationDate(datas[index].getAsString("AKS_REGISTRATION_DATE"));
                b2b.setCreditClass(datas[index].getAsString("CREDIT_LEVEL"));
                b2b.setCreditMax(datas[index].getAsString("CREDIT_VALUE"));
                b2b.setEmployeeNumberRange(datas[index].getAsString("STAFF_AMOUNT_TYPE"));
                b2b.setEmployeeNumber(datas[index].getAsString("STAFF_AMOUNT"));
                b2b.setEmployeeHistorical(datas[index].getAsString("LAST_YEAR_EMPLOYEES"));
                b2b.setRemarks(datas[index].getAsString("REMARKS"));
                b2b.setRegionId(datas[index].getAsString("REGION_ID"));
                list.add(b2b);
            }
        }

        return list;
    }

    private static long[] getCustIdArrayByOldAcct(String acctNum) throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
        long custId = sv.queryCustIdByAcctServiceId(acctNum);
        if (custId > 0) {
            return new long[]{custId};
        }
        return null;
    }

    private static long[] getCustIdArrayByCirCuit(String cirCuitNum) throws Exception {
        CenterUtil.generatorRegionId();
        ICrmFSV sv = (ICrmFSV) ServiceFactory.getCrossCenterService(ICrmFSV.class);
        IInsUserValue user = sv.getDSLUserByCircuitNum(cirCuitNum, -1);
        if (user != null) {
            return new long[]{user.getCustId()};
        }
        return null;
    }

    private static long[] getCustIdArrayByPhoneNumber(String billId) throws Exception {
        long[] custIds = null;
        long curCustId = 0;
        String regionId = CenterUtil.getRegionIdByBillId(billId);
        ICrmExtFSV extSV = (ICrmExtFSV) ServiceFactory.getService(ICrmExtFSV.class);
        if (StringUtils.isNotBlank(regionId)) {
            CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, regionId);
            IInsUserValue user = SoServiceFactory.getInstanceQrySV().getInstUserByBillId(billId);
            if (null != user) {
                curCustId = user.getCustId();
            } else {
                IOrdCustValue ordCust = extSV.getOrderCustByBillId(billId);
                if (ordCust != null) {
                    curCustId = ordCust.getCustId();
                }
            }
        } else {
            IOrdCustValue ordCust = extSV.getOrderCustByBillId(billId);
            if (ordCust != null) {
                curCustId = ordCust.getCustId();
            } else {
                IRes2InterFSV resSv = (IRes2InterFSV) ServiceFactory.getService(IRes2InterFSV.class);
                IBOResPhoneNumUsedValue value = resSv.queryUsedNum("", billId);
                if (null != value) {
                    curCustId = Long.parseLong(value.getReceiver());
                }
            }
        }

        ICrmExtFSV crmExtSV = (ICrmExtFSV) ServiceFactory.getService(ICrmExtFSV.class);

        List phoneNums = crmExtSV.queryUserHisInfo("dslNumber", billId);
        List voipNums = crmExtSV.queryUserHisInfo("voipNo", billId);

        phoneNums.addAll(voipNums);

        if (!phoneNums.isEmpty() || curCustId != 0) {
            int length = phoneNums.size();
            custIds = new long[length + 1];
            for (int index = 0; index < length; index++) {
                IBOOrdUserHisInfoValue hisUser = (IBOOrdUserHisInfoValue) phoneNums.get(index);
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.USER_ID, String.valueOf(hisUser.getUserId()));
                IInsUserValue user = SoServiceFactory.getInstanceQrySV().getInstUserByUserId(hisUser.getUserId());
                custIds[index] = user == null ? 0 : user.getCustId();
            }
            custIds[length] = curCustId;
        }
        return custIds;
    }

    private static long[] getCustIdsForEANPBS(String pbs, String ean) throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
        IBOCmBillingAcctValue[] values = sv.queryBillingAcct(-1, pbs, ean);
        long[] custIds = null;
        if (values != null && values.length > 0) {
            long[] acctIds = new long[values.length];
            for (int i = 0; i < values.length; i++) {
                acctIds[i] = values[i].getAcctId();
            }

            ICm2SoSV sosv = (ICm2SoSV) ServiceFactory.getService(ICm2SoSV.class);
            IBOCmCustAcctRelValue[] custRels = sosv.queryCustAcctRelByCnd(-1, acctIds, null, -1, -1, -1, null, -1, -1);
            if (custRels != null && custRels.length > 0) {
                custIds = new long[custRels.length];
                for (int i = 0; i < custRels.length; i++) {
                    custIds[i] = custRels[i].getRelCustId();
                }
            }
        }

        return custIds;
    }

    private static long[] getCustIdsForAttrValueNew(long arrtId, String attrValue) throws Exception {
        IInsSrvAttrIdxSV sv = (IInsSrvAttrIdxSV) ServiceFactory.getService(IInsSrvAttrIdxSV.class);
        IBOInsSrvAttrIdxValue[] values = sv.getInsSrvAttrIdxByAttrIdAndAttrValue(String.valueOf(arrtId), attrValue);
        List<IInsUserValue> listUser = new ArrayList<>();
        if (null != values && values.length > 0) {
            for (IBOInsSrvAttrIdxValue idxVal : values) {
                CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.REGION_ID, String.valueOf(idxVal.getRegionId()));
                IInsUserValue user = SoServiceFactory.getInstanceQrySV().getInstUserByUserId(idxVal.getUserId());
                if (null != user) {
                    IInsSrvAttrValue[] insAttr = SoServiceFactory.getInstanceQrySV().getInstSrvAttrByConditions(
                            idxVal.getUserId(), arrtId, attrValue, idxVal.getOfferInstId(), -2, idxVal.getRegionId());
                    if (insAttr != null && insAttr.length > 0) {
                        user.setEffectiveDate(insAttr[0].getEffectiveDate());
                        listUser.add(user);
                    }
                }
            }
            if (!listUser.isEmpty()) {
                listUser.sort(new Comparator<IInsUserValue>() {
                    @Override
                    public int compare(IInsUserValue o1, IInsUserValue o2) {
                        return o2.getEffectiveDate().compareTo(o1.getEffectiveDate());
                    }
                });
            }
        }
        return getCustIdFromUserList(listUser);
    }

    private static long[] getCustIdFromUserList(List<IInsUserValue> listUser) {
        if (listUser == null || listUser.isEmpty()) {
            return null;
        }
        List<Long> distinctList = new ArrayList<>();
        for (IInsUserValue u : listUser) {
            long cid = u.getCustId();
            if (!distinctList.contains(cid)) {
                distinctList.add(cid);
            }
        }
        long[] arr = new long[distinctList.size()];
        for (int i = 0; i < distinctList.size(); i++) {
            arr[i] = distinctList.get(i);
        }
        return arr;
    }

    private static long[] getCustIdsForAttrValue(String arrtId, String attrValue) throws Exception {
        IInsSrvAttrIdxSV sv = (IInsSrvAttrIdxSV) ServiceFactory.getService(IInsSrvAttrIdxSV.class);
        IBOInsSrvAttrIdxValue[] values = sv.getInsSrvAttrIdxByAttrIdAndAttrValue(arrtId, attrValue);
        if (null != values && values.length > 0) {
            CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.USER_ID, String.valueOf(values[0].getUserId()));
            IInsUserValue user = SoServiceFactory.getInstanceQrySV().getInstUserByUserId(values[0].getUserId());
            if (null != user) {
                return new long[]{user.getCustId()};
            }
        }
        return null;
    }

    private static long[] getCustIdsForEmailAddress(String email) throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);

        return sv.queryCustomerByMedium(email, CmDkConstants.CustContMedium.EMAIL);
    }

    private static long[] getCustIdsForTicketId(String ticketId) throws Exception {
        ITicketMgrRemoteSV sv = (ITicketMgrRemoteSV) ServiceFactory.getService(ITicketMgrRemoteSV.class);
        String custId = sv.queryCustIdByTicketNo(ServiceManager.getUser().getTenantId(), ticketId);
        if (StringUtils.isNumeric(custId)) {
            return new long[]{Long.parseLong(custId)};
        }
        return null;
    }

    private static long[] getCustIdsForOrderId(String orderId) throws Exception {
        try {
            long[] custIds = null;
            long oid = Long.parseLong(orderId.trim());
            IOrdCustValue ordCustValue = SoServiceFactory.getOrderQrySrv().getOrdCustByCustOrderId(oid);
            if (null != ordCustValue) {
                custIds = new long[]{ordCustValue.getCustId()};
            } else {
                Calendar cal = Calendar.getInstance();
                String regionId = orderId.substring(1, 5);
                CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
                ordCustValue = SoServiceFactory.getOrderQrySrv().getFinishOrdCustByCustOrderId(oid, cal.getTime());
                if (null != ordCustValue) {
                    custIds = new long[]{ordCustValue.getCustId()};
                } else {
                    cal.add(Calendar.MONTH, -1);
                    ordCustValue = SoServiceFactory.getOrderQrySrv().getFinishOrdCustByCustOrderId(oid, cal.getTime());
                    if (null != ordCustValue) {
                        custIds = new long[]{ordCustValue.getCustId()};
                    } else {
                        cal.add(Calendar.MONTH, -1);
                        ordCustValue = SoServiceFactory.getOrderQrySrv().getFinishOrdCustByCustOrderId(oid, cal.getTime());
                        if (null != ordCustValue) {
                            custIds = new long[]{ordCustValue.getCustId()};
                        }
                    }
                }
            }
            return custIds;
        } catch (NumberFormatException | StringIndexOutOfBoundsException e) {
            if (LOG.isDebugEnabled()) {
                LOG.debug("getCustIdsForOrderId: invalid orderId=" + orderId, e);
            }
            return null;
        }
    }

    private static long getCustIdForInvoiceNumber(String invoiceNumber) throws Exception {
        RequestHead requestHead = new RequestHead();
        String appKey = "8000000001";
        String date8 = new SimpleDateFormat("yyyyMMdd").format(new Date());
        long tenDigits = java.util.concurrent.ThreadLocalRandom.current().nextLong(1_000_000_000L, 10_000_000_000L);
        String date10 = String.format("%010d", tenDigits);
        String transactionID = appKey + date8 + date10;
        requestHead.setAppKey(appKey);
        requestHead.setTransactionID(transactionID);
        requestHead.setReqTime(TimeUtil.getDDMMYYYYHHMMSS(new Timestamp(new Date().getTime())));
        requestHead.setAcceptChannelCode("01");
        requestHead.setTenantId(ServiceManager.getUser().getTenantId());
        requestHead.setChargeFlag("0");
        requestHead.setNotifyFlag("0");
        requestHead.setBusiCode("1081");
        requestHead.setAcceptOpId(String.valueOf(ServiceManager.getUser().getID()));

        SgetCaInvIndexReq req = new SgetCaInvIndexReq();
        req.setInvoiceNo(invoiceNumber);
        DoGetCaInvIndexResponse resp = IImsWrapQueryServiceFactory.getService().getIImsWrapQueryService()
                .doGetCaInvIndex(requestHead, req);
        long custId = 0;
        if (null != resp && resp.getScaInvIndex() != null) {
            long acctId = resp.getScaInvIndex().getAcctId();
            ICm2InterFSV fsv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
            ICustomerValue value = fsv.queryCustomerByAcctId(acctId);
            if (null != value) {
                custId = value.getCustId();
            }
        }

        return custId;
    }

    private static long[] getCustIdsForBillingAddress(long addressId) throws Exception {
        ICm2InterFSV sv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
        IBOCmBillingAcctValue[] values = sv.queryBillingAcct(String.valueOf(addressId));
        long[] custIds = null;
        if (values != null && values.length > 0) {
            long[] acctIds = new long[values.length];
            for (int i = 0; i < values.length; i++) {
                acctIds[i] = values[i].getAcctId();
            }

            ICm2SoSV sosv = (ICm2SoSV) ServiceFactory.getService(ICm2SoSV.class);
            IBOCmCustAcctRelValue[] custRels = sosv.queryCustAcctRelByCnd(-1, acctIds, null, -1, -1, -1, null, -1, -1);
            if (custRels != null && custRels.length > 0) {
                custIds = new long[custRels.length];
                for (int i = 0; i < custRels.length; i++) {
                    custIds[i] = custRels[i].getRelCustId();
                }
            }
        }

        return custIds;
    }
}
