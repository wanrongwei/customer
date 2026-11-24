package com.asiainfo.crm.cm.bf.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


import com.ai.appframe2.common.SessionManager;
import com.ai.appframe2.privilege.UserInfoInterface;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.oneframe.view.bo.BOOf2VisualConfigBean;
import com.ai.oneframe.view.service.interfaces.IOf2VisualConfigSV;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.service.interfaces.ICmPartyRoleSV;
import org.springframework.stereotype.Component;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.aie.api.tool.XmlParameters;
import com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils;
import com.asiainfo.crm.cm.bf.IPartyBF;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.bo.QBOCmPartyBean;
import com.asiainfo.crm.cm.common.ivalues.IQBOCmPartyValue;
import com.asiainfo.crm.cm.common.service.interfaces.IAddressSV;
import com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV;
import com.asiainfo.crm.cm.inner.club.bo.BOCmClubBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustContactMediumValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustRequestTaskValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmIndivCustomerValue;
import com.asiainfo.crm.cm.inner.party.bo.BOCmIndivPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmIndivPartyValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyContactValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyValue;
import com.asiainfo.crm.cm.model.bean.VOCustAddressBean;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bean.VOPartyBean;
import com.asiainfo.crm.cm.model.bo.PartyBean;
import com.asiainfo.crm.cm.model.bo.PartyContactBean;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IPartyContactValue;
import com.asiainfo.crm.cm.model.ivalues.IPartyValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustAddressValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.model.ivalues.IVOPartyValue;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartySV;
import com.asiainfo.crm.cm.vo.PartyInfoVO;
import com.asiainfo.crm.cm.vo.QueryCmPartyVO;
import com.asiainfo.crm.util.CrmI18nFactory;
import com.asiainfo.crm.util.DateTimeUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class PartyBFImpl implements IPartyBF {
    public Long getPartyId() throws Exception {
        ICmCommonSV service = (ICmCommonSV) ServiceFactory.getService(ICmCommonSV.class);
        return service.getCommonNewSequence(BOCmPartyBean.class);
    }

    /**
     * 创建party
     * 
     * @param bean
     * @throws Exception
     */
    public Map createParty(Map bean) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "exist";
        String pId = "";
        String pName = "";
        ICmPartySV cmPartySV = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
        try {
            if (bean == null || bean.isEmpty()) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmI18nFactory.getStaticI18nResource("CMS0000080");
            } else {
                DataContainer dc = DataContainerUtils.wrap1(bean);
                String searchType = dc.getAsString("SEARCH_TYPE");
                if ("1".equals(searchType)) {
                    int certType = dc.getAsInt("CERT_TYPE");
                    String certCode = dc.getAsString("CERT_CODE");
                    // 判断是否存在数据库中
                    IQBOCmPartyValue[] values = (IQBOCmPartyValue[]) cmPartySV.queryPartysByCondition(null, null, null,
                            -1, certType, certCode, null, -1, "1", 3, -1, -1);
                    if (null == values) {
                        // 调CPR系统，查询相关数据
                        IQBOCmPartyValue qBOCmPartyValue = cmPartySV.checkIsHasParty(certCode);
                        // 判断是否能新建Party
                        // 只需要判断firstName既可，firstName有，肯定就有数据，而且不是移民，消失和受保护
                        if (StringUtils.isNotBlank(qBOCmPartyValue.getFirstName())) {
                            Map<String, String> mapResult = createPartyByQBOCmPartyValue(qBOCmPartyValue);
                            retVal = mapResult.get("retVal");
                            retMsg = mapResult.get("retMsg");
                            pId = mapResult.get("pId");
                            pName = mapResult.get("pName");
                        } else {
                            retVal = "N";
                            retMsg = "inexistence";
                        }
                    } else {
                        String partyNameOf1Search = values[0].getPartyName();
                        Long partyIdOf1Search = values[0].getPartyId();
                        retVal = "Y";
                        retMsg = "Party ID [" + partyIdOf1Search + "] ([" + partyNameOf1Search
                                + "]) already exists, duplication not allowed.";
                    }
                } else if ("2".equals(searchType)) {
                    // 先检查是否存在相同信息的party
                    DataContainerInterface[] dcs = new DataContainerInterface[] { dc };
                    Map<String, String> mapResult = checkAndAddPartyByNBA(dcs);
                    retVal = mapResult.get("retVal");
                    retMsg = mapResult.get("retMsg");
                    pId = mapResult.get("pId");
                    pName = mapResult.get("pName");

                } else if ("3".equals(searchType)) {
                    cp.put("retVal", "searchTypeIs3");
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            retVal = "Y";
            retMsg = e.getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("pId", pId);
            cp.put("pName", pName);
        }
        return cp;
    }

    public Map<String, String> createPartyByQBOCmPartyValue(IQBOCmPartyValue qBOCmPartyValue) throws Exception {
        Map<String, String> mapResult = new HashMap<String, String>();
        long partyId = qBOCmPartyValue.getPartyId();
        long certType = qBOCmPartyValue.getCertType();
        DataContainerInterface dcInstanse = (DataContainerInterface) qBOCmPartyValue;
        // 参与人联系信息
        IBOCmPartyContactValue contactVal = new BOCmPartyContactBean();
        contactVal.copy(dcInstanse);
        // 个人类参与人信息表
        IBOCmIndivPartyValue indivPartyVal = new BOCmIndivPartyBean();
        indivPartyVal.copy(dcInstanse);
        // 参与人信息表
        IBOCmPartyValue partyVal = new BOCmPartyBean();
        partyVal.copy(dcInstanse);
        // 不存在与crm系统中,只可能是个人客户
        if (partyId <= 0) {
            IVOPartyValue vovalue = new VOPartyBean();
            // 保存参与人信息
            IPartyValue partyValue = new PartyBean();
            partyValue.copy(partyVal);
            if (StringUtils.isBlank(partyValue.getPartyName())) {
                partyValue.setPartyName(partyValue.getFirstName() + " " + partyValue.getLastName());
            }
            partyValue.setFirstNameQry(StringUtils.upperCase(partyVal.getFirstName()));
            partyValue.setLastNameQry(StringUtils.upperCase(partyVal.getLastName()));
            partyValue.setMiddleNameQry(StringUtils.upperCase(partyVal.getMiddleName()));
            partyValue.setPartyNameQry(StringUtils.upperCase(partyVal.getPartyName()));
            partyValue.setCertType(CmConstants.CertificateType.CPR);
            partyValue.setPartyType(CmConstants.PartyType.INDIVIDUAL);
            partyValue.setPartyId(CmCommonUtil.getNewSequence(BOCmPartyBean.class));
            partyValue.setCprId(Long.toString(CmCommonUtil.getNewSequence(BOCmClubBean.class)));
            partyValue.setStsToNew();
            partyValue.setBirthday(indivPartyVal.getBirthday());
            vovalue.setParty(partyValue);
            // 保存参与人联系信息
            IPartyContactValue contactValue = new PartyContactBean();
            contactValue.copy(contactVal);
            contactValue.setPartyId(partyValue.getPartyId());
            contactValue.setFirstNameQry(partyVal.getFirstNameQry());
            contactValue.setLastNameQry(partyVal.getLastNameQry());
            contactValue.setMiddleNameQry(partyVal.getMiddleNameQry());
            contactValue.setContName(partyVal.getPartyName());
            contactValue.setContNameQry(partyVal.getPartyNameQry());
            vovalue.setPartyContact(contactValue);
            vovalue.setBusinessId(CmConstants.BusiLogId.PAYER);
            ICmPartySV service = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            service.saveParty(vovalue);
            // 参与人为新创建
            mapResult.put("retVal", "create");
            mapResult.put("pId", String.valueOf(partyValue.getPartyId()));
            mapResult.put("pName", partyValue.getPartyName());
        } else {
            StringBuffer cprMsgBuffer = new StringBuffer();
            cprMsgBuffer.append("Failed to add party with CPR Number ");
            cprMsgBuffer.append(qBOCmPartyValue.getCertCode()).append(". ");
            cprMsgBuffer.append(
                    " This CPR number does not exist in Veris party but the CPR profile (name, address, birthday) from CPR system is duplicated with existing Party ID ");
            cprMsgBuffer.append(partyId);
            cprMsgBuffer.append(" who has no CPR number. Try to search by Party ID and choose it as payer.");
            mapResult.put("retMsg", cprMsgBuffer.toString());
            mapResult.put("pId", String.valueOf(partyId));
            mapResult.put("retVal", "Y");
        }
        return mapResult;
    }

    public Map<String, String> checkAndAddPartyByNBA(DataContainerInterface[] dciInparam) throws Exception {
        ICmPartySV cmPartySV = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
        Map<String, String> mapResult = new HashMap<String, String>();
        String firstName = StringUtils.trim(dciInparam[0].getAsString("FIRST_NAME"));
        String lastName = StringUtils.trim(dciInparam[0].getAsString("LAST_NAME"));
        String birthday = dciInparam[0].getAsString("BIRTHDAY");
        long contAddress = dciInparam[0].getAsLong("CONT_ADDRESS");
        String addressDetail = dciInparam[0].getAsString("REMARKS");

        IQBOCmPartyValue[] pValues = (IQBOCmPartyValue[]) cmPartySV.queryPartysByCondition(firstName, lastName,
                birthday, contAddress, -1, null, null, -1, "1", 3, -1, -1);
        if (null != pValues && pValues.length > 0) {
            String partyNameOf1Search = pValues[0].getPartyName();
            Long partyIdOf1Search = pValues[0].getPartyId();
            String retMsg = "Party ID [" + partyIdOf1Search + "] ([" + partyNameOf1Search
                    + "]) already exists, duplication not allowed.";
            mapResult.put("retVal", "Y");
            mapResult.put("retMsg", retMsg);
            return mapResult;
        } else {
            IQBOCmPartyValue qCmPartyValue = new QBOCmPartyBean();
            qCmPartyValue.setFirstName(firstName);
            qCmPartyValue.setLastName(lastName);
            qCmPartyValue.setPartyName(firstName + " " + lastName);
            qCmPartyValue.setContAddress(String.valueOf(contAddress));
            qCmPartyValue.setRemarks(addressDetail);
            qCmPartyValue.setCertType(8);
            qCmPartyValue.setBirthday(Timestamp.valueOf(birthday + " 00:00:00"));
            return createPartyByQBOCmPartyValue(qCmPartyValue);
        }
    }

    public Map queryCertCodeByPartyId(long partyId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String certCode = "";
        try {
            ICmPartySV partySv = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            IPartyValue partyValue = partySv.queryPartyById(partyId);
            if (partyValue != null) {
                certCode = partyValue.getCertCode();
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryCertCodeByPartyId exception.", e);
            }
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("certCode", certCode);
        }
        return cp;
    }

    public Map checkPartyInfor(long partyId) throws Exception {
        Map cp = new HashMap();
        String retVal = "N";
        String retMsg = "";
        try {
            if (partyId > 0) {
                // 根据手机号码查询用户信息
                ICmPartySV sv = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
                IPartyValue partyValue = sv.queryPartyById(partyId);
                if (null != partyValue) {
                    cp.put("cprNumber", partyValue.getCertCode());
                    cp.put("state", partyValue.getState());
                    cp.put("partyType", String.valueOf(partyValue.getPartyType()));
                    retVal = "Y";
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("checkPartyInfor error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map checkUniqueParty(long partyId, String firstName, String lastName, long addressId, String birthday)
            throws Exception {
        Map cp = new HashMap();
        String retVal = "N";
        String retMsg = "";
        String hasExist = "N";
        String partyIdOfReturn = "N";
        try {
            // 通过名称生日地址校验客户是否已经存在
            ICmPartySV partySv = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            IQBOCmPartyValue cmPartyValue = partySv.queryPayerByNBA(firstName + " " + lastName, birthday, addressId);
            // 存在且不是当前party
            if (null != cmPartyValue && cmPartyValue.getPartyId() != partyId) {
                partyIdOfReturn = String.valueOf(cmPartyValue.getPartyId());
                hasExist = "Y";
                retVal = "Y";
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("checkUniqueParty error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("hasExist", hasExist);
            cp.put("partyIdOfReturn", partyIdOfReturn);
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map checkCprRegistHasComplete(long partyId) throws Exception {
        Map cp = new HashMap();
        String retVal = "N";
        String retMsg = "";
        String hasComplete = "N";
        try {
            if (partyId > 0) {
                // 根据partyId查询cprID
                ICmPartySV sv = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
                IPartyValue partyValue = sv.queryPartyById(partyId);
                if (null != partyValue) {
                    // 根据partyID查询出所有的角色
                    ICmCustRequestTaskSV requestTaskSV = (ICmCustRequestTaskSV) ServiceFactory
                            .getService(ICmCustRequestTaskSV.class);
                    IBOCmCustRequestTaskValue[] values = requestTaskSV
                            .queryByCustIdAndReqStatus(Long.parseLong(partyValue.getCprId()), "P");
                    if (null != values && values.length > 0 && "P".equals(values[0].getRequestStatus())) {
                        hasComplete = "Y";
                        retVal = "Y";
                    }
                }

            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("checkCprRegistHasComplete error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("hasComplete", hasComplete);
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    /**
     * 保存修改Party信息
     * 
     * @throws Exception
     */
    public Map modifyPartyInformation(PartyInfoVO info) throws Exception {
        Map cp = new HashMap();
        String retVal = "N";
        String retMsg = "";
        try {
            if (info.getPartyId() > 0) {
                ICmPartySV partySv = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                partySv.modifyPartyInformation(info.getPartyId(), info.getFirstName(), info.getLastName(),
                        info.getBirthday(), info.getAddressId(), info.getAddressDetail(), info.getGender(),
                        info.getCertCode());
                retVal = "Y";
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("modifyPartyInformation error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    /**
     * 保存修改User信息(只用在choose payer页面修改user信息)
     *
     * @param info
     * @throws Exception
     */
    public Map modifyUserInfo(PartyInfoVO info) throws Exception {
        Map cp = new HashMap();
        String retVal = "N";
        String retMsg = "";
        try {
            long partyId = info.getPartyId();
            String firstName = info.getFirstName();
            String lastName = info.getLastName();
            long addressId = info.getAddressId();
            String birthday = info.getBirthday();
            String addressDetail = info.getAddressDetail();
            int gender = info.getGender();
            String certCode = info.getCertCode();
            if (partyId > 0) {
                ICmPartySV partySv = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                IBOCmIndivCustomerValue[] indivCustomerValues = partySv.queryCustByPartyId(partyId);
                if (CmCommonUtil.isNotEmptyObject(indivCustomerValues) && String.valueOf(CmConstants.EntityType.USER)
                        .equals(indivCustomerValues[0].getIndivCustType())) {
                    // 修改User基本信息
                    IVOCustValue custValue = new VOCustBean();
                    long custId = indivCustomerValues[0].getCustId();
                    ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                    ICustomerValue customerValue = service.queryCustomerByCustId(custId);
                    customerValue.setFirstName(firstName);
                    customerValue.setLastName(lastName);
                    customerValue.setCustName(firstName + " " + lastName);
                    customerValue.setContName(firstName + " " + lastName);
                    customerValue.setFirstNameQry(StringUtils.upperCase(firstName));
                    customerValue.setLastNameQry(StringUtils.upperCase(lastName));
                    customerValue.setCustNameQry(StringUtils.upperCase(firstName + " " + lastName));
                    customerValue.setGender(gender);
                    if (StringUtils.isNotBlank(certCode)) {
                        customerValue.setCustCertCode(certCode);
                    }
                    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    format.setLenient(false);
                    customerValue.setBirthday(new Timestamp(format.parse(birthday).getTime()));

                    // 针对使用者
                    custValue.setBusinessId(CmConstants.BusiLogId.USER_MODIFY);
                    custValue.setCustomer(customerValue);

                    // 处理地址
                    ICmCustomerSV customerSv = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                    IBOCmCustContactMediumValue value = customerSv.queryCustContactMediumByCustIdAndType(custId,
                            String.valueOf(CmConstants.AddressId.legalAddress));
                    // 与原有地址不相等才更新
                    if (value != null && value.getAddressId() != addressId) {
                        // 修改地址的时候，重新送CPR
                        ICmCustRequestTaskSV taskSv = (ICmCustRequestTaskSV) ServiceFactory
                                .getService(ICmCustRequestTaskSV.class);
                        IBOCmCustRequestTaskValue[] taskValues = taskSv.queryByCustId(custId);
                        if (null != taskValues && taskValues.length > 0 && custId != CmConstants.ANONYMOUS_CUST_ID) {
                            taskValues[0].setRequestStatus("C");
                            taskValues[0].setStatusDate(DateTimeUtil.getDefaultSysDate());
                            taskValues[0].setResults("");
                            taskSv.saveCmCustRequestTask(taskValues[0]);
                        }

                        IAddressSV addressService = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
                        address address = addressService.getAddress(addressId,
                                CmConstants.AddressDistrictId.DISTRICT_ID);
                        if (address != null) {
                            List<IVOCustAddressValue> addrList = new ArrayList<>();
                            IVOCustAddressValue addressValue = new VOCustAddressBean();
                            value.setAddressId(addressId);
                            value.setAddressDetail(addressDetail);
                            addressValue.addContMedium(value);
                            addressValue.addAddress(address);
                            addrList.add(addressValue);
                            custValue.addCustAddress(addrList.toArray(new IVOCustAddressValue[0]));
                        }
                    }
                    CmServiceFactory.getCustomerSV().saveCustomer(custValue);
                }
                retVal = "Y";
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("modifyUserInfo error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    /**
     * 查询partyList的公用查询方法
     * 
     * @param condition
     * @return
     * @throws Exception
     */
    public int queryPartyByConditionCount(Map condition) throws Exception {
        ICmPartySV sv = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
        DataContainer dc = DataContainerUtils.wrap1(condition);
        return sv.queryPartyByConditionCount(dc);
    }

    public IQBOCmPartyValue[] queryPartyByCondition(Map condition, int startNum, int endNum) throws Exception {
        ICmPartySV sv = (ICmPartySV) ServiceFactory.getCrossCenterService(ICmPartySV.class);
        DataContainer dc = DataContainerUtils.wrap1(condition);
        return sv.queryPartyByCondition(dc, startNum, endNum);
    }

    public DataContainerInterface[] queryPartyList(QueryCmPartyVO queryCmPartyVO, int startNum, int endNum)
            throws Exception {
        int partyType = queryCmPartyVO.getPartyType();
        String partyName = queryCmPartyVO.getPartyName();
        String firstName = queryCmPartyVO.getFirstName();
        String lastName = queryCmPartyVO.getLastName();
        int certType = queryCmPartyVO.getCertType();
        String certCode = queryCmPartyVO.getCertCode();
        String addressId = queryCmPartyVO.getAddressId();
        long partyId = queryCmPartyVO.getPartyId();

        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "PARTY_TYPE", partyType + "");
        xmlParam.setBeanProp(beanClass, 0, "PARTY_NAME", partyName);
        xmlParam.setBeanProp(beanClass, 0, "FIRST_NAME", firstName);
        xmlParam.setBeanProp(beanClass, 0, "LAST_NAME", lastName);
        xmlParam.setBeanProp(beanClass, 0, "CERT_TYPE", certType + "");
        xmlParam.setBeanProp(beanClass, 0, "CERT_CODE", certCode);
        xmlParam.setBeanProp(beanClass, 0, "ADDRESS_ID", addressId);
        xmlParam.setBeanProp(beanClass, 0, "PARTY_ID", partyId + "");

        ICmDkCustomerSV sv = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        return sv.queryPartyList(xmlParam.toXml(), startNum, endNum);
    }

    public int queryPartyListCount(QueryCmPartyVO queryCmPartyVO) throws Exception {
        int partyType = queryCmPartyVO.getPartyType();
        String partyName = queryCmPartyVO.getPartyName();
        String firstName = queryCmPartyVO.getFirstName();
        String lastName = queryCmPartyVO.getLastName();
        int certType = queryCmPartyVO.getCertType();
        String certCode = queryCmPartyVO.getCertCode();
        String addressId = queryCmPartyVO.getAddressId();
        long partyId = queryCmPartyVO.getPartyId();

        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "PARTY_TYPE", partyType + "");
        xmlParam.setBeanProp(beanClass, 0, "PARTY_NAME", partyName);
        xmlParam.setBeanProp(beanClass, 0, "FIRST_NAME", firstName);
        xmlParam.setBeanProp(beanClass, 0, "LAST_NAME", lastName);
        xmlParam.setBeanProp(beanClass, 0, "CERT_TYPE", certType + "");
        xmlParam.setBeanProp(beanClass, 0, "CERT_CODE", certCode);
        xmlParam.setBeanProp(beanClass, 0, "ADDRESS_ID", addressId);
        xmlParam.setBeanProp(beanClass, 0, "PARTY_ID", partyId + "");

        ICmDkCustomerSV sv = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        return sv.queryPartyListCount(xmlParam.toXml());
    }
    public Map<String,Object> checkHasOtherRolesWithoutPayer(long partyId) throws Exception {
        Map<String,Object> cp = new HashMap<>();
        String retVal = "N";
        String retMsg = "";
        String hasFlag = "N";
        String roleScene = "";
        try {
            if (partyId > 0) {
                // 根据partyID查询出所有的角色
                ICmPartyRoleSV roleSv = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                IBOCmPartyRoleValue[] roleValues = roleSv.queryPartyRole(partyId, -1, -1, -1);
                if (null != roleValues && roleValues.length > 0) {
                    Set<Long> set = new HashSet<>();
                    for (IBOCmPartyRoleValue roleValue : roleValues) {
                        set.add(roleValue.getRoleType());
                    }
                    List<Long> roleList = new ArrayList<>(set);
                    // 没有客户角色且是纯payer或者payer/user两种角色
                    if (!roleList.contains(1L)) {
                        // 纯payer
                        if (roleList.contains(5L) && roleList.size() == 1) {
                            hasFlag = "N";
                            roleScene = "5";
                        } else if (roleList.contains(2L) && roleList.size() == 1) {
                            // 纯user
                            hasFlag = "N";
                            roleScene = "2";
                        } else {
                            // 只含有user/payer两种角色
                            if (roleList.contains(2L) && roleList.contains(5L) && roleList.size() == 2) {
                                hasFlag = "N";
                                roleScene = "2";
                            } else {
                                // 其他场景都不允许编辑
                                hasFlag = "Y";
                            }
                        }
                    } else {
                        // 有客户角色则提示不允许编辑
                        hasFlag = "Y";
                    }
                    retVal = "Y";
                }
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("checkHasOtherRolesWithoutPayer error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        }
        cp.put("hasFlag", hasFlag);
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        cp.put("roleScene", roleScene);
        return cp;
    }
    public IQBOCmPartyValue queryAsPartyByCertCodeAndLog(Map condition, int start, int end) throws Exception{
            ICmPartySV party = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            return party.queryAsPartyByCertCodeAndLog(DataContainerUtils.wrap1(condition), start, end);
    }
    public Map getSkinAndMenuStyle() throws Exception {
        Map<String,String> cp = new HashMap<>();
        IOf2VisualConfigSV sv = (IOf2VisualConfigSV)ServiceFactory.getService(IOf2VisualConfigSV.class);
        UserInfoInterface user = SessionManager.getUser();
        String retVal = "Y";
        String retMsg = "0,1";
        try {
            if (user != null) {
                long visualId = user.getID();
                BOOf2VisualConfigBean bean = sv.queryVisualCfgById(visualId);
                if (bean != null) {
                    if (StringUtils.isNotEmpty(bean.getSkinColor())) {
                        retMsg = bean.getSkinColor() + ",";
                    } else {
                        retMsg = "0,";
                    }

                    if (StringUtils.isNotEmpty(bean.getMenuStyle())) {
                        retMsg = retMsg + bean.getMenuStyle();
                    } else {
                        retMsg = retMsg + "1";
                    }
                }
            }
        } catch (Exception var14) {
            retVal = "N";
            retMsg = CrmLocaleFactory.getResource("OFS2000318") + var14.getCause() == null ? var14.getMessage() : var14.getCause().getMessage();
            if (log.isErrorEnabled()) {
                log.error(var14.getMessage(), var14);
            }
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg);
        return cp;
    }
}
