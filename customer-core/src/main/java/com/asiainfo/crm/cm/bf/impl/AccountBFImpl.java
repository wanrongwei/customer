package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.AIException;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.tab.split.TenantIDFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.bce.ivalues.IBceDealReturnData;
import com.ai.bce.valuebean.BceDataBean;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.util.ExceptionUtil;
import com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils;
import com.asiainfo.crm.cm.common.CmBusinessOperation;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmRecordLog;
import com.asiainfo.crm.cm.common.bo.BOCmPartyRoleBean;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.CmStaticDataUtil;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.dk.bo.BOCmAcctBillFormatBean;
import com.asiainfo.crm.cm.dk.bo.BOCmAcctContactBean;
import com.asiainfo.crm.cm.dk.bo.BOCmPayChannelBean;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmAcctBillFormatValue;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmAcctContactValue;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmPayChannelValue;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmBillingAcctSV;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmBillCustomizeValue;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.inner.club.bo.BOCmClubBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmIndivPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyBean;
import com.asiainfo.crm.cm.inner.party.bo.BOCmPartyContactBean;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmIndivPartyValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyContactValue;
import com.asiainfo.crm.cm.inner.party.ivalues.IBOCmPartyValue;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;
import com.asiainfo.crm.cm.model.bean.VOAccountBean;
import com.asiainfo.crm.cm.model.bean.VOPartyBean;
import com.asiainfo.crm.cm.model.bo.*;
import com.asiainfo.crm.cm.model.ivalues.*;
import com.asiainfo.crm.cm.ln.account.service.interfaces.ICmLnAccountSV;
import com.asiainfo.crm.cm.service.interfaces.ICmAccountSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartyRoleSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartySV;
import com.asiainfo.crm.cm.support.bce.service.interfaces.ICmAccountBceDealSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICustFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import com.asiainfo.crm.cm.vo.BillingPaymentVo;
import com.asiainfo.crm.cm.vo.CmAccountInfoVo;
import com.asiainfo.crm.cm.vo.CmAccountVo;
import com.asiainfo.crm.cm.vo.CmBillCycle;
import com.asiainfo.crm.so.common.party.service.interfaces.ICrmCallAmsSV;
import com.asiainfo.crm.so.exe.ws.crmcallams.imsqueryservice.CaInvInfo;
import com.asiainfo.crm.so.exe.ws.crmcallams.imsqueryservice.SQueryInvoiceByAgentResp;
import com.asiainfo.crm.util.BceUtil;
import com.asiainfo.crm.vo.InvoiceBasic;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
public class AccountBFImpl {
    private static final String BILL_STATUS_UNPAID = "Collection";
    public Map delGrpAcctInfo(long acctId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            String tenantId = TenantIDFactory.getTenant();
            if(tenantId.equals(CmConstants.TenantId.TENANT_21)){
                throw new Exception("TENANT_21 is not allowed to delete account");
            }
            //调用billing接口设置账户状态
            ICmAccountSV accountSv = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
            IAccountValue value = accountSv.queryAccountById(acctId);
            if(value!=null){
                IVOAccountValue accountValue=new VOAccountBean();
                //设置 为 inactive,billing侧的枚举2：inactive
                value.setState("2");
                accountValue.setAccount(value);
                accountSv.updateAccountSend(accountValue);
            }else{
                // 账户信息不存在
                ExceptionUtil.throwBusinessException("CMS8000050");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("delGrpAcctInfo error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map createPayer(Map bean) throws Exception {
        DataContainer dc = DataContainerUtils.wrap1(bean);
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "exsist";
        String pId = "";
        try {
            if (bean == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {

                DataContainerInterface[] dci = {dc};
                String temp = dci[0].getAsString("PARTY_ID");
                long certType = dci[0].getAsLong("CERT_TYPE");
                // 参与人联系信息
                IBOCmPartyContactValue contactVal = new BOCmPartyContactBean();
                contactVal.copy(dci[0]);
                // 个人类参与人信息表
                IBOCmIndivPartyValue indivPartyVal = new BOCmIndivPartyBean();
                indivPartyVal.copy(dci[0]);
                // 参与人信息表
                IBOCmPartyValue partyVal = new BOCmPartyBean();
                partyVal.copy(dci[0]);
                // 不存在与crm系统中,只可能是个人客户
                if (StringUtils.isBlank(temp)) {
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
                    // 保存参与人角色信息
                    IPartyRoleValue partyRoleValue = new PartyRoleBean();
                    partyRoleValue.setRoleType(CmConstants.PartyRoleType.PAYER);
                    partyRoleValue.setEntityId(partyValue.getPartyId());
                    partyRoleValue.setPartyId(partyValue.getPartyId());
                    partyRoleValue.setRegionId(CmCommonUtil.getDefaultRegionId());
                    partyRoleValue.setRoleStatus(CmConstants.roleStatus.ACTIVE);
                    partyRoleValue.setState(CmConstants.RecordState.USE);
                    vovalue.setPartyRole(partyRoleValue);
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
                    // 保存个人类参与人信息
                    // indivPartyVal.setPartyId(partyValue.getPartyId());
                    // CmInnerServiceFactory.getCommonInnerSV().saveBean((BOCmIndivPartyBean)indivPartyVal);
                    // 参与人为新创建
                    retMsg = "create";
                    pId = Long.toString(partyValue.getPartyId());
                } else {

                    // 存在与crm系统中
                    long partyId = Long.parseLong(temp);
                    // 查询party，如果cprId为空则插入partyId
                    ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                    IPartyValue partyValue = partySV.queryPartyById(partyId);
                    // 修改firsrtName和lastName
                    partyValue.setFirstName(dci[0].getAsString("FIRST_NAME"));
                    partyValue.setLastName(dci[0].getAsString("LAST_NAME"));
                    String firstName_qry = dci[0].getAsString("FIRST_NAME");
                    String lastName_qry = dci[0].getAsString("LAST_NAME");
                    if(StringUtils.isNotEmpty(firstName_qry)&&StringUtils.isNotEmpty(lastName_qry)){
                        partyValue.setPartyName(dci[0].getAsString("FIRST_NAME") + " " + dci[0].getAsString("LAST_NAME"));
                        partyValue.setFirstNameQry(StringUtils.upperCase(dci[0].getAsString("FIRST_NAME")));
                        partyValue.setLastNameQry(StringUtils.upperCase(dci[0].getAsString("LAST_NAME")));
                        partyValue.setPartyNameQry(StringUtils.upperCase(dci[0].getAsString("FIRST_NAME") + " " + dci[0].getAsString("LAST_NAME")));
                    }
                    // 修改生日
                    partyValue.setBirthday(indivPartyVal.getBirthday());
                    if (partyValue != null && partyValue.getPartyType() == 1 && StringUtils.isBlank(partyValue.getCprId())) {
                        partyValue.setCprId(Long.toString(CmCommonUtil.getNewSequence(BOCmClubBean.class)));
                    }
                    IVOPartyValue voPartyValue = new VOPartyBean();
                    voPartyValue.setParty(partyValue);
                    IPartyRoleValue partyRoleValue = getPartyRoleValue(partyId);
                    // 若不存在payer角色则插入cm_party_role表创建角色payer
                    if (partyRoleValue != null) {
                        voPartyValue.setPartyRole(partyRoleValue);
                    }
                    // 保存参与人联系信息
                    contactVal.setPartyId(partyId);
                    IPartyContactValue partyContactValue = getPartyContactValue(contactVal);
                    voPartyValue.setPartyContact(partyContactValue);
                    ICmPartySV service = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                    voPartyValue.setBusinessId(CmConstants.BusiLogId.PAYER);
                    service.saveParty(voPartyValue);
                }
            }

        } catch (Exception e) {
            log.info(e.getMessage(), e);
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("pId", pId);
        }
        return cp;
    }

    /**
     * 创建参与人角色。存在则不创建
     * @param partyId
     * @throws Exception
     */
    private IPartyRoleValue getPartyRoleValue(long partyId) throws Exception {
        ICmPartyRoleSV service = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
        IBOCmPartyRoleValue[] roleVal = service.queryAllPartyRoles(partyId, ICmPartySV.ROLE_PAYER, -1, -1);
        // 未查到数据，参与人角色不是payer
        if (roleVal.length == 0) {
            // 创建角色为payer的参与人
            BOCmPartyRoleBean roleBean = new BOCmPartyRoleBean();
            roleBean.setPartyId(partyId);
            roleBean.setRoleType(CmConstants.PartyRoleType.PAYER);
            roleBean.setRoleStatus(CmConstants.roleStatus.ACTIVE);
            roleBean.setPartyRoleId(CmCommonUtil.getNewSequence(BOCmPartyRoleBean.class));
            roleBean.setState(CmConstants.RecordState.USE);
            roleBean.setCreateOpId(ServiceManager.getUser().getID());
            roleBean.setCreateOrgId(ServiceManager.getUser().getOrgId());
            roleBean.setEntityId(partyId);
            roleBean.setRegionId(CmCommonUtil.getDefaultRegionId());
            IPartyRoleValue value = new PartyRoleBean();
            value.copy(roleBean);
            return value;
        } else {
            // 创建代付账户将entityId改成partyId
            BOCmPartyRoleBean bean = new BOCmPartyRoleBean();
            bean.copy(roleVal[0]);
            bean.setEntityId(partyId);
            CmInnerServiceFactory.getCommonInnerSV().saveBean(bean);
            return null;
        }
    }

    /**
     * 保存参与人联系信息，不存在则创建
     * @param partyContactVal
     * @throws Exception
     * @throws AIException
     */
    private IPartyContactValue getPartyContactValue(IBOCmPartyContactValue partyContactVal) throws Exception, AIException {
        Long partyId = partyContactVal.getPartyId();
        if (partyId != null && !partyId.equals("")) {
            StringBuilder sql = new StringBuilder();
            sql.append("1=1").append(" and ").append(IBOCmPartyContactValue.S_PartyId).append("=:partyId");
            Map parameter = new HashMap();
            parameter.put("partyId", partyId);
            IBOCmPartyContactValue[] result = (IBOCmPartyContactValue[]) CmInnerServiceFactory.getCommonInnerSV().getBeans(BOCmPartyContactBean.class, sql.toString(), parameter,
                    -1, -1);
            if (null == result || result.length == 0) {
                // 使用前台传过来的contId
                partyContactVal.setContId(partyContactVal.getContId());
                IPartyContactValue bean = new PartyContactBean();
                bean.copy(partyContactVal);
                bean.setStsToNew();
                return bean;
            } else {
                IPartyContactValue bean = new PartyContactBean();
                bean.copy(partyContactVal);
                bean.setStsToNew();
                bean.setContId(result[0].getContId());
                bean.initProperty("CONT_ID", result[0].getContId());
                return bean;
            }
        } else {
            throw new Exception("PartyId does not exsists");
        }
    }

    /**
     * 纯User、纯Payer或者是这两种角色的集合才能编辑
     *
     * @param partyId
     * @throws Exception
     */
    public Map checkHasOtherRolesWithoutPayer(long partyId) throws Exception {
        Map cp = new HashMap();
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
        } finally {
            cp.put("hasFlag", hasFlag);
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("roleScene", roleScene);
        }
        return cp;
    }

    public Map saveAddressChange(String oldAddress, String newAddress,long custId,long acctId) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            String[] detail = new String[] { "Account Number:" + acctId, "Old payer billing address:" + oldAddress, "New payer billing address:" + newAddress };
            CmRecordLog.saveRecord(CmBusinessOperation.CM_PAYER_MOD, custId, detail);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveAddressChange error.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map saveBillingPayment(long custId, long acctId, BillingPaymentVo infos) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (infos == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                ICmBillingAcctSV billingAcctSV = (ICmBillingAcctSV) ServiceFactory.getService(ICmBillingAcctSV.class);
                IBOCmAcctBillFormatValue billFormatValue = null;
                IBOCmPayChannelValue payChannelValue = null;
                IBOCmAcctContactValue acctContactValue = null;
                DataContainerInterface[] values = null;
                List result = new ArrayList();
                if (infos.getCmPayChannel()!=null) {
                    DataContainer ds = DataContainerUtils.wrap1((infos.getCmPayChannel()));
                    payChannelValue = new BOCmPayChannelBean();
                    payChannelValue.copy(ds);
                }
                if (infos.getCmAcctContact()!=null)  {
                    DataContainer ds = DataContainerUtils.wrap1((infos.getCmAcctContact()));
                    acctContactValue = new BOCmAcctContactBean();
                    acctContactValue.copy(ds);
                }
                if(infos.getCmAcctBillFormat()!=null){//cmAcctBillFormat
                    for(Map formatBill:infos.getCmAcctBillFormat()) {
                        DataContainer ds = DataContainerUtils.wrap1(formatBill);
                        billFormatValue = new BOCmAcctBillFormatBean();
                        billFormatValue.copy(ds);
                        result.add(billFormatValue);
                    }
                }
                billingAcctSV.saveAcctPayment(acctId, custId, payChannelValue, (IBOCmAcctBillFormatValue[]) result.toArray(new IBOCmAcctBillFormatValue[0]), acctContactValue);
                // 操作成功!
                retMsg = CrmLocaleFactory.getResource("CMS0088085");
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

    public IBceDealReturnData dealAccount(CmAccountInfoVo voAccountValue, Long bceFrameId, String businessId) throws Exception{
        BceDataBean accountNew = new BceDataBean();
        accountNew.addUserData(BceUtil.BUSIOPER_ID_KEY,businessId);
        DataContainer frmBillCycle = DataContainerUtils.wrap1(voAccountValue.getFrmBillCycle());
        DataContainer frmAccount = DataContainerUtils.wrap1(voAccountValue.getFrmAccount());
        DataContainer[] dcs0=null;
        DataContainer[] dcs1=null;
        if(voAccountValue.getOldFrmAccount()!=null && !voAccountValue.getOldFrmAccount().isEmpty()){
            DataContainer oldfrmAccount =  DataContainerUtils.wrap1(voAccountValue.getOldFrmAccount());
            oldfrmAccount.setStsToOld();
            DataContainerUtils.setFontMap(oldfrmAccount,frmAccount);
            DataContainer oldfrmBillCycle =  DataContainerUtils.wrap1(voAccountValue.getOldFrmBillCycle());
            oldfrmBillCycle.setStsToOld();
            DataContainerUtils.setFontMap(oldfrmBillCycle,frmBillCycle);
            dcs0= new DataContainer[]{oldfrmAccount};
            dcs1= new DataContainer[]{oldfrmBillCycle};
        } else {
            dcs0= new DataContainer[]{frmAccount};
            dcs1= new DataContainer[]{frmBillCycle};
        }
        accountNew.addNormalRowsetInfo("frmAccount",dcs0);
        accountNew.addNormalRowsetInfo("frmBillCycle",dcs1);

        ICmAccountBceDealSV service = (ICmAccountBceDealSV) ServiceFactory.getService(ICmAccountBceDealSV.class);
        // 业务处理
        return service.deal(accountNew, bceFrameId);
    }

//    private DataContainer getAccountDataContainer(CmAccountVo accountVo) {
//        DataContainer frmAccount = new DataContainer();
//        frmAccount.set("URGE_STOP_FLAG", accountVo.getUrgeStopFlag());
//        frmAccount.set("PAY_METHOD", accountVo.getPayMethod());
//        frmAccount.set("INSTALLMENT_FLAG", accountVo.getInstallmentFlag());
//        frmAccount.set("CUST_ID", accountVo.getCustId());
//        frmAccount.set("ACCT_BEHALF_PHONE", accountVo.getAcctBehalfPhone());
//        frmAccount.set("CUST_NAME", accountVo.getCustName());
//        frmAccount.set("FIRST_NAME", accountVo.getFirstName());
//        frmAccount.set("LAST_NAME", accountVo.getLastName());
//        frmAccount.set("CUST_CRED_CODE", accountVo.getCustCredCode());
//        frmAccount.set("TAX_ID", accountVo.getTaxId());
//        frmAccount.set("ACCT_TYPE", accountVo.getAcctType());
//        frmAccount.set("ACCT_NAME", accountVo.getAcctName());
//        frmAccount.set("PAYMENT_ACCOUNT_NAME", accountVo.getPaymentAccountName());
//        frmAccount.set("BANK_CONTRACT", accountVo.getBankContract());
//        frmAccount.set("ACCT_STATUS", accountVo.getAcctStatus());
//        frmAccount.set("REGION_ID", accountVo.getRegionId());
//        frmAccount.set("EFFECTIVE_DATE", accountVo.getEffectiveDate());
//        frmAccount.set("EXPIRE_DATE", accountVo.getExpireDate());
//        frmAccount.set("PARTY_ID", accountVo.getPartyId());
//        frmAccount.set("OLD_PARTY_ID", accountVo.getOldPartyId());
//        frmAccount.set("IS_CHOOSE_PAYER", accountVo.getIsChoosePayer());
//        frmAccount.set("ACCT_PASSWORD", accountVo.getAcctPassword());
//        if(accountVo.getAcctId()!=null && accountVo.getAcctId()>0L){
//            frmAccount.set("ACCT_ID", accountVo.getAcctId());
//        }
//         return frmAccount;
//    }

//    private DataContainer getBillCycleContainer(CmBillCycle billCycle) {
//        DataContainer frmBillCycle = new DataContainer();
//        frmBillCycle.set("CYCLE_TYPE", billCycle.getCycleType());
//        frmBillCycle.set("BILL_DAY", billCycle.getBillDay());
//        frmBillCycle.set("ACCT_ID", billCycle.getAcctId());
//        frmBillCycle.set("REGION_ID", billCycle.getRegionId());
//        frmBillCycle.set("CYCLE_ID", billCycle.getCycleId());
//        frmBillCycle.set("CYCLE_UNIT", billCycle.getCycleUnit());
//        frmBillCycle.set("BILL_DUE_DATE", billCycle.getBillDueDate());
//        frmBillCycle.set("CYCLE_TYPE_t_name", billCycle.getCycleTypeTName());
//        frmBillCycle.set("BILL_DAY_t_name", billCycle.getBillDayTName());
//        frmBillCycle.set("REMARKS", billCycle.getRemarks());
//        return frmBillCycle;
//    }

    public Map getTransactionId(long custId,String url) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        String retUrl = "";
        String transactionId = "";
        try {
            url = url + "&custId=" + custId;
            ICmBillingAcctSV acctSV = (ICmBillingAcctSV) ServiceFactory.getService(ICmBillingAcctSV.class);
            transactionId = acctSV.getTransactionId(url);
            String codeName = CmStaticDataUtil.getStaticDataName("CM_BILLING_MERCHANT_ID", "1");
            retUrl = "https://test.epayment.nets.eu/epay/default.aspx?merchantId=" + codeName + "&transactionId=" + transactionId;
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("",e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("retUrl", retUrl);
        }
        return cp;
    }
    public Map queryAcctDtsByCustIdAndBillId(long custId, String regionId, String billId, String payMethod, int insFlag, String agrId, String acctName,
                                                                long acctId, int start, int end) throws Exception{
        Map result=new HashMap();
        ICmAccountSV acctSV = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
        IAccountProfileValue[] acctInfos = acctSV.queryAcctDtsByCustIdAndBillId(custId, regionId, billId, payMethod, insFlag, agrId, acctName, acctId, start, end);
        int total = acctSV.queryAcctDtsCountByCustIdAndBillId(custId, regionId, billId, payMethod, insFlag, agrId, acctName,  acctId);
        List<Map> acctList=new ArrayList<>();
        for(IAccountProfileValue acct:acctInfos){
            acctList.add(acct.getProperties());
        }
        result.put("TOTAL",total);
        result.put("ACCT_LIST",acctList);
        return  result;
    }

    ///api/cm/customer/{custId}/account/cmCustAcctRel
    public Map queryCustAcctRel(long relCustd, long acctId, String acctName, int installmentFalg, int paymethod, int cycleType, String custStatus,
                                String acctServiceId, String serviceNumber, String pbs, String ean, int startIndex, int endIndex) throws Exception{
        ICmAccountSV sv = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
        IBOCmCustAcctRelValue[]  values = sv.queryCustAcctRelFor360(relCustd, acctId, acctName, installmentFalg, paymethod, cycleType, custStatus,
                acctServiceId, serviceNumber, pbs, ean, startIndex, endIndex);
        ArrayList list = new ArrayList();
        if(values!=null) {
            for (IBOCmCustAcctRelValue value:values ){
                Map map = value.getProperties();
                updateAcctDueInfo(value.getAcctId(),map);
                list.add(map);
            }
        }

        Map result = new HashMap();
        result.put("values", list);
        result.put("total", sv.queryCustAcctRelCountFor360(relCustd, acctId, acctName, installmentFalg, paymethod, cycleType, custStatus, acctServiceId,serviceNumber, pbs, ean));
        return result;
    }

    private void updateAcctDueInfo(long acctId,Map acctMap) throws Exception{
        List<InvoiceBasic> bills = queryInvoiceByAccount(acctId,0,3,null);
        if(bills!=null&&bills.size()>0){
            acctMap.put("DUE_FLAG",bills.get(0).getBillSts());
            acctMap.put("DUE_DATE",bills.get(0).getDueDate());
        }
    }

    public List<InvoiceBasic> queryInvoiceByAccount(long acctId, long userId, int queryType, String billmonths) throws Exception {
        List<InvoiceBasic> invoiceBasicList = new ArrayList<>();
        ICrmCallAmsSV crmCallAmsSV = (ICrmCallAmsSV) ServiceFactory.getService(ICrmCallAmsSV.class);
        SQueryInvoiceByAgentResp response = crmCallAmsSV.doQueryInvoiceByAgent("",userId, acctId, queryType, billmonths);
        if(response != null){
            CaInvInfo[] caInvInfoList = response.getCaInvInfoList();
            if(caInvInfoList != null && caInvInfoList.length > 0){
                for(CaInvInfo caInvInfo:caInvInfoList){
                    InvoiceBasic invoiceBasic = new InvoiceBasic();
                    invoiceBasic.setAccountId(acctId);
                    invoiceBasic.setBillMonth(String.valueOf(caInvInfo.getBillMonth()));
                    // 四舍五入保留两位小数，并添加单位" DKK"
                    BigDecimal totalFee = BigDecimal.valueOf(caInvInfo.getInvoiceTotal()).divide(BigDecimal.valueOf(100));
                    invoiceBasic.setBigDecimalFee(totalFee);
                    invoiceBasic.setTotalFee(formatFee(totalFee));
                    invoiceBasic.setBillSts(getBillStatus(caInvInfo.getBillSts()));
                    invoiceBasic.setDueDate(caInvInfo.getDueDate());
                    invoiceBasicList.add(invoiceBasic);
                }
                invoiceBasicList=invoiceBasicList.stream().sorted(Comparator.comparing(InvoiceBasic::getBillMonth).reversed()).collect(Collectors.toList());;
            }
        }
        return invoiceBasicList;
    }

    private String formatFee(BigDecimal fee){
        fee = fee.setScale(2, RoundingMode.HALF_UP);
        return fee.toPlainString() + " DKK";
    }

    public static String getBillStatus(int billSts) {
        switch (billSts) {
//            case 0:
//                return "canceled";
//            case 1:
//                return BILL_STATUS_UNPAID;
            case 2:
                return "paid off";
//            case 3:
//                return "halting";
//            case 4:
//                return "fund in transit";
            default:
                return BILL_STATUS_UNPAID;
        }
    }

    /**
     * Query user split account information
     * 
     * @param custId customer ID
     * @param serviceNumber service number (can be null or empty)
     * @param defaultAcctId default account ID (-1 for all)
     * @param splitAcctId split account ID (-1 for all)
     * @param splitRuleId split rule ID (-1 for all)
     * @param itemIdName item ID name (can be null or empty)
     * @param startRowIndex start row index for pagination
     * @param endRowIndex end row index for pagination
     * @return Map containing:
     *   - TOTAL: total record count
     *   - LIST: list of split account information (List<Map>)
     * @throws Exception if query fails
     * 
     * API Configuration:
     * - sys_id: TBD
     * - API path: TBD
     * - HTTP method: TBD
     */
    public Map queryUserSplitAccount(long custId, String serviceNumber, long defaultAcctId, long splitAcctId, long splitRuleId, String itemIdName, int pageNum, int pageSize) throws Exception {
        // Convert splitRuleId from 0 to -1 only when splitRuleId is 0 and itemIdName is empty
        if (splitRuleId == 0 && StringUtils.isBlank(itemIdName)) {
            splitRuleId = -1;
        }
        ICustFSV custFSV = (ICustFSV) ServiceFactory.getService(ICustFSV.class);
        return custFSV.queryUserSplitAccount(custId, serviceNumber, defaultAcctId, splitAcctId, splitRuleId, itemIdName, pageNum, pageSize);
    }

    /**
     * Query user split account length (total count)
     * 
     * @param custId customer ID
     * @param serviceNumber service number (can be null or empty)
     * @param defaultAcctId default account ID (-1 for all)
     * @param splitAcctId split account ID (-1 for all)
     * @param splitRuleId split rule ID (-1 for all)
     * @param itemIdName item ID name (can be null or empty)
     * @return total count of split account records
     * @throws Exception if query fails
     * 
     * API Configuration:
     * - sys_id: TBD
     * - API path: TBD
     * - HTTP method: TBD
     */
    public int queryUserSplitAccountLength(long custId, String serviceNumber, long defaultAcctId, long splitAcctId, long splitRuleId, String itemIdName) throws Exception {
        // Convert splitRuleId from 0 to -1 only when splitRuleId is 0 and itemIdName is empty
        if (splitRuleId == 0 && StringUtils.isBlank(itemIdName)) {
            splitRuleId = -1;
        }
        ICrmFSV crmFSV = (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
        return crmFSV.queryUserSplitAccountLength(custId, serviceNumber, defaultAcctId, splitAcctId, splitRuleId, itemIdName);
    }

    /**
     * 根据账户ID查询账户档案信息
     * 对应 ICmLnAccountSV.queryAccountProfileByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmAccount 表单数据源
     *
     * @param acctId 账户ID
     * @return Map 账户档案信息（ACCT_NAME、PAY_METHOD、ACCT_STATUS等），不存在时返回空Map
     */
    public Map<String, Object> queryAccountProfileByAcctId(long acctId) throws Exception {
        if (acctId <= 0) {
            log.warn("queryAccountProfileByAcctId: acctId is invalid, acctId={}", acctId);
            return new HashMap<>();
        }
        ICmLnAccountSV lnAccountSV = (ICmLnAccountSV) ServiceFactory.getService(ICmLnAccountSV.class);
        IAccountProfileValue profile = lnAccountSV.queryAccountProfileByAcctId(acctId);
        return profile != null && profile.getProperties() != null ? new HashMap<>(profile.getProperties()) : new HashMap<>();
    }

    /**
     * 根据账户ID查询当前账期信息
     * 对应 ICmAccountSV.queryCurrAcctBillCyclesByAcctId，CmAcctInfo4Open.jsp 中 cmAcctFrmBillCycle 表单数据源
     *
     * @param acctId 账户ID
     * @return Map 账期信息（CYCLE_TYPE、BILL_DAY、BILL_DUE_DATE等），不存在时返回空Map
     */
    public Map<String, Object> queryCurrAcctBillCyclesByAcctId(long acctId) throws Exception {
        if (acctId <= 0) {
            log.warn("queryCurrAcctBillCyclesByAcctId: acctId is invalid, acctId={}", acctId);
            return new HashMap<>();
        }
        ICmAccountSV cmAccountSV = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
        IAcctBillCycleValue billCycle = cmAccountSV.queryCurrAcctBillCyclesByAcctId(acctId);
        return billCycle != null && billCycle.getProperties() != null ? new HashMap<>(billCycle.getProperties()) : new HashMap<>();
    }

    /**
     * 根据账户ID和用户ID查询账单定制信息
     * 对应 ICmAccountSV.queryCmBillCustomizeByUserId，CmAcctInfo4Open.jsp 中 cmAcctFrmCustomize 表单数据源
     *
     * @param acctId   账户ID
     * @param userId   用户ID（-1表示不限）
     * @param startNum 起始行号（-1表示不分页）
     * @param endNum   结束行号（-1表示不分页）
     * @return Map 账单定制信息（RECIPIENTS、CONT_EMAIL、CONT_MOBILE等）
     */
    public Map<String, Object> queryCmBillCustomizeByUserId(long acctId, long userId, int startNum, int endNum) throws Exception {
        if (acctId <= 0) {
            log.warn("queryCmBillCustomizeByUserId: acctId is invalid, acctId={}", acctId);
            return new HashMap<>();
        }
        ICmAccountSV cmAccountSV = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
        IBOCmBillCustomizeValue customize = cmAccountSV.queryCmBillCustomizeByUserId(acctId, userId, startNum, endNum);
        return customize != null && customize.getProperties() != null ? new HashMap<>(customize.getProperties()) : new HashMap<>();
    }

}
