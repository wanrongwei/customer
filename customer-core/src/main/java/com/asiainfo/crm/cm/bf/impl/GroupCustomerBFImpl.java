package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.common.DataType;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.DataContainerList;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.util.ExceptionUtil;
import com.ai.omframe.order.ivalues.IOrdCustValue;
import com.ai.omframe.order.service.interfaces.IOrderQrySV;
import com.asiainfo.appframe.ext.flyingserver.org.apache.commons.lang.StringUtils;
import com.asiainfo.crm.cm.busimodel.common.ParamUtil;
import com.asiainfo.crm.cm.busimodel.impl.customer.AbstractCustomerQueryBusiModelImpl;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.CmxConstants;
import com.asiainfo.crm.cm.common.bo.BOCmPartyRoleBean;
import com.asiainfo.crm.cm.common.bo.BOCmPsPublicDealBean;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPartyRoleValue;
import com.asiainfo.crm.cm.common.ivalues.IBOCmPsPublicDealValue;
import com.asiainfo.crm.cm.common.service.interfaces.IAddressSV;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.common.util.DataContainerUtils;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.customer.group.ivalues.IBOCmGroupRelIndustryValue;
import com.asiainfo.crm.cm.customer.group.ivalues.IBoCmCustSegmentValue;
import com.asiainfo.crm.cm.customer.group.service.interfaces.ICmCustSegmentSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV;
import com.asiainfo.crm.cm.inner.customer.bo.*;
import com.asiainfo.crm.cm.inner.customer.ivalues.*;
import com.asiainfo.crm.cm.inner.customer.service.interfaces.ICmCustSegmentRelaSV;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;
import com.asiainfo.crm.cm.ln.common.util.CmLnConstants;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bean.VOPartyBean;
import com.asiainfo.crm.cm.model.bo.CustRelationshipBean;
import com.asiainfo.crm.cm.model.bo.CustomerBean;
import com.asiainfo.crm.cm.model.ivalues.*;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.ICmGroupContractSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartyRoleSV;
import com.asiainfo.crm.cm.service.interfaces.ICmPartySV;
import com.asiainfo.crm.cm.support.bce.util.CmBceSupportConstants;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICmTeamInvokeSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICmInterfaceSV;
import com.asiainfo.crm.cm.vo.GroupMemberVo;
import com.asiainfo.crm.cm.vo.MapList;
import com.asiainfo.crm.so.query.ivalues.IQUserBaseInfoValue;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmF2SV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;

@Slf4j
public class GroupCustomerBFImpl {
    // modify kangzk 添加网内网外成员规则
    public Map saveLnGroupMember(GroupMemberVo infos) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (infos == null || infos.getIndivCustomerBean() == null || infos.getIndivCustomerBean().isEmpty()) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                DataContainerInterface indivCustDC = getOldAndNewContainer(infos.getIndivCustomerBean(), infos.getOldIndivCustomerBean());

                IBOCmIndivCustomerValue indivCust = new BOCmIndivCustomerBean();
                indivCust.copy(indivCustDC);
                indivCust.setIndivCustType(String.valueOf(CmConstants.EntityType.CUSTOMER));
                DataContainerInterface groupMemberDC =  getOldAndNewContainer(infos.getGroupMemberBean(), infos.getOldGroupMemberBean());
                IBOCmGroupMemberValue groupMember = new BOCmGroupMemberBean();
                groupMember.copy(groupMemberDC);
                groupMember.setFirstName(indivCust.getFirstName());
                groupMember.setLastName(indivCust.getLastName());
                groupMember.setMemberName(indivCust.getCustName());
                DataContainerInterface indivContInfoDC =getOldAndNewContainer(infos.getCmxIndivCustomerBean(), infos.getOldCmxIndivCustomerBean());

                IBOCmxIndivCustomerValue LnCmxIndivCustomerBean = new BOCmxIndivCustomerBean();
                LnCmxIndivCustomerBean.copy(indivContInfoDC);
                // 赋值
                indivCust.setRealNameFlag(CmConstants.realNameFlag.NOT_REAL_NAME);
                String regionId = indivCust.getRegionId();
                if (StringUtils.isBlank(regionId)) {
                    regionId = CmCommonUtil.getDefaultRegionId();
                }
                indivCust.setRegionId(regionId);
                groupMember.setCustRegionId(regionId);

                IVOCustValue custValue = new VOCustBean();
                ICustomerValue customerValue = new CustomerBean();
                // 网外成员设置为匿名客户状态为潜在
                if (groupMember.getMemberType() == CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_OUT) {
                    customerValue.setAnonymousFlag(1);
                    indivCust.setCustStatus(CmConstants.CustomerStatus.INDIV_POTENTIAL);
                }
                customerValue.copy(indivCust);
                if (groupMember.isNew()) {
                    // 判断成员是否已经存在
                    DataContainer condition = new DataContainer();
                    condition.set(IGroupMemberValue.S_BillId, groupMember.getBillId());
                    condition.set(IGroupMemberValue.S_State, CmConstants.RecordState.USE);
                    condition.set(IGroupMemberValue.S_MemberType, groupMember.getMemberType());
                    IGroupMemberValue[] groupMembers = CmServiceFactory.getCustomerSV().queryGroupMembers(condition, -1, -1);
                    if (CmCommonUtil.isNotEmptyObject(groupMembers)) {
                        // 该客户已经加入了一个集团！
                        // 根据集团编码查找集团客户信息 add by guansj
                        DataContainer queryDC = new DataContainer();
                        queryDC.set(ICustomerValue.S_CustId, groupMembers[0].getCustId());
                        queryDC.set(ICustomerValue.S_CustType, CmConstants.CustomerType.GROUP);
                        ICustomerValue[] groupValues = CmServiceFactory.getCustomerSV().queryCustomers(queryDC, -1, -1);
                        String custServiceId = groupValues[0].getCustServiceId();
                        String custName = groupValues[0].getCustName();

                        ICmInterfaceSV interfaceSV = (ICmInterfaceSV) ServiceFactory.getService(ICmInterfaceSV.class);
                        Map map = interfaceSV.queryCustotmerByCustIdOrGroupId(Long.valueOf(groupMembers[0].getCustId()), "");
                        Map mangerMap = (Map) map.get("Linkmaninfo");
                        String mangerName = StringUtils.EMPTY;
                        String phoneNumber = StringUtils.EMPTY;
                        if (mangerMap != null) {
                            mangerName = (String) mangerMap.get("ManagerName");
                            phoneNumber = (String) mangerMap.get("PhoneNum");
                        }
                        String[] astr = new String[] { custName, custServiceId, mangerName, phoneNumber };
                        // 根据集团编码查找集团客户信息 add by guansj 原Exception内编码CMS5000138
                        ExceptionUtil.throwBusinessException("CMS0013060", astr);
                    }
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_NEW);
                    customerValue.initProperty(ICustomerValue.S_CustType, CmConstants.CustomerType.INDIVIDUAL);
                    // 网外才设置为新增
                    if (groupMember.getMemberType() == CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_OUT) {
                        customerValue.setStsToNew();
                        // 新增网外成员插入cpr订购工单
                        ICmCustRequestTaskSV requestTaskSV = (ICmCustRequestTaskSV) ServiceFactory.getService(ICmCustRequestTaskSV.class);
                        requestTaskSV.saveCustRequestTaskInfo(indivCust.getCustId(), 4, "C");

                    } else {
                        customerValue.initProperty(ICustomerValue.S_RegionId, customerValue.getRegionId());
                    }
                } else if (groupMember.isModified()) {
                    customerValue.initProperty(ICustomerValue.S_RegionId, customerValue.getRegionId());
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_MODIFY);
                    customerValue.initProperty(ICustomerValue.S_CustType, CmConstants.CustomerType.INDIVIDUAL);

                    // 如果是修改，需要插入工单表，同步客户信息
                    ICmCustRequestTaskSV requestTaskSV = (ICmCustRequestTaskSV) ServiceFactory.getService(ICmCustRequestTaskSV.class);
                    IBOCmPsPublicDealValue psPublicDealValue = new BOCmPsPublicDealBean();
                    psPublicDealValue.setEntityId(indivCust.getCustId());
                    psPublicDealValue.setPartyId(customerValue.getPartyId());
                    psPublicDealValue.setEntityType(CmConstants.EntityType.EMPLOYEE);
                    psPublicDealValue.setExecAction(CmConstants.PsPublicAction.PUBLIC_INFO_SYS);
                    requestTaskSV.savePublicWordOrder(psPublicDealValue);
                } else {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_DEL);
                }
                customerValue.setCustType(CmConstants.CustomerType.INDIVIDUAL);
                if (groupMember.getMemberType() == CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_OUT) {
                    custValue.setCustomer(customerValue);
                    custValue.setUserObject(CmBceSupportConstants.CmDefaultCodeValue.codeValueCmxIndivCustomer, LnCmxIndivCustomerBean);
                } else {
                    ICmPartyRoleSV partyRoleSV = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                    BOCmPartyRoleBean partyRoleBean = new BOCmPartyRoleBean();
                    partyRoleBean.setRoleType(CmConstants.PartyRoleType.EMPLOYEE);
                    partyRoleBean.setRoleStatus(CmConstants.roleStatus.ACTIVE);
                    partyRoleBean.setPartyRoleId(CmCommonUtil.getNewSequence(BOCmPartyRoleBean.class));
                    partyRoleBean.setEntityId(customerValue.getCustId());
                    partyRoleBean.setState(CmConstants.RecordState.USE);
                    partyRoleBean.setPartyId(customerValue.getPartyId());
                    partyRoleBean.setRegionId(CmCommonUtil.getDefaultRegionId());
                    partyRoleBean.setCreateOpId(ServiceManager.getUser().getID());
                    partyRoleBean.setCreateOrgId(ServiceManager.getUser().getOrgId());
                    partyRoleSV.savePartyRole(partyRoleBean);
                }
                ICustRelationshipValue relationshipValue = new CustRelationshipBean();
                relationshipValue.copy(groupMember);
                relationshipValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                custValue.addCustRel(relationshipValue);
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_MEMBER);
                CmServiceFactory.getCustomerSV().saveCustomer(custValue);
                retMsg = CrmLocaleFactory.getResource("CMS0076045");
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveLnGroupMember exception.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    private DataContainerInterface getOldAndNewContainer(Map newData,Map oldData) {
        DataContainerInterface indivCustDC =null;
        if(oldData!=null && !oldData.isEmpty()){
            DataContainer oldindivCustDC = DataContainerUtils.wrap1(oldData);
            oldindivCustDC.setStsToOld();
            DataContainerUtils.setFontMap(oldindivCustDC,DataContainerUtils.wrap1(newData));
            indivCustDC=oldindivCustDC;
        }else{
            indivCustDC= DataContainerUtils.wrap1(newData);
        }
        return indivCustDC;
    }

    /**
     * 集团成员分为网内网外成员
     * 网外成员分为4种
     * 1不存在partyId从cpr系统查询出来 (from cpr)
     * 2存在partyId，已经有客户角色，即已经有custId (from indiv)
     * 3存在partyId，没有客户角色，没有custId (from party)
     * 4用户自己输入(from operator)
     * 但是无论如何都会前台都会传custId
     * @throws Exception
     */
    public Map savetelnorGroupMember(String memberFrom,long memberPartyId,GroupMemberVo infos) throws Exception {
        Map cp = new HashMap();
        String retVal = "Y";
        String retMsg = "success";
        try {
            if (infos == null || infos.getIndivCustomerBean() == null || infos.getIndivCustomerBean().isEmpty()) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                IVOCustValue voCustValue = new VOCustBean();
                // 获取三张表单
                // 个人客户信息
                DataContainerInterface indivCustDC = DataContainerUtils.wrap1(infos.getIndivCustomerBean());
                IBOCmIndivCustomerValue boIndivCustValue = new BOCmIndivCustomerBean();
                boIndivCustValue.copy(indivCustDC);
                // 设置客户状态为潜在匿名
                boIndivCustValue.setAnonymousFlag(1);
                boIndivCustValue.setCustStatus(CmConstants.CustomerStatus.INDIV_POTENTIAL);
                boIndivCustValue.setRealNameFlag(CmConstants.realNameFlag.NOT_REAL_NAME);
                // 设置客户子类型
                boIndivCustValue.setIndivCustType(String.valueOf(CmConstants.CustSubType.INDIV_EMPLOYEE));
                boIndivCustValue.setCustCertType(8);
                boIndivCustValue.setRegionId(CmCommonUtil.getDefaultRegionId());
                ICustomerValue customerValue = new CustomerBean();
                customerValue.copy(boIndivCustValue);
                customerValue.setCustType(1);
                voCustValue.setCustomer(customerValue);
                // 成员关系信息
                DataContainerInterface groupMemberDC = DataContainerUtils.wrap1(infos.getGroupMemberBean());
                IBOCmGroupMemberValue boGroupMemberValue = new BOCmGroupMemberBean();
                boGroupMemberValue.copy(groupMemberDC);
                boGroupMemberValue.setFirstName(boIndivCustValue.getFirstName());
                boGroupMemberValue.setLastName(boIndivCustValue.getLastName());
                boGroupMemberValue.setMemberName(boIndivCustValue.getFirstName() + " " + boIndivCustValue.getLastName());
                boGroupMemberValue.setCustRegionId(CmCommonUtil.getDefaultRegionId());
                boGroupMemberValue.setMemberCustId(boIndivCustValue.getCustId());
                boGroupMemberValue.setCustRelId(CmCommonUtil.getNewSequence(BOCmGroupMemberBean.class));
                boGroupMemberValue.setRegionId(CmCommonUtil.getDefaultRegionId());
                boGroupMemberValue.setState("U");
                // 校验
                // 2是否已经是一个成员
                ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                IBOCmIndivCustomerValue value = customerSV.queryIndivCustomerInfo(boIndivCustValue.getCustId());

                if (value != null) {
                    ICmPartyRoleSV partyRoleSv = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                    IBOCmPartyRoleValue[] partyRoleValue = partyRoleSv.queryPartyRole(value.getPartyId(), CmConstants.PartyRoleType.EMPLOYEE, -1, -1);
                    if (partyRoleValue != null && partyRoleValue.length > 0) {
                        retVal="N";
                        retMsg="The Customer Has Already Belongs To A Group!";
                        // 已经是一个成员
                        cp.put("retVal","N");
                        cp.put("retMsg","The Customer Has Already Belongs To A Group!");
                        return cp;
                    }
                }
                // 如果是网内成员或者是选择客户作为成员则只需要插角色表和成员关系表
                if (boGroupMemberValue.getMemberType() == CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_IN || "indiv".equals(memberFrom)) {
                    // 保存关系信息
                    // 成员插角色表
                    ICmPartyRoleSV partyRoleSV = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                    BOCmPartyRoleBean partyRoleBean = new BOCmPartyRoleBean();
                    partyRoleBean.setRoleType(CmConstants.PartyRoleType.EMPLOYEE);
                    partyRoleBean.setRoleStatus(CmConstants.roleStatus.ACTIVE);
                    partyRoleBean.setPartyRoleId(CmCommonUtil.getNewSequence(BOCmPartyRoleBean.class));
                    partyRoleBean.setEntityId(boIndivCustValue.getCustId());
                    partyRoleBean.setState(CmConstants.RecordState.USE);
                    partyRoleBean.setPartyId(boIndivCustValue.getPartyId());
                    if (memberPartyId != -1) {
                        partyRoleBean.setPartyId(memberPartyId);
                    }
                    partyRoleBean.setRegionId(CmCommonUtil.getDefaultRegionId());
                    partyRoleBean.setCreateOpId(ServiceManager.getUser().getID());
                    partyRoleBean.setCreateOrgId(ServiceManager.getUser().getOrgId());
                    partyRoleSV.savePartyRoleInfo(partyRoleBean);
                    CmInnerServiceFactory.getCommonInnerSV().saveBean((BOCmGroupMemberBean) boGroupMemberValue);
                    cp.put("retVal",retVal);
                    cp.put("retMsg",retMsg);
                    return cp;
                }

                // 1是否为潜在客户
                if (value != null && value.getCustStatus() != CmConstants.CustomerStatus.INDIV_POTENTIAL) {
                    retVal = "N";
                    retMsg = "The Customer Status Is Not POTENTIAL,Please Add As ON Line Member!";
                    cp.put("retVal",retVal);
                    cp.put("retMsg",retMsg);
                    return cp;
                }
                // 处理party
                if (memberPartyId != -1) {
                    // 成员插角色表
                    ICmPartyRoleSV partyRoleSV = (ICmPartyRoleSV) ServiceFactory.getService(ICmPartyRoleSV.class);
                    BOCmPartyRoleBean partyRoleBean = new BOCmPartyRoleBean();
                    partyRoleBean.setRoleType(CmConstants.PartyRoleType.EMPLOYEE);
                    partyRoleBean.setRoleStatus(CmConstants.roleStatus.ACTIVE);
                    partyRoleBean.setPartyRoleId(CmCommonUtil.getNewSequence(BOCmPartyRoleBean.class));
                    partyRoleBean.setEntityId(boIndivCustValue.getCustId());
                    partyRoleBean.setState(CmConstants.RecordState.USE);
                    partyRoleBean.setPartyId(boIndivCustValue.getPartyId());
                    partyRoleBean.setRegionId(CmCommonUtil.getDefaultRegionId());
                    partyRoleBean.setCreateOpId(ServiceManager.getUser().getID());
                    partyRoleBean.setCreateOrgId(ServiceManager.getUser().getOrgId());
                    ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                    voCustValue.getCustomer().setPartyId(memberPartyId);
                    partyRoleBean.setPartyId(memberPartyId);
                    IVOPartyValue voPartyValue = new VOPartyBean();
                    voPartyValue.setParty(partySV.queryPartyById(memberPartyId));
                    voCustValue.setParty(voPartyValue);
                    partyRoleSV.savePartyRoleInfo(partyRoleBean);
                    voCustValue.setParty(voPartyValue);
                }

                ICustRelationshipValue relationshipValue = new CustRelationshipBean();
                relationshipValue.copy(boGroupMemberValue);
                relationshipValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                voCustValue.addCustRel(relationshipValue);
                // 扩展信息
                DataContainerInterface indivEXInfoDC = DataContainerUtils.wrap1(infos.getCmxIndivCustomerBean());
                IBOCmxIndivCustomerValue BoCmxIndivCustomerBean = new BOCmxIndivCustomerBean();
                BoCmxIndivCustomerBean.copy(indivEXInfoDC);
                BoCmxIndivCustomerBean.setRegionId(CmCommonUtil.getDefaultRegionId());
                voCustValue.setUserObject(CmBceSupportConstants.CmDefaultCodeValue.codeValueCmxIndivCustomer, BoCmxIndivCustomerBean);
                voCustValue.setBusinessId(CmConstants.BusiLogId.GROUP_MEMBER);
                CmServiceFactory.getCustomerSV().saveCustomer(voCustValue);
                cp.put("custId", String.valueOf(voCustValue.getCustomer().getCustId()));
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("savetelnorGroupMember exception.", e);
            }
            retVal = "N";
            retMsg = e.getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map getCustKyePeopGrad(long custId) throws Exception {
        Map cp = new HashMap();
        int retVal = CmLnConstants.GroupKeyPeop.LEVEL_1;
        String retRegionId = "";
        try {
            if (custId < 0) {
                ExceptionUtil.throwBusinessException("CMS0000198");// 客户信息不能为空
            }
            ICmCustomerSV cmCust = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            ICustomerValue custValue = cmCust.queryCustomerByCustId(custId);
            if (CmCommonUtil.isEmptyObject(custValue)) {
                ExceptionUtil.throwBusinessException("CMS0000201");// 客户信息不存在
            }
            int custLevel = custValue.getCustServiceLevel();
            retRegionId = custValue.getRegionId();
            switch (custLevel) {
                case CmLnConstants.GroupLevel.LEVEL_INT_l1:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_3;
                    break;
                case CmLnConstants.GroupLevel.LEVEL_INT_l2:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_3;
                    break;
                case CmLnConstants.GroupLevel.LEVEL_INT_21:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_4;
                    break;
                case CmLnConstants.GroupLevel.LEVEL_INT_22:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_4;
                    break;
                case CmLnConstants.GroupLevel.LEVEL_INT_30:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_5;
                    break;
                default:
                    retVal = CmLnConstants.GroupKeyPeop.LEVEL_1;
                    break;
            }
        } catch (Exception e) {
            log.error("",e);
        } finally {
            cp.put("retVal", String.valueOf(retVal));
            cp.put("retGegionId", retRegionId);
        }
        return cp;
    }

    public Map queryCustByBillId(String billId) throws Exception {
        Map cp = new HashMap();
        String partyId = "";
        String retBrand = "";
        String userId = "";
        String regionId = "";
        String custId = "";
        try {
            CenterFactory.setCenterInfoByTypeAndValue(CmConstants.CenterType.BILL_ID, billId);
            ICmTeamInvokeSV teamInvokeSV = (ICmTeamInvokeSV) ServiceFactory.getService(ICmTeamInvokeSV.class);
            IQUserBaseInfoValue userBaseInfo = teamInvokeSV.getUserBaseInfoByBillId(billId);
            if (userBaseInfo != null) {
                retBrand = userBaseInfo.getBrandIdDesc();
                userId = String.valueOf(userBaseInfo.getUserId());
                regionId = userBaseInfo.getRegionId();
                custId = String.valueOf(userBaseInfo.getCustId());
            }
        } catch (Exception e) {
            log.error("",e);
        } finally {
            cp.put("retVal", partyId);
            cp.put("retBrand", retBrand);
            cp.put("retUserId", userId);
            cp.put("regionId", regionId);
            cp.put("retCustId", custId);
        }
        return cp;
    }

    /**
     * 查询地址信息
     * @Function queryAddressInfo
     * @Description
     *
     * @throws Exception
     *
     * @version v1.0.0
     * @author huangqun
     * @date 2015-5-03 上午09:19:12
     *
     * <strong>Modification History:</strong><br>
     * Date         Author          Version            Description<br>
     * ---------------------------------------------------------<br>
     * 2015-5-03    huangqun         v1.0.0               修改原因<br>
     */
    public Map<String,String> queryAddressInfo(long custId) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        try {
            if (custId > 0) {
                ICmCustomerSV custSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                IAddressSV addressSV = (IAddressSV) ServiceFactory.getService(IAddressSV.class);
                IBOCmCustContactMediumValue value = custSV.queryCustContactMediumByCustIdAndType(custId, String.valueOf(CmConstants.AddressId.legalAddress));
                if (CmCommonUtil.isNotEmptyObject(value)) {
                    address address = addressSV.getAddressInfo(value.getAddressId(), "012002002");
                    if (null != address) {
                        cp.put("zipCode", address.getZipcode());
                        cp.put("cityName", address.getCity());
                        cp.put("address", address.getAddrDesc());
                    }
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage(), e);
            cp.put("retFlag", "N");
            cp.put("retMsg", e.getMessage());
        }
        return cp;
    }

    public ICustomerValue[] queryCustomersXml(MapList condition, int startNum, int endNum) throws Exception {
        DataContainer[] dcs = DataContainerUtils.wrap1(condition);
        formatCondition(dcs);
        if (CmCommonUtil.isNotEmptyObject(dcs)) {
            if (dcs[0].getAsInt(ICustomerValue.S_CustType) == CmConstants.CustomerType.INDIVIDUAL) {
                dcs[0].set("MATCH_TYPE", Integer.valueOf(CmConstants.MatchType.BOTH_MATCH));
            } else {
                dcs[0].set("MATCH_TYPE", Integer.valueOf(CmConstants.MatchType.BOTH_MATCH));
            }
        }
        ICustomerValue[] results = (ICustomerValue[]) ((AbstractCustomerQueryBusiModelImpl) CmServiceFactory.getBusiMode(AbstractCustomerQueryBusiModelImpl.class)).queryData(dcs,
                startNum, endNum);
        if (!CmCommonUtil.isNotEmptyObject(results)) {
            return new ICustomerValue[0];
        }
        long[] custIds = new long[results.length];
        HashMap retMap = new HashMap();
        int custType = results[0].getCustType();
        ICmCustomerSV svc = (ICmCustomerSV)ServiceFactory.getService(ICmCustomerSV.class);
        for (int i = 0; i < results.length; i++) {
            custIds[i] = results[i].getCustId();
            retMap.put(custIds[i], results[i]);
            // 修改界面的展示字段：行业VOCATION、客户地址CUST_ADDRESS、客户层级 CUST_SEGMENT
            IBOCmGroupRelIndustryValue[] industrys = svc.queryGroupIndustryForPage(custIds[i], -1, -1);
            if (CmCommonUtil.isNotEmptyObject(industrys)) {
                results[i].setVocationDesc(industrys[0].getIndustryId());
            }
            // 法律地址
            IQBOCmCustContMediumAndTypeValue[] mediums = svc.queryCustContactMediumsForPage(custIds[i], CmConstants.AddressId.legalAddress, 1, -1, -1);
            if (CmCommonUtil.isNotEmptyObject(mediums)) {
                results[i].setCustAddress(mediums[0].getAddressDetail());
            }
            // 客户层级
            IBOCmCustSegmentRelaValue segmentRela = ((ICmCustSegmentRelaSV) ServiceFactory.getService(ICmCustSegmentRelaSV.class)).querySegmentRelaByCustId(custIds[i]);
            if (CmCommonUtil.isNotEmptyObject(segmentRela)) {
                IBoCmCustSegmentValue segment = ((ICmCustSegmentSV) ServiceFactory.getService(ICmCustSegmentSV.class)).querySegmentByIdfromCache(segmentRela.getSegmentId());
                results[i].setSegmentName(segment.getSegmentName());
            }
            // 对于客户如果first_name为"$$$$",则影藏客户名称
            if ("$$$$".equals(results[i].getFirstName())) {
                results[i].setDiaplayAttr("CUST_NAME", "DIS_CUST_NAME", " ");
            }
        }
        Map condMap = ParamUtil.transferDataContainersToMap(dcs);
        ICustManagerValue[] custManagerValues = null;
        if (condMap.containsKey(ICustomerValue.S_State) && CmConstants.RecordState.ERASE.equalsIgnoreCase(DataType.getAsString(condMap.get(ICustomerValue.S_State)))) {
            custManagerValues = svc.queryCustManagersByCustIds(custIds, custType, CmConstants.RecordState.ERASE, startNum, endNum);
        } else {
            custManagerValues = svc.queryCustManagersByCustIds(custIds, custType, -1, -1);
        }
        if (CmCommonUtil.isNotEmptyObject(custManagerValues)) {
            for (int i = 0; i < custManagerValues.length; i++) {
                ICustomerValue customerValue = (ICustomerValue) retMap.get(custManagerValues[i].getCustId());
                customerValue.initProperty("MANAGER_NAME", custManagerValues[i].getStaffName());
                customerValue.initProperty("MANAGER_ID", custManagerValues[i].getManagerId());
            }
        }
        for (int i = 0; i < results.length; i++) {
            if (results[i].getCustType() == 3) {
                String kobNumber = results[i].getCustCertCode();
                if (StringUtils.isNotBlank(kobNumber)) {
                    // 判断是否为外国集团
                    if (kobNumber.indexOf("K") < 0) {
                        long kobNumberLocal = DataType.getAsLong(kobNumber);
                        results[i].setDiaplayAttr("CUST_CERT_CODE", "CUST_CERT_CODE_NAME", kobNumberLocal);
                    } else {
                        results[i].setDiaplayAttr("CUST_CERT_CODE", "CUST_CERT_CODE_NAME", " ");
                    }
                }
            }

        }

        return results;
    }

    public int queryCustomerXmlCount(MapList condition) throws Exception {
        int count = 0;
        DataContainer[] dcs = DataContainerUtils.wrap1(condition);
        formatCondition(dcs);
        // 修改数据大造成的内存溢出
        if (CmCommonUtil.isNotEmptyObject(dcs)) {
            dcs[0].set("MATCH_TYPE", Integer.valueOf(CmConstants.MatchType.BOTH_MATCH));
            ICmCustomerSV svc = (ICmCustomerSV)ServiceFactory.getService(ICmCustomerSV.class);
            count = svc.queryCustomerCount(dcs[0]);
        }
        return count;
    }

    private void formatCondition(DataContainer[] dcs) {
        if(CmCommonUtil.isNotEmptyObject(dcs) && dcs[0].get("CUST_ID") == null){
            dcs[0].set("CUST_ID", -1);
        }
    }

    public Map<String,String> showContId(long partyId) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "Y");
        cp.put("retMsg", "");
        try {
            ICmPartySV service = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            long contId = service.queryPartyContactByPartyId(partyId);
            cp.put("retMsg", contId + "");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("showContId exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String,String> deleteContactContMedium(long contRelaId,long regionId) throws Exception {
        Map<String,String> cp = new HashMap<>();
        String retMsg = "";
        try {
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            long partyId = 0;
            IBOCmContactMediumRelValue[] values = customerSV.queryContactMediumRel(0, contRelaId);
            if (null != values && values.length > 0) {
                ExceptionUtil.throwBusinessException("CMS0011891");
            }
            com.asiainfo.crm.cm.hu.customer.service.interfaces.ICmContactSV contactSV = (com.asiainfo.crm.cm.hu.customer.service.interfaces.ICmContactSV) ServiceFactory.getService(com.asiainfo.crm.cm.hu.customer.service.interfaces.ICmContactSV.class);
            IBOCmContactContMediumPojoValue contactMediumValue = contactSV.queryContMediumById(contRelaId);
            if(0==partyId&&null!=contactMediumValue&&contactMediumValue.getContId()>0){
                ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                IPartyContactValue partyContactValue = partySV.queryPartyContactById(contactMediumValue.getContId());
                if(partyContactValue!=null){
                    partyId = partyContactValue.getPartyId();
                }
            }
            BOCmContactContMediumPojoBean bean = new BOCmContactContMediumPojoBean();
            bean.copy(contactMediumValue);
            bean.setStsToOld();
            bean.delete();
            customerSV.saveContactContMedium(new BOCmContactContMediumPojoBean[] { bean });
            if(partyId>0){
                //删除后，送billing
                customerSV.sendPayerAddressToBilling(partyId, true);
            }

            cp.put("retFlag", "Y");
            // 删除地址成功。
            cp.put("retVal", CrmLocaleFactory.getResource("CMS0013241"));
        } catch (Exception e) {
            cp.put("retFlag", "N");
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013242"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0013242", (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
            cp.put("retVal", retMsg);
        }
        return cp;
    }

    public Map<String,String> saveContactContMedium( String contId, String partyId,MapList contactContMedium) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "N");
        String regex = "\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}";
        String regex1 = "[0-9]+";
        try {
            if (contactContMedium==null||contactContMedium.getData()==null||contactContMedium.getData().size() == 0) {
                ExceptionUtil.throwBusinessException("CMS9988748");
            }

            List<BOCmContactContMediumPojoBean> list2 = new ArrayList<BOCmContactContMediumPojoBean>();
            ICmCustomerSV service = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            DataContainerInterface[] container = DataContainerUtils.wrap1(contactContMedium);
            BOCmContactContMediumPojoBean bean2 = null;
            if (1 < container.length) {
                for (int i = 0; i < container.length - 1; i++) {
                    for (int j = i + 1; j < container.length; j++) {
                        if (container[i].getAsLong("CONT_MED_TYPE_NAME") == container[j].getAsLong("CONT_MED_TYPE_NAME")) {
                            if (container[i].getAsInt("PRIORITY") == container[j].getAsInt("PRIORITY")) {
                                // 优先级重复
                                ExceptionUtil.throwBusinessException("CMS0013245");
                                break;
                            }
                        }
                    }
                }
            }
            for (int i = 0; i < container.length; i++) {
                if (container[i].getAsString("CONT_MED_TYPE_NAME") == null) {
                    // 联系类型为空
                    ExceptionUtil.throwBusinessException("CMS0013244");
                }
                if (container[i].getAsString("EMAIL_ADDRESS") == null) {
                    // 联系信息为空
                    ExceptionUtil.throwBusinessException("CMS0013239");
                }
                if (container[i].getAsString("CONT_MED_TYPE_NAME").startsWith("2") && !container[i].getAsString("EMAIL_ADDRESS").matches(regex)) {
                    ExceptionUtil.throwBusinessException("CMS9988762");
                }
                if (container[i].getAsString("CONT_MED_TYPE_NAME").startsWith("3") && !container[i].getAsString("EMAIL_ADDRESS").matches(regex1)
                        && !"36".equals(container[i].getAsString("CONT_MED_TYPE_NAME"))) {
                    ExceptionUtil.throwBusinessException("CMS9988763");
                }

                //CR 57增加校验
                if(container[i].getAsString("CONT_MED_TYPE_NAME").startsWith("2")){
                    ICrmFSV crmFsv = (ICrmFSV)ServiceFactory.getService(ICrmFSV.class);
                    boolean flag = crmFsv.queryMail(container[i].getAsString("EMAIL_ADDRESS"));
                    if(!flag){
                        ExceptionUtil.throwBusinessException("CMS9988762");
                    }
                }

                int priority = container[i].getAsInt("PRIORITY");
                long medType = container[i].getAsLong("CONT_MED_TYPE_NAME");

                // 联系人联系媒介关系
                bean2 = new BOCmContactContMediumPojoBean();

                long contRelaId = 0;
                if (!StringUtils.isBlank(container[i].getAsString("CONT_RELA_ID"))) {// 做修改处理
                    IBOCmContactContMediumPojoValue[] prioritys = service.queryPriority(medType, priority, DataType.getAsLong(contId));
                    if (null != prioritys && prioritys.length > 0) {
                        for (int k = 0; k < prioritys.length; k++) {
                            if (prioritys[k].getContRelaId() == container[i].getAsLong("CONT_RELA_ID")) {
                                continue;
                            } else {
                                // 优先级重复
                                ExceptionUtil.throwBusinessException("CMS0013245");
                            }
                        }
                    }
                    contRelaId = DataType.getAsLong(container[i].getAsString("CONT_RELA_ID"));
                    bean2.copy(container[i]);
                    bean2.setStsToOld();
                } else {
                    IBOCmContactContMediumPojoValue[] prioritys = service.queryPriority(medType, priority, DataType.getAsLong(contId));
                    if (null != prioritys && prioritys.length > 0) {
                        // 优先级重复
                        ExceptionUtil.throwBusinessException("CMS0013245");
                    }
                    contRelaId = CmCommonUtil.getNewSequence(BOCmContactContMediumPojoBean.class);
                    bean2.setContRelaId(contRelaId);
                    bean2.setContId(DataType.getAsLong(contId));
                    bean2.setState("U");
                    bean2.setRegionId(CmCommonUtil.getDefaultRegionId());
                }

                String type = container[i].getAsString("CONT_MED_TYPE_NAME");
                if (type.startsWith("2") || "36".equals(type)) {
                    bean2.setEmailAddress(container[i].getAsString("EMAIL_ADDRESS"));
                    if (!StringUtils.isBlank(container[i].getAsString("ADDRESS_CODE"))) {
                        bean2.setAddressId(DataType.getAsLong(container[i].getAsString("ADDRESS_CODE").trim()));
                    }
                } else {
                    bean2.setContNumber(container[i].getAsString("EMAIL_ADDRESS"));
                }
                bean2.setPriority(container[i].getAsInt("PRIORITY"));
                bean2.setContMedTypeId(container[i].getAsLong("CONT_MED_TYPE_NAME"));
                bean2.setIsNoDisturbing(container[i].getAsInt("IS_NO_DISTURBING"));
                bean2.setRemarks(container[i].getAsString("REMARKS"));
                list2.add(bean2);
            }
            // 保存联系人联系媒介关系
            service.saveContactContMedium(list2.toArray(new BOCmContactContMediumPojoBean[0]));
            if(null!=contId&&!"null".equalsIgnoreCase(contId)&&contId.length()>0){
                ICmPartySV partySV = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
                IPartyContactValue partyContactValue = partySV.queryPartyContactById(Long.parseLong(contId));
                if(null!=partyContactValue&&partyContactValue.getPartyId()>0){
                    //修改联系媒介后，送billing
                    service.sendPayerAddressToBilling(partyContactValue.getPartyId(), false);
                }
            }

            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveContactContMedium occur exception.", e);
            }
            cp.put("retMsg", (StringUtils.isBlank(e.getMessage()) || "null".equalsIgnoreCase(e.getMessage())) ?
                    "Can not operate" : e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String,String> validateGroupContact(long partyId,long custId,long contType) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            ICmPartySV service = (ICmPartySV) ServiceFactory.getService(ICmPartySV.class);
            IBOCmGroupContactValue[] values = service.queryGroupContactByCustIdAndPartyId(custId, partyId, contType);
            if (null != values && values.length > 0) {
                cp.put("retFlag", "Y");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("validateGroupContact exception.", e);
            }
            cp.put("retFlag", "N");
        }
        return cp;
    }

    public Map<String,String> saveDkGroupContactInfo(long contId, Map groupMember,Map partyContact,Map contact) throws Exception {
        Map<String,String> cp = new HashMap();
        cp.put("retFlag", "N");
        String retMsg = "";
        try {
            DataContainer groupMemberDC = DataContainerUtils.wrap1(groupMember);
            DataContainer dc2 = DataContainerUtils.wrap1(partyContact);
            DataContainer dc3 = DataContainerUtils.wrap1(contact);
            String custContIdTemp = groupMemberDC.getAsString("CUST_CONT_ID");
            String regionId = (String) groupMemberDC.get("REGION_ID");
            long priorLevel = groupMemberDC.getAsLong("PRIORY_LEVEL");
            long custContId = 0;
            if (null != custContIdTemp && !"".equals(custContIdTemp) && !"-1".equals(custContIdTemp)) {
                custContId = DataType.getAsLong(custContIdTemp);
            } else {
                custContId = contId;
            }
            ICmGroupContractSV sv = (ICmGroupContractSV) ServiceFactory.getService(ICmGroupContractSV.class);
            sv.saveDkCmGroupContact(dc2,dc3, groupMemberDC, regionId, priorLevel, custContId);
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveDkGroupContactInfo exception.", e);
            }
            cp.put("retFlag", "N");
            retMsg = e.getMessage();
        } finally {
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String,String> saveContact(long custContId, long contId,MapList groupMember,MapList party,MapList partyContact) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "N");
        String retMsg = "";
        try {
            DataContainerList groupMemberDCList = getDataContainerList(groupMember);
            DataContainerList partyDCList = getDataContainerList(party);
            DataContainer[] partyContactDC = DataContainerUtils.wrap1(partyContact);
            DataContainerList[] dcLists;
            if(partyContactDC.length>0){
                dcLists = new DataContainerList[3];
                dcLists[0] =  groupMemberDCList;
                dcLists[1] =  partyDCList;
                dcLists[2] =  getDataContainerList(partyContact);
            }else{
                dcLists = new DataContainerList[2];
                dcLists[0] =  groupMemberDCList;
                dcLists[1] =  partyDCList;
            }
            DataContainerInterface groupMemberDC = dcLists[0].getAllDataContainerInterface()[0];
            String flag = (String) groupMemberDC.get("FLAG");

            ICmGroupContractSV sv = (ICmGroupContractSV) ServiceFactory.getService(ICmGroupContractSV.class);
            if(StringUtils.equals(flag,"Y")){
                String regionId = (String) groupMemberDC.get("REGION_ID");
                long priorLevel = groupMemberDC.getAsLong("PRIORY_LEVEL");
                dcLists[1].getAllDataContainerInterface()[0].setStsToOld();
                dcLists[2].getAllDataContainerInterface()[0].setStsToOld();
                sv.saveDkCmGroupContact(dcLists[1].getAllDataContainerInterface()[0], dcLists[2].getAllDataContainerInterface()[0], groupMemberDC, regionId, priorLevel, custContId);
            }else {
                sv.saveGroupContact(custContId, contId, dcLists);
            }
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveContact exception.", e);
            }
            retMsg = e.getMessage();
        } finally {
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    private DataContainerList getDataContainerList(MapList party) {
        DataContainer partyDC =DataContainerUtils.wrap1(party.getData().get(0));
        if(party.getOldData()!=null && !party.getOldData().isEmpty()){
            DataContainer  oldParty =DataContainerUtils.wrap1(party.getOldData().get(0));
            oldParty.setStsToOld();
            DataContainerUtils.setFontMap(oldParty, partyDC);
            partyDC=oldParty;
        }
        DataContainerList partyDCList = new DataContainerList(null,new DataContainer[] { partyDC });
        return partyDCList;
    }

    private DataContainer transeDataContainer(DataContainer groupMemberDC) throws Exception{
        String actionType = groupMemberDC.getAsString("_ACTION");
        if(StringUtils.isNotBlank(actionType)){
            if(StringUtils.equals(actionType,"1")){
                groupMemberDC.clearProperty("_ACTION");
                groupMemberDC.setStsToNew();
            }else if(StringUtils.equals(actionType,"2")){
                groupMemberDC.setStsToOld();
            }else if(StringUtils.equals(actionType,"3")){
                groupMemberDC.delete();
            }
        }
        return groupMemberDC;
    }

    public Map<String,String> saveContactContMediumRel(long custContId, MapList info) throws Exception {
        Map<String,String> cp = new HashMap<>();
        cp.put("retFlag", "N");
        try {
            if (info==null||info.isEmpty()) {
                ExceptionUtil.throwBusinessException("CMS9988748");
            }
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            DataContainerInterface[] contactContMediumDC = DataContainerUtils.wrap1(info);
            if (null != contactContMediumDC && contactContMediumDC.length > 0) {
                List<BOCmContactMediumRelBean> mediuRelList = new ArrayList<BOCmContactMediumRelBean>();
                BOCmContactMediumRelBean mediuRel = null;
                for (int i = 0; i < contactContMediumDC.length; i++) {
                    mediuRel = new BOCmContactMediumRelBean();
                    if (!StringUtils.isBlank(contactContMediumDC[i].getAsString("RELA_ID"))) {// 做修改处理
                        mediuRel.copy(contactContMediumDC[i]);
                    } else {
                        mediuRel.setCustContId(custContId);
                        mediuRel.setRelaId(CmCommonUtil.getNewSequence(BOCmContactMediumRelBean.class));
                        mediuRel.setContRelaId(DataType.getAsLong(contactContMediumDC[i].getAsString("CONT_RELA_ID")));
                        mediuRel.setState(CmConstants.RecordState.USE);
                        IBOCmContactMediumRelValue[] values = customerSV.queryContactMediumRel(custContId, DataType.getAsLong(contactContMediumDC[i].getAsString("CONT_RELA_ID")));
                        if (values.length > 0) {
                            continue;
                        }
                    }
                    mediuRelList.add(mediuRel);
                }
                customerSV.saveContactMediumRel(mediuRelList.toArray(new BOCmContactMediumRelBean[0]));
            }
            cp.put("retFlag", "Y");
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("saveContactContMediumRel exception.", e);
            }
            cp.put("retMsg", e.getMessage());
            cp.put("retFlag", "N");
        }
        return cp;
    }

    /**
     * 按客户ID/客户名称/KOB/CVR查询集团客户。
     */
    public Map<String, Object> queryGroupCustomers(String custId, String custName, String kobNumber, String cvrNumber,String custType, long orderId,String startDate,String endDate,String billId,String cprNumber,int pageSize, int pageNum) throws Exception {
        Map<String, Object> result = new HashMap<>();
        IOrdCustValue ordCustValue=null;
        if(StringUtils.isNotBlank(custId)&&!StringUtils.isNumeric(custId)){
            ExceptionUtil.throwBusinessException(CrmLocaleFactory.getResource("ARS0020000"));
        }
        int total=0;
        if(orderId>0){
            IOrderQrySV orderQrySV = (IOrderQrySV) ServiceFactory.getService(IOrderQrySV.class);
             ordCustValue = orderQrySV.getOrdCustByCustOrderId(orderId);
            if(ordCustValue == null) {
                ICrmF2SV f2SV = (ICrmF2SV) ServiceFactory.getService(ICrmF2SV.class);
                ordCustValue= f2SV.findCustByOrderId(orderId,startDate,endDate);
            }
            if(ordCustValue == null){
                result.put("data",  new ArrayList<>());
                result.put("total", total);
                return result;
            }
        }
        if (ordCustValue!=null){
            custType=String.valueOf(CmCommonUtil.getCustType(ordCustValue.getCustId()));
            custId=String.valueOf(ordCustValue.getCustId());
        }
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);

            Map<String, String> params = new HashMap<>();
            params.put("CUST_TYPE", custType);
            if (StringUtils.equals(custType, "3"))
                params.put("MATCH_TYPE", String.valueOf(CmConstants.MatchType.RIGHT_MATCH));
            if (StringUtils.isNotBlank(custId) && Long.parseLong(custId.trim()) > 0) {
                params.put("CUST_ID", custId.trim());
            }
            if (StringUtils.isNotBlank(custName)) {
                params.put("CUST_NAME", custName.trim());
            }
            if (StringUtils.isNotBlank(kobNumber)) {
                params.put("CUST_CERT_CODE", kobNumber.trim());
                params.put("CUST_CERT_TYPE", String.valueOf(CmConstants.CustIdenType.KOB));
            }
            if (StringUtils.isNotBlank(cprNumber)) {
                params.put("CUST_CERT_CODE", cprNumber.trim());
                params.put("CUST_CERT_TYPE", String.valueOf(CmConstants.CustIdenType.CPR));
            }
            if (StringUtils.isNotBlank(cvrNumber)) {
                params.put("TAX_ID", cvrNumber.trim());
            }
            if (StringUtils.isNotBlank(billId)) {
                params.put("BILL_ID", billId.trim());
            }
            params.put("STATE", CmxConstants.RECORD_STATE_USE);
            String xmlComdition = ParamUtil.buildQueryXml("com.ai.appframe2.bo.DataContainer", params);

            int queryStart = pageSize;
            int queryEnd = pageNum;
            if (queryStart <= 0 || queryEnd <= 0 || queryEnd < queryStart) {
                queryStart = -1;
                queryEnd = -1;
            }

            total = customerSV.queryCustomerCount(xmlComdition);


            if (total <= 0) {
                result.put("data", new ArrayList<Map<String, Object>>());
                return result;
            }

        ICustomerValue[] customers = customerSV.queryCustomers(xmlComdition, queryStart, queryEnd);
        
        List<Map<String, Object>> list = new ArrayList<>();
        if (customers != null && customers.length > 0) {
            for (ICustomerValue customer : customers) {
                list.add(customer.getProperties());
            }
        }
        result.put("data", list);
        result.put("total", total);
        return result;
    }


}
