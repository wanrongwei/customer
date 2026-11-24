package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.bo.DataContainerFactory;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.DataType;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.DataContainerList;
import com.ai.bce.ivalues.IBceDealReturnData;
import com.ai.bce.valuebean.BceDataBean;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.ExceptionUtil;
import com.ai.common.util.StaticDataUtil;
import com.asiainfo.appframe.ext.exeframe.msg.common.DateTimeUtil;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.bo.QBOCmPartyBean;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmPartyValue;
import com.asiainfo.crm.cm.common.service.interfaces.IAddressSV;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.custgroup.teaminvoke.out.service.interfaces.ICustGroupOutSV;
import com.asiainfo.crm.cm.customer.indiv.ivalues.IQBOCmCustomerContactValue;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmCustContactMediumBean;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmCustSegmentRelaBean;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmIndivContactBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.*;
import com.asiainfo.crm.cm.inner.customer.service.interfaces.ICmCustSegmentRelaSV;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyValue;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;
import com.asiainfo.crm.cm.ln.common.util.CmLnConstants;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bo.CustomerBean;
import com.asiainfo.crm.cm.model.ivalues.IContactValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.service.interfaces.*;
import com.asiainfo.crm.cm.support.bce.service.interfaces.ICmIndivCustomerBceDealSV;
import com.asiainfo.crm.cm.support.bce.util.CmBceSupportConstants;
import com.asiainfo.crm.util.BceUtil;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.*;

@Slf4j
@Component
public class CustInvdivBFImpl {
    public Map<String,String> getRequestStatusAndEditWord(long custId, long partyId) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        try {
            ICmCustRequestTaskSV taskSV = (ICmCustRequestTaskSV) ServiceFactory.getService(ICmCustRequestTaskSV.class);
            IBOCmCustRequestTaskValue[] values = taskSV.queryByCustId(custId);
            String canEditFlag = "true";
            if (null != values && values.length > 0) {
                String result = values[0].getResults();
                String requestStatus = values[0].getRequestStatus();
                if (CmConstants.RequestStatus.processing.equals(requestStatus)) {
                    // REQUEST_STATUS=P:处理中 ，这种情况也不能修改
                    canEditFlag = "false";
                } else if (CmConstants.RequestStatus.dealDone.equals(requestStatus)) {
                    // 如果已经生成订购关系则不可编辑
                    if ("000".equals(result)) {
                        canEditFlag = "false";
                    }
                }
            }
            cp.put("canEditFlag", canEditFlag);
            String unEditWordCMX = "";
            String unEditWordCM = "";
            String unEditWordCMAddr = "";
            // 针对user的权限控制
            String unEditWordForUser = "";
            cp.put("unEditWordForUser", unEditWordForUser);
            cp.put("unEditWordCM", unEditWordCM);
            cp.put("unEditWordCMX", unEditWordCMX);
            cp.put("unEditWordCMAddr", unEditWordCMAddr);
            ICmPartyRoleSV roleSV = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
            if (roleSV.IsPartyRoleUnique(partyId, CmConstants.roleType.user)) {
                // 获取user的不可编辑字段
                IBOBsStaticDataValue[] staticDataValues = StaticDataUtil.getStaticData(CmConstants.CmStaticDataCodeType.CM_UNEDIT_CODE_FOR_USER);
                if (CmCommonUtil.isNotEmptyObject(staticDataValues)) {
                    StringBuilder unEditStr = new StringBuilder();
                    for (IBOBsStaticDataValue value : staticDataValues) {
                        unEditStr.append(value.getCodeValue()).append(",");
                    }
                    unEditWordForUser = unEditStr.toString();
                    cp.put("unEditWordForUser", unEditWordForUser);
                }
            } else {
                // 获取页面不可编辑字段
                IBOBsStaticDataValue[] staticDataValues = StaticDataUtil.getStaticData(CmConstants.CmStaticDataCodeType.CM_UNEDIT_CODE);
                if (null != staticDataValues && staticDataValues.length > 0) {
                    StringBuilder sbcm = new StringBuilder();
                    StringBuilder sbcmx = new StringBuilder();
                    StringBuilder sbAddr = new StringBuilder();
                    for (IBOBsStaticDataValue staticDataValue : staticDataValues) {
                        if ("CM".equals(staticDataValue.getCodeName())) {
                            sbcm.append(staticDataValue.getCodeValue()).append(",");
                        } else if ("CMX".equals(staticDataValue.getCodeName())) {
                            sbcmx.append(staticDataValue.getCodeValue()).append(",");
                        } else if ("CM_ADDR".equals(staticDataValue.getCodeName())) {
                            sbAddr.append(staticDataValue.getCodeValue()).append(",");
                        }
                    }
                    unEditWordCM = sbcm.toString();
                    unEditWordCMX = sbcmx.toString();
                    unEditWordCMAddr = sbAddr.toString();
                    cp.put("unEditWordCM", unEditWordCM);
                    cp.put("unEditWordCMX", unEditWordCMX);
                    cp.put("unEditWordCMAddr", unEditWordCMAddr);
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("getRequestStatusAndEditWord exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }
    public Map<String,String> saveIndivCustomer(Map custInfo,String action) throws Exception {
        Map<String, String> cp = new HashMap<>();
        String retVal = "Y";
        String successMsg = "";
        String custId = "";
        String partyId = "";
        String custType = "";
        try {
            Map newCustInfo= (Map) custInfo.get("newData");
            Map oldCustInfo= (Map) custInfo.get("oldData");
            DataContainer newCustdc = DataContainerUtils.wrap1((Map) newCustInfo.get("baseInfo"));
            DataContainer newAddInfodc = DataContainerUtils.wrap1((Map) newCustInfo.get("addInfo"));
            DataContainer[] indivCustomerDC = null;
            DataContainer[] addInfoList =null;
            if(oldCustInfo!=null&& !oldCustInfo.isEmpty()){
            DataContainer oldCustdc = DataContainerUtils.wrap1((Map) oldCustInfo.get("baseInfo"));
            oldCustdc.setStsToOld();
            DataContainer oldAddInfodc = DataContainerUtils.wrap1((Map) newCustInfo.get("addInfo"));
            oldAddInfodc.setStsToOld();
            DataContainerUtils.setFontMap(oldCustdc,newCustdc);
            DataContainerUtils.setFontMap(oldAddInfodc,newAddInfodc);
                indivCustomerDC= new DataContainer[]{oldCustdc};
                addInfoList = new DataContainer[]{oldAddInfodc};
            } else {
                indivCustomerDC= new DataContainer[]{newCustdc};
                addInfoList = new DataContainer[]{newAddInfodc};
            }


            DataContainerList indivMemberDCList = new DataContainerList(new String[]{},new DataContainer[] { indivCustomerDC[0] });
            DataContainerList addInfoDCList = new DataContainerList(new String[]{},new DataContainer[] { addInfoList[0] });

            DataContainerList[] dcLists;
            dcLists = new DataContainerList[2];
            dcLists[0] =  indivMemberDCList;
            dcLists[1] =  addInfoDCList;


            // 判断有没取到dcs
            if (dcLists == null || dcLists.length < 1) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                successMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                DataContainerInterface[] custValues = null;
                custValues = dcLists[0].getAllDataContainerInterface();
                IVOCustValue custValue = new VOCustBean();
                if (CmCommonUtil.isNotEmptyObject(custValues)) {
                    //针对effective_date做特殊处理
                    //测试发现多次修改并未改这个值，先注释掉
//                    if (null != custValues[0].get("EFFECTIVE_DATE")) {
//                        custValues[0].set("EFFECTIVE_DATE", dcLists[0].getColDataContainerInterface(0)[0].get("EFFECTIVE_DATE"));
//                    }
                    ICustomerValue customerValue = new CustomerBean();
                    customerValue.copy(custValues[0]);
                    // 对于first_name和last_name的判断
                    if (!StringUtils.isNotBlank(customerValue.getFirstName())) {
                        customerValue.setFirstName("$$$$");
                    }
                    if (!StringUtils.isNotBlank(customerValue.getLastName())) {
                        customerValue.setLastName(String.valueOf(customerValue.getCustId()));
                    }
                    if (StringUtils.equalsIgnoreCase("add",action)) {
                        // 新增
                        if (String.valueOf(CmConstants.EntityType.USER).equals(customerValue.getIndivCustType())) {
                            // 针对使用者
                            custValue.setBusinessId(CmConstants.BusiLogId.USER_ADD);
                        } else {
                            // 针对客户
                            custValue.setBusinessId(CmConstants.BusiLogId.INDIV_CUST_ADD);
                        }
                        customerValue.setStsToNew();
                    } else if (StringUtils.equalsIgnoreCase("mod",action)) {
                        // 修改
                        if (String.valueOf(CmConstants.EntityType.USER).equals(customerValue.getIndivCustType())) {
                            // 针对使用者
                            custValue.setBusinessId(CmConstants.BusiLogId.USER_MODIFY);
                        }
                        if (customerValue.getIsVip() == 1) {
                            customerValue.setAnonymousFlag(CmConstants.YesOrNo.NO);
                        }
                    }else{
                        customerValue.delete();
                    }
                    custValue.setCustomer(customerValue);
                }
                if (dcLists.length > 1) {
                    DataContainerInterface[] addtionInfo = dcLists[1].getAllDataContainerInterface();
                    if (CmCommonUtil.isNotEmptyObject(addtionInfo)) {
                        if (StringUtils.isBlank(addtionInfo[0].getAsString("CUST_ID"))) {
                            addtionInfo[0].set("CUST_ID", custValue.getCustomer().getCustId());
                        }
                        if (StringUtils.equalsIgnoreCase("add",action)) {
                            addtionInfo[0].set("REGION_ID", CmCommonUtil.getDefaultRegionId());
                            addtionInfo[0].setStsToNew();
                        }
                        custValue.setUserObject(CmBceSupportConstants.CmDefaultCodeValue.codeValueCmxIndivCustomer, addtionInfo[0]);
                        if (StringUtils.equalsIgnoreCase("mod",action)) {
                            if (null != custValue.getUserObject(CmLnConstants.DealCustInfo.OP_STATE)) {
                                custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_MODIFY);
                            }
                        }
                    }
                }
                // 处理客户细分
                if (custValues[0].getAsString("CUST_SEGMENT") != null) {
                    // 先查询是否存在细分
                    ICmCustSegmentRelaSV segmentSV = (ICmCustSegmentRelaSV) ServiceFactory.getService(ICmCustSegmentRelaSV.class);
                    if (CmCommonUtil.isEmptyObject(segmentSV.querySegmentRelaByCustId(custValues[0].getAsLong("CUST_ID")))) {
                        IBOCmCustSegmentRelaValue value = new BOCmCustSegmentRelaBean();
                        value.setCustId(custValues[0].getAsLong("CUST_ID"));
                        value.setSegmentId(custValues[0].getAsLong("CUST_SEGMENT"));
                        custValue.setUserObject("cmSegmentRela", value);
                    }
                }
                custId = String.valueOf(CmServiceFactory.getCustomerSV().saveCustomer(custValue));
                //若遇到party合并在测试环境三层架构下，返回的依旧是新增的partyId
                ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                IBOCmIndivCustomerValue indValue = service.queryIndivCustomerInfo(Long.parseLong(custId));
                partyId = String.valueOf(indValue.getPartyId());
                custType = String.valueOf(custValue.getCustomer().getCustType());
                //保存记录
                ICmCommonSV commonSV = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
                String methodDetail = Thread.currentThread().getStackTrace()[1].getClassName() + " " + Thread.currentThread().getStackTrace()[1].getMethodName();
                if (StringUtils.equalsIgnoreCase("add",action)) {
                    successMsg = CrmLocaleFactory.getResource("CMS0013001", custId);
                    commonSV.saveBusiLog(CmConstants.BusiLogId.INDIV_CUST_ADD, CmConstants.BusiLogType.CUSTOMER_LOG, Long.parseLong(custId), CmConstants.BusiLogOperType.ADD, "", new HashMap(), methodDetail);
                } else if (StringUtils.equalsIgnoreCase("mod",action)) {
                    successMsg = CrmLocaleFactory.getResource("CMS0013002", custId);
                    commonSV.saveBusiLog(CmConstants.BusiLogId.INDIV_CUST_MODIFY, CmConstants.BusiLogType.CUSTOMER_LOG, Long.parseLong(custId), CmConstants.BusiLogOperType.MODIFY, "", new HashMap(), methodDetail);
                } else if (StringUtils.equalsIgnoreCase("del",action)) {
                    successMsg = CrmLocaleFactory.getResource("CMS0013003", custId);
                    commonSV.saveBusiLog(CmConstants.BusiLogId.INDIV_CUST_DELETE, CmConstants.BusiLogType.CUSTOMER_LOG, Long.parseLong(custId), CmConstants.BusiLogOperType.DELETE, "", new HashMap(), methodDetail);
                }
            }
        } catch (Exception e) {
            retVal = "N";
            // 客户修改失败
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013002"), e);
            }
            successMsg = e.getMessage();
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", successMsg);
        cp.put("custId", custId);
        cp.put("partyId", partyId);
        cp.put("custType", custType);
        return cp;
    }

    public Map<String,String> deleteIndivCustomer(long custId) throws Exception {
        Map<String, String> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 删除客户信息
            ICmCustomerSV customerSV = CmServiceFactory.getCustomerSV();
            customerSV.deleteIndivCust(custId);

            // 如果客户在群组中, 则出群、解散群、转让群
            ICustGroupOutSV groupOutSV = (ICustGroupOutSV) ServiceFactory.getService(ICustGroupOutSV.class);
            groupOutSV.groupMemberTerminate(custId);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("deleteIndivCustomer exception.", e);
            }

            retVal = "N";
            retMsg = e.getMessage();
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }

    public Map<String,String> queryCustContacts(long custId) throws Exception {
        Map<String, String> cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            // 设置客户监护人信息
            ICmContactSV contactSV = (ICmContactSV) ServiceFactory.getService(ICmContactSV.class);
            DataContainer conditionDC = new DataContainer();
            conditionDC.set(IContactValue.S_CustId, custId);
            IContactValue[] contactValues = contactSV.queryCustContacts(conditionDC, -1, -1);
            if (contactValues != null && contactValues.length > 0 && contactValues[0].getContExpireDate()!=null && contactValues[0].getContExpireDate().after(new Date())) {
                cp.put("LEGAL_GUARDIAN", contactValues[0].getContName());
                cp.put("GUARDIAN_UPDATE_DATE", DateTimeUtil.formatDate(contactValues[0].getContDoneDate()));
                cp.put("retFlag", "Y");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCustContacts exception.", e);
            }

            cp.put("retFlag", "N");
        }
        return cp;
    }
    public Map<String,Object> queryDuplicateCprIds(long custId) throws Exception {
        Map<String,Object> cp = new HashMap<>();
        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            if (custId > 0) {
                IBOCmxIndivCustomerValue value = service.queryCmxIndivCustomerValue(custId);
                String cprIds = value.getDuplicateCprId();
                cp.put("cprIds", cprIds);
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryDuplicateCust exception.", e);
            }

            cp.put("retFlag", "N");
        }
        return cp;
    }
    public IBceDealReturnData dealCustomer(Map custInfo, Long bceFrameId, String businessId) throws Exception{
        BceDataBean custNew = new BceDataBean();
        custNew.addUserData(BceUtil.BUSIOPER_ID_KEY,businessId);

        Map newCustInfo= (Map) custInfo.get("newData");
        Map oldCustInfo= (Map) custInfo.get("oldData");
        DataContainer newCustdc = DataContainerUtils.wrap1((Map) newCustInfo.get("custInfo"));
        DataContainer newAddInfodc = DataContainerUtils.wrap1((Map) newCustInfo.get("addInfo"));
        DataContainer[] indivCustomerDC = null;
        DataContainer[] addInfoList =null;
        if(oldCustInfo!=null&& !oldCustInfo.isEmpty()){
            DataContainer oldCustdc = DataContainerUtils.wrap1((Map) oldCustInfo.get("custInfo"));
            oldCustdc.setStsToOld();
            DataContainer oldAddInfodc = DataContainerUtils.wrap1((Map) newCustInfo.get("addInfo"));
            oldAddInfodc.setStsToOld();
            DataContainerUtils.setFontMap(oldCustdc,newCustdc);
            DataContainerUtils.setFontMap(oldAddInfodc,newAddInfodc);
            indivCustomerDC= new DataContainer[]{oldCustdc};
            addInfoList = new DataContainer[]{oldAddInfodc};
        } else {
            indivCustomerDC= new DataContainer[]{newCustdc};
            addInfoList = new DataContainer[]{newAddInfodc};
        }


        custNew.addNormalRowsetInfo("frmCustomer",indivCustomerDC);
        custNew.addNormalRowsetInfo("frmAddtionalInfo",addInfoList);

        ICmIndivCustomerBceDealSV service = (ICmIndivCustomerBceDealSV) ServiceFactory.getService(ICmIndivCustomerBceDealSV.class);
        // 业务处理
        return service.deal(custNew, bceFrameId);
    }

    public Map<String,Object> addOffLineMemberByCpr(String cprNum,String custId) throws Exception {
        Map<String,Object> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        cp.put("retMsg", " ");
        cp.put("firstName", "");
        cp.put("lastName", "");
        cp.put("birth", "");
        cp.put("isProtected", "N");
        cp.put("memberFrom", "cpr");
        cp.put("partyId", "-1");
        // 将custId返回，如果是新增的集团客户则不变，如果是选择已有客户角色的则换成相应的custId
        cp.put("custId", custId);
        try {
            // 根据cpr查询party表
            ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            IBOCmPartyValue[] partyVal = partySV.queryPartyByCertTypeAndCertCode(8, cprNum, -1, -1);
            if (CmCommonUtil.isNotEmptyObject(partyVal)) {
                cp.put("partyId", String.valueOf(partyVal[0].getPartyId()));
                // 存在party表，查寻是否具有custId
                ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                IBOCmIndivCustomerValue[] indivCust = customerSV.queryCustomerByCPR(cprNum);
                ICmPartyRoleSV partyRoleSv = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                IBOCmPartyRoleValue[] partyRoleValue = partyRoleSv.queryPartyRole(partyVal[0].getPartyId(), CmConstants.PartyRoleType.CUSTOMER, -1, -1);
                if (indivCust != null && indivCust.length > 0) {
                    // 存在客户角色.查询名称生日地址(这里暂时不做已经是成员和非潜在客户的校验)
                    cp.put("memberFrom", "indiv");
                    // 从partyrole的entityId获取custId
                    ICustomerValue customerVaule = customerSV.queryCustomerByCustId(indivCust[0].getCustId());
                    if (customerVaule != null) {
                        cp.put("firstName", customerVaule.getFirstName());
                        cp.put("lastName", customerVaule.getLastName());
                        cp.put("birth", DataType.getAsString(customerVaule.getBirthday()));
                        // 因为已经是客户所以存在了custId
                        cp.put("custId", String.valueOf(customerVaule.getCustId()));
                    }
                } else {
                    // 不存在custID，是payer或者是联系人
                    cp.put("memberFrom", "party");
                    cp.put("firstName", partyVal[0].getFirstName());
                    cp.put("lastName", partyVal[0].getLastName());
                    partyRoleValue = partyRoleSv.queryPartyRole(partyVal[0].getPartyId(), CmConstants.PartyRoleType.PAYER, -1, -1);
                    if (partyRoleValue != null && partyRoleValue.length > 0) {
                        // 是payer
                        IQBOCmPartyValue payerValue = partySV.queryIndivPayer(partyVal[0].getPartyId(), cprNum, new QBOCmPartyBean());
                        if (payerValue != null) {
                            cp.put("birth", DataType.getAsString(payerValue.getBirthday()));
                            // 需要插入媒介表
                            long addressId = DataType.getAsLong(payerValue.getContAddress());
                            String addressDetail = payerValue.getRemarks();
                            ICmCustomerSV service2 = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                            ArrayList<IBOCmCustContactMediumValue> list = new ArrayList<IBOCmCustContactMediumValue>();
                            IBOCmCustContactMediumValue value = new BOCmCustContactMediumBean();
                            value.setCustId(Long.valueOf(custId));
                            value.setContMedTypeId(CmConstants.AddressId.legalAddress);
                            value.setAddressId(addressId);
                            value.setRegionId((String) CmCommonUtil.getDefaultRegionId());
                            value.setAddressDetail(addressDetail);
                            list.add(value);
                            service2.saveCustContMedium(list.toArray(new BOCmCustContactMediumBean[0]));
                        } else {
                            // 是联系人
                        }
                    }
                }
            } else {
                // 不存在，调用cpr接口
                cp.put("memberFrom", "cpr");
                ICmIndivCustomerSV indivService = (ICmIndivCustomerSV) ServiceFactory.getService(ICmIndivCustomerSV.class);
                Map params = new HashMap();
                params.put("PNR", cprNum);
                // 送CPR进行校验
                Map cprData = indivService.validateCPR(params);
                String FEJLNR = (String) cprData.get("FEJLNR");
                if (!"00".equals(FEJLNR)) {
                    // CPR在CPR系统中不存在。
                    ExceptionUtil.throwBusinessException("CMS9988772");
                }
                Map data1 = (Map) cprData.get("DATA");
                Map data2 = (Map) data1.get("INFO");
                Map currentData = (Map) data2.get("Current_data");
                // 是否受保护
                String isProtected = (String) currentData.get("NVNADRBESKHAENSTART");
                // isProtected="1231234";
                String var = "[0]*";
                // 从CPR返回的生日
                String birthDayStr = (String) currentData.get("FOEDDTO");
                String birthDay = birthDayStr.substring(0, 4) + "-" + birthDayStr.substring(4, 6) + "-" + birthDayStr.substring(6, 8);
                if (!isProtected.matches(var)) {
                    // 受保护
                    cp.put("isProtected", "Y");
                    cp.put("birth", birthDay);
                } else {
                    // 从CPR返回的客户名称
                    String firstName = (String) currentData.get("FORNVN");
                    String lastName = (String) currentData.get("EFTERNVN");
                    // 从CPR返回的地址
                    String houseNum = ((String) currentData.get("HUSNR")).trim();
                    String floor = (String) currentData.get("ETAGE");
                    String sideOrApartNum = (String) currentData.get("SIDEDOER");
                    String buildNum = (String) currentData.get("SIDEDOER");
                    String streetName = (String) currentData.get("VEJADRNVN");
                    String city = (String) currentData.get("POSTDISTTXT");
                    String smallCity = (String) currentData.get("BYNVN");
                    String postCode = (String) currentData.get("POSTNR");
                    String coName = (String) currentData.get("CONVN");
                    String munici = (String) currentData.get("KOMKOD");
                    String personStatus = (String) currentData.get("STATUS");
                    if ("80".equals(personStatus)) {
                        // 客户移民
                        cp.put("flag", "Y");
                        cp.put("birth", birthDay);
                        ExceptionUtil.throwBusinessException("CMS9988946");
                    }
                    if ("70".equals(personStatus)) {
                        // 客户消失
                        cp.put("flag", "Y");
                        cp.put("birth", birthDay);
                        ExceptionUtil.throwBusinessException("CMS9988947");
                    }
                    // 不受保护
                    cp.put("firstName", CmCommonUtil.capitalizeFirstLetter(firstName));
                    cp.put("lastName", CmCommonUtil.capitalizeFirstLetter(lastName));
                    cp.put("birth", birthDay);
                    cp.put("isProtected", "N");
                    address address = new address();
                    address.setAddressType(CmConstants.Address.ADDRESSTYPE);
                    address.setDistrictId(CmConstants.Address.DISTRICTID);
                    if (StringUtils.isNotBlank(houseNum)) {
                        if (Character.isLetter(houseNum.charAt(houseNum.length() - 1))) {
                            address.setHouseNumber(String.valueOf(Integer.valueOf(houseNum.substring(0, houseNum.length() - 1).trim())));
                            address.setHouseLetter(String.valueOf(houseNum.charAt(houseNum.length() - 1)));
                        } else {
                            address.setHouseNumber(String.valueOf(Integer.valueOf(houseNum.trim())));
                            address.setHouseLetter("");
                        }
                    }
                    if (StringUtils.isNotBlank(floor)) {
                        address.setFloor(floor.trim());
                    } else {
                        address.setFloor("");
                    }
                    if (StringUtils.isNotBlank(streetName)) {
                        address.setStreetName(streetName.trim());
                    } else {
                        address.setStreetName("");
                    }
                    if (StringUtils.isNotBlank(city)) {
                        address.setCity(city.trim());
                    } else {
                        address.setCity("");
                    }
                    if (StringUtils.isNotBlank(smallCity)) {
                        address.setCounty(smallCity.trim());
                    } else {
                        address.setCounty("");
                    }
                    // 根据特殊规则判断sidedoer的走向
                    if (StringUtils.isNotBlank(sideOrApartNum)) {
                        if (CmCommonUtil.validateSidedoer(sideOrApartNum)) {
                            address.setApartment(sideOrApartNum.trim());
                            address.setDoorNumber("");
                        } else {
                            address.setDoorNumber(sideOrApartNum.trim());
                            address.setApartment("");
                        }
                    } else {
                        address.setApartment("");
                        address.setDoorNumber("");
                    }
                    if (StringUtils.isNotBlank(postCode)) {
                        address.setZipcode(postCode);
                    } else {
                        address.setZipcode("");
                    }
                    if (StringUtils.isNotBlank(munici)) {
                        address.setMunicipality(munici);
                    } else {
                        address.setMunicipality("");
                    }
                    address.setAddrDesc("");
                    address.setMainDoor("");

                    // 地址层级中增加CO_NAME
                    if (StringUtils.isNotBlank(coName)) {
                        address.setCoName(coName);
                    } else {
                        address.setCoName("");
                    }

                    IAddressSV service1 = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
                    long addressId = service1.saveAddress(address);
                    cp.put("addressId", String.valueOf(addressId));
                    ICmCustomerSV service2 = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                    ArrayList<IBOCmCustContactMediumValue> list = new ArrayList<IBOCmCustContactMediumValue>();
                    IBOCmCustContactMediumValue value = new BOCmCustContactMediumBean();
                    value.setCustId(Long.valueOf(custId));
                    value.setContMedTypeId(CmConstants.AddressId.legalAddress);
                    value.setAddressId(addressId);
                    value.setRegionId(CmCommonUtil.getDefaultRegionId());
                    address realAddress = service1.getAddress(addressId, "012002002");
                    value.setAddressDetail(realAddress.getAddrDesc());
                    list.add(value);
                    service2.saveCustContMedium(list.toArray(new BOCmCustContactMediumBean[0]));
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            cp.put("retMsg", e.toString());
        }
        return cp;
    }

    public Map validateCust(long custId,String custName){
        Map cp = new HashMap<>();
        cp.put("retFlag", "Y");

        try {
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmCustContactMediumValue value = service.queryCustContactByCustId(custId);
            if (null != value) {
                IQBOCmCustomerContactValue[] values = service.queryCustContactByCustIdAndName(value.getAddressId(), custName);
                if (null != values && values.length > 0) {
                    cp.put("retFlag", "N");
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
        return cp;
    }

    public Map queryPOAByCustId(String custId,String fullName,String birthday,String effTime,String expTime){
        Map cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            //调用SV，调用UIP接口
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            String resultPoa = customerSV.queryPOAInfoByTypeAndCustId(custId, "POA");
            if(StringUtils.isNotBlank(resultPoa)){
                JSONObject jsonObject = new JSONObject();
                JSONArray jsonArrayResult = new JSONArray();
                //jsonArrayResult = JSONArray.fromString("[{'agreementType':'POA','agreementPeriod':{'startDateTime':'2018-04-20T00:00','endDateTime':'2028-11-20T00:00'},'status':'APPROVED','characteristic':{'name':'terminationDate','value':'2018-11-20T01:00'},'agreementItem':[{'id':'1','name':'Purchase in cash'},{'id':'2','name':'Change / Terminate subscriptions'},{'id':'0','name':'Pick up package from Telenor shop'}],'engagedParty':[{'id':'21210011529489','role':'GIVER','fullName':'Roman Liekhtierov','birthDate':'1988-07-17','characteristic':[],'contactMedium':[{'type':'EMAIL','characteristic':{'emailAddress':'tearoli@telenor.dk'}},{'type':'PHONE','characteristic':{'phoneNumber':'4550761102'}},{'type':'ADDRESS','characteristic':{'postCode':'3200','stateOrProvince':'Raml?se','city':'Helsinge','street':'Skadebakken','houseNumber':'14','floor':'2','doorNumber':'7','streetCode':'1475','municipality':'0270'}}]},{'role':'RECEIVER','fullName':'yu jing','birthDate':'1990-06-25','characteristic':[],'contactMedium':[{'type':'EMAIL','characteristic':{'emailAddress':'vlpo@telenor.dk'}},{'type':'PHONE','characteristic':{'phoneNumber':'4550761102'}},{'type':'ADDRESS','characteristic':{'postCode':'3200','city':'Helsinge','street':'Skadebakken','houseNumber':'14','doorNumber':'7','streetCode':'1475','municipality':'0270'}}]}]},{'agreementType':'POA','agreementPeriod':{'startDateTime':'2018-04-20T00:00','endDateTime':'2018-11-20T00:00'},'status':'APPROVED','characteristic':{'name':'terminationDate','value':'2018-11-20T01:00'},'agreementItem':[{'id':'1','name':'Purchase in cash'},{'id':'2','name':'Change / Terminate subscriptions'},{'id':'0','name':'Pick up package from Telenor shop'}],'engagedParty':[{'id':'21210011529489','role':'GIVER','fullName':'Roman Liekhtierov','birthDate':'1988-07-17','characteristic':[],'contactMedium':[{'type':'EMAIL','characteristic':{'emailAddress':'tearoli@telenor.dk'}},{'type':'PHONE','characteristic':{'phoneNumber':'4550761102'}},{'type':'ADDRESS','characteristic':{'postCode':'3200','stateOrProvince':'Raml?se','city':'Helsinge','street':'Skadebakken','houseNumber':'14','floor':'2','doorNumber':'7','streetCode':'1475','municipality':'0270'}}]},{'role':'RECEIVER','fullName':'Vladyslav Povediuk','birthDate':'1990-06-25','characteristic':[],'contactMedium':[{'type':'EMAIL','characteristic':{'emailAddress':'vlpo@telenor.dk'}},{'type':'PHONE','characteristic':{'phoneNumber':'4550761102'}},{'type':'ADDRESS','characteristic':{'postCode':'3200','stateOrProvince':'Raml?se','city':'Helsinge','street':'Skadebakken','houseNumber':'14','floor':'2','doorNumber':'7','streetCode':'1475','municipality':'0270'}}]}]}]");
                jsonArrayResult = JSONArray.fromString(resultPoa);
                if(StringUtils.isNotEmpty(fullName)) {
                    if(jsonArrayResult.length()>1) {
                        for (int i = 0; i < jsonArrayResult.length(); i++) {
                            try {
                                JSONObject jsonObjectTemp = (JSONObject) jsonArrayResult.opt(i);
                                String  strAgrType = String.valueOf(jsonObjectTemp.opt("agreementType"));
                                if(StringUtils.isNotEmpty(strAgrType)&&strAgrType.equalsIgnoreCase("POA")) {
                                    JSONArray jsonArrayEngageParty = (JSONArray) jsonObjectTemp.opt("engagedParty");
                                    JSONObject agreementPeriod = (JSONObject) jsonObjectTemp.opt("agreementPeriod");
                                    for (int j = 0; j < jsonArrayEngageParty.length(); j++) {
                                        JSONObject jsonObjectTempEngageParty = (JSONObject) jsonArrayEngageParty.opt(j);
                                        String roleString = String.valueOf(jsonObjectTempEngageParty.opt("role"));
                                        String fullNameString = String.valueOf(jsonObjectTempEngageParty.opt("fullName"));
                                        String birthDateString = String.valueOf(jsonObjectTempEngageParty.opt("birthDate"));
                                        if("RECEIVER".equals(roleString)&&fullName.equals(fullNameString)
                                                &&birthday.equals(birthDateString)
                                                &&agreementPeriod.opt("startDateTime").equals(effTime)&&agreementPeriod.opt("endDateTime").equals(expTime)){
                                            jsonObject = jsonObjectTemp;
                                        }
                                    }
                                }

                                if(!jsonObject.isEmpty()) {
                                    break;
                                }
                            }catch (Exception e) {
                                log.error(e.getMessage(), e);
                            }
                        }
                    }else {
                        jsonObject = (JSONObject) jsonArrayResult.get(0);
                    }
                }else {
                    jsonObject.put("poaInfo",jsonArrayResult.toString());
                }
                cp.put("poaResult", jsonObject.toString());
            }
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryPOAByCustId exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map saveDkIndivContactInfo(Map groupMemberBean, Map partyContactBean, Map partyBean){
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            DataContainerInterface groupMemberDC = DataContainerUtils.wrap1(groupMemberBean);
            DataContainerInterface partyContactDC = DataContainerUtils.wrap1(partyContactBean);
            DataContainerInterface partyDC = DataContainerUtils.wrap1(partyBean);

            String regionId = CmCommonUtil.getDefaultRegionId();
            if (groupMemberDC.isNew() && partyDC.isNew()) {
                long partyId = CmCommonUtil.getNewSequence(BOCmPartyBean.class);
                long contId = CmCommonUtil.getNewSequence(BOCmPartyContactBean.class);
                // 个人联系关系
                BOCmIndivContactBean bean = new BOCmIndivContactBean();
                bean.copy(groupMemberDC);
                bean.setCustContId(CmCommonUtil.getNewSequence(BOCmIndivContactBean.class));
                bean.setContId(contId);
                bean.setPartyId(partyId);
                bean.setState("U");
                bean.setRegionId(regionId);
                CmInnerServiceFactory.getCommonInnerSV().saveBean(bean);

                // 参与人联系人
                BOCmPartyContactBean partyContact = new BOCmPartyContactBean();
                partyContact.copy(partyContactDC);
                partyContact.setContId(contId);
                partyContact.setPartyId(partyId);
                partyContact.setRegionId(regionId);
                partyContact.setState("U");
                CmInnerServiceFactory.getCommonInnerSV().saveBean(partyContact);

                // 参与人基本信息
                BOCmPartyBean partyInfo = new BOCmPartyBean();
                partyInfo.copy(partyDC);
                partyInfo.setPartyId(partyId);
                if (partyInfo.getMiddleName() == null) {
                    partyInfo.setPartyName(partyInfo.getFirstName() + " " + partyInfo.getLastName());
                } else {
                    partyInfo.setPartyName(partyInfo.getFirstName() + " " + partyInfo.getMiddleName() + " " + partyInfo.getLastName());
                }
                partyInfo.setRegionId(regionId);
                partyInfo.setState("U");
                CmInnerServiceFactory.getCommonInnerSV().saveBean(partyInfo);
            }
            if (groupMemberDC.isModified() && partyContactDC.isModified() && partyDC.isModified()) {
                BOCmIndivContactBean bean = new BOCmIndivContactBean();
                bean.copy(groupMemberDC);
                BOCmIndivContactBean oldBean = (BOCmIndivContactBean)CmInnerServiceFactory.getCommonInnerSV().getBean(bean);
                DataContainerFactory.copyNoClearData(bean,oldBean);
                CmInnerServiceFactory.getCommonInnerSV().saveBean(oldBean);

                BOCmPartyContactBean partyContact = new BOCmPartyContactBean();
                partyContact.copy(partyContactDC);
                BOCmPartyContactBean oldPartyContact = (BOCmPartyContactBean)CmInnerServiceFactory.getCommonInnerSV().getBean(partyContact);
                DataContainerFactory.copyNoClearData(partyContact,oldPartyContact);
                CmInnerServiceFactory.getCommonInnerSV().saveBean(oldPartyContact);

                BOCmPartyBean partyInfo = new BOCmPartyBean();
                partyInfo.copy(partyDC);
                BOCmPartyBean oldPartyInfo = (BOCmPartyBean)CmInnerServiceFactory.getCommonInnerSV().getBean(partyInfo);
                DataContainerFactory.copyNoClearData(partyInfo,oldPartyInfo);

                if (partyInfo.getMiddleName() == null) {
                    oldPartyInfo.setPartyName(partyInfo.getFirstName() + " " + partyInfo.getLastName());
                } else {
                    oldPartyInfo.setPartyName(partyInfo.getFirstName() + " " + partyInfo.getMiddleName() + " " + partyInfo.getLastName());
                }
                CmInnerServiceFactory.getCommonInnerSV().saveBean(oldPartyInfo);
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveDkIndivContactInfo exception.", e);
            }

            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map savePartyContactInfo(Map groupMemberBean,Map partyContactBean,Map partyBean){
        Map cp = new HashMap();
        cp.put("retFlag", "Y");
        try {
            String regionId = CmCommonUtil.getDefaultRegionId();
            DataContainerInterface groupMemberDC = DataContainerUtils.wrap(groupMemberBean);
            DataContainerInterface partyContactDC = DataContainerUtils.wrap(partyContactBean);
            DataContainerInterface partyDC = DataContainerUtils.wrap(partyBean);
            if (partyContactDC.isModified()) {
                BOCmPartyContactBean partyContact = new BOCmPartyContactBean();
                partyContact.copy(partyContactDC);
                partyContact.initRegionId(regionId);
                CmInnerServiceFactory.getCommonInnerSV().saveBean(partyContact);
            }
            BOCmIndivContactBean indivContact = new BOCmIndivContactBean();
            indivContact.copy(groupMemberDC);
            indivContact.setCustContId(CmCommonUtil.getNewSequence(BOCmIndivContactBean.class));
            long partyId = partyDC.getAsLong("PARTY_ID");
            long contId = partyContactDC.getAsLong("CONT_ID");
            indivContact.setPartyId(partyId);
            indivContact.setContId(contId);
            indivContact.setRegionId(regionId);
            indivContact.setState("U");
            CmInnerServiceFactory.getCommonInnerSV().saveBean(indivContact);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("savePartyContactInfo exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map validateIndivContact(long partyId,long custId){
        Map cp = new HashMap();
        cp.put("retFlag", "N");
        try {
            ICmPartySV service = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            IBOCmIndivContactValue[] values = service.queryIndivContactByCustIdAndPartyId(custId, partyId);
            if (null != values && values.length > 0) {
                cp.put("retFlag", "Y");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("validateIndivContact exception.", e);
            }

            cp.put("retFlag", "N");
        }
        return cp;
    }
}
