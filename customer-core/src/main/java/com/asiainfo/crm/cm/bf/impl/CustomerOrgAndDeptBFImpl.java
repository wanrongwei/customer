package com.asiainfo.crm.cm.bf.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataType;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.ivalues.IBOBsStaticDataValue;
import com.ai.common.util.CenterUtil;
import com.ai.common.util.ExceptionUtil;
import com.ai.common.util.StaticDataUtil;
import com.aie.api.tool.XmlParameters;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.dk.ivalues.IBOCmPsSegmentCalValue;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmCustRequestTaskSV;
import com.asiainfo.crm.cm.dk.service.interfaces.ICmDkCustomerSV;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmGroupOrgDifferBean;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmGroupOrgStructBean;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmCustRequestTaskValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmGroupOrgDifferValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmIndivCustomerValue;
import com.asiainfo.crm.cm.ln.common.util.CmLnConstants;
import com.asiainfo.crm.cm.model.bean.VOCustBean;
import com.asiainfo.crm.cm.model.bo.CustOrganizeBean;
import com.asiainfo.crm.cm.model.bo.CustRelationshipBean;
import com.asiainfo.crm.cm.model.ivalues.IContactValue;
import com.asiainfo.crm.cm.model.ivalues.ICustOrganizeValue;
import com.asiainfo.crm.cm.model.ivalues.ICustRelationshipValue;
import com.asiainfo.crm.cm.model.ivalues.ICustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IGroupMemberValue;
import com.asiainfo.crm.cm.model.ivalues.IVOCustValue;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.ICmDecitionMakerContactSV;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICmTeamInvokeSV;
import com.asiainfo.crm.cm.vo.CmCustMemberVO;
import com.asiainfo.crm.cm.vo.CmCustOrganizeVO;
import com.asiainfo.crm.cm.vo.SaveCustOrganizeVO;
import com.asiainfo.crm.cm.vo.SelectedCustDeptMemberVO;
import com.asiainfo.crm.cm.vo.TreeNodeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomerOrgAndDeptBFImpl {
    private static String DEPT_ICON = "/webframe/images/icon/mini131.gif";
    private static String CUST_ICON = "/webframe/images/ico_customer.gif";
    private static String CUST_CONTACT = "/webframe/images/contact.png";
    private static String CUST_DECITION = "/webframe/images/decition.png";
    private static final int MAX_DEPTH = 20;

    public TreeNodeVO getGroupOrgTree(long custId) {
        TreeNodeVO node = new TreeNodeVO();
        boolean isContact = false;
        boolean isDecition = false;
        IContactValue value = null;
        try {
            ICmDecitionMakerContactSV sv = (ICmDecitionMakerContactSV) ServiceFactory
                    .getService(ICmDecitionMakerContactSV.class);
            value = sv.queryDecitionMakerContact(custId, CmConstants.CONT_TYPE.CONT_TYPE_2);
            if (value != null) {
                isDecition = true;
            } else {
                value = sv.queryDecitionMakerContact(custId, CmConstants.CONT_TYPE.CONT_TYPE_1);
                if (value != null) {
                    isContact = true;
                }
            }
            // 查询组织结构
            ICustOrganizeValue custOrganizeValues = CmServiceFactory.getCustomerSV()
                    .queryCustOrganizeByRelCustId(custId);
            // 查询根节点组织结构
            ICustOrganizeValue custRootOrganizeValues = CmServiceFactory.getCustomerSV()
                    .queryCustOrgsByRelCustId(custId);
            String tempName = "";
            if (custOrganizeValues != null) {
                node.setLevel(1);
                if (custRootOrganizeValues != null) {
                    node.setValue(String.valueOf(custRootOrganizeValues.getDeptId()));
                    tempName = subStringAsByte(custRootOrganizeValues.getDeptName());
                    node.setUserObj(String.valueOf(custRootOrganizeValues.getCustId()));
                } else {
                    node.setValue(String.valueOf(custOrganizeValues.getDeptId()));
                    tempName = subStringAsByte(custOrganizeValues.getDeptName());
                    node.setUserObj(String.valueOf(custOrganizeValues.getRelCustId()));
                }
                node.setLabel(tempName);
                node.setTreeNodeId(String.valueOf(custOrganizeValues.getDeptId()));
                // 设置自定义的图标
                if (isDecition) {
                    node.setLeafPicUrl(CUST_DECITION);
                    node.setFoldOpenPicUrl(CUST_DECITION);
                    node.setFoldClosePicUrl(CUST_DECITION);
                } else if (isContact) {
                    node.setLeafPicUrl(CUST_CONTACT);
                    node.setFoldOpenPicUrl(CUST_CONTACT);
                    node.setFoldClosePicUrl(CUST_CONTACT);
                } else {
                    node.setLeafPicUrl(CUST_ICON);
                    node.setFoldOpenPicUrl(CUST_ICON);
                    node.setFoldClosePicUrl(CUST_ICON);
                }
            } else {
                ICustomerValue customerValue = CmServiceFactory.getCustomerSV().queryCustomerByCustId(custId);
                if (customerValue != null) {
                    node.setLevel(1);
                    node.setValue(String.valueOf(customerValue.getCustId()));
                    tempName = subStringAsByte(customerValue.getCustName());
                    node.setLabel(tempName);
                    node.setTreeNodeId(String.valueOf(customerValue.getCustId()));
                    node.setUserObj(String.valueOf(customerValue.getCustId()));
                    // 设置自定义的图标
                    if (isDecition) {
                        node.setLeafPicUrl(CUST_DECITION);
                        node.setFoldOpenPicUrl(CUST_DECITION);
                        node.setFoldClosePicUrl(CUST_DECITION);
                    } else if (isContact) {
                        node.setLeafPicUrl(CUST_CONTACT);
                        node.setFoldOpenPicUrl(CUST_CONTACT);
                        node.setFoldClosePicUrl(CUST_CONTACT);
                    } else {
                        node.setLeafPicUrl(CUST_ICON);
                        node.setFoldOpenPicUrl(CUST_ICON);
                        node.setFoldClosePicUrl(CUST_ICON);
                    }
                } else {
                    node.setValue("-1");
                    node.setTreeNodeId("-1");
                }
            }
            Set<Long> visitedDeptIds = new HashSet<Long>();
            getGroupOrgTreeChildren(node, visitedDeptIds);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error(e.getMessage(), e);
            }
        }
        return node;
    }

    private TreeNodeVO getGroupOrgTreeChildren(TreeNodeVO parentNode, Set<Long> visitedDeptIds) throws Exception {
        long parentDeptId = Long.parseLong(parentNode.getValue());
        // Prevent infinite recursion on bad/cyclic org data:
        // - If a deptId repeats, stop expanding this branch (do not throw).
        // - If depth exceeds limit, stop expanding.
        if (visitedDeptIds.contains(parentDeptId)) {
            if (log.isWarnEnabled()) {
                log.warn("getGroupOrgTreeChildren: cyclic deptId detected, stop expanding. deptId={}, custId(userObj)={}",
                        parentDeptId, parentNode.getUserObj());
            }
            parentNode.setLeaf(true);
            return parentNode;
        }
        visitedDeptIds.add(parentDeptId);
        if (parentNode.getLevel() >= MAX_DEPTH) {
            if (log.isWarnEnabled()) {
                log.warn("getGroupOrgTreeChildren: max depth reached, stop expanding. deptId={}, level={}",
                        parentDeptId, parentNode.getLevel());
            }
            parentNode.setLeaf(true);
            return parentNode;
        }

        ICustOrganizeValue[] custOrganizeValues = CmServiceFactory.getCustomerSV()
                .queryCustOrganizesByParentId(parentDeptId, -1, -1);
        String tempName = "";
        for (ICustOrganizeValue organizeValue : custOrganizeValues) {
            boolean isContact = false;
            boolean isDecition = false;
            TreeNodeVO node = new TreeNodeVO();
            node.setLevel(parentNode.getLevel() + 1);
            tempName = subStringAsByte(organizeValue.getDeptName());
            node.setLabel(tempName);
            node.setValue(String.valueOf(organizeValue.getDeptId()));
            node.setTreeNodeId(String.valueOf(organizeValue.getDeptId()));
            node.setParentNodeId(parentNode.getTreeNodeId());
            long relCustId = organizeValue.getRelCustId();
            node.setUserObj(String.valueOf(relCustId));

            // Defensive: if parent/child points to the same customer, stop expanding to avoid infinite loops
            // caused by bad org relationship data (e.g. CUST_ID == REL_CUST_ID).
            if (String.valueOf(relCustId).equals(parentNode.getUserObj())) {
                node.setLeaf(true);
            }

            if (organizeValue.getIsContactPoint() == 1) {
                isContact = true;
            }
            if (relCustId > 0) {
                if (isContact) {
                    node.setLeafPicUrl(CUST_DECITION);
                    node.setFoldOpenPicUrl(CUST_DECITION);
                    node.setFoldClosePicUrl(CUST_DECITION);
                } else if (isDecition) {
                    node.setLeafPicUrl(CUST_CONTACT);
                    node.setFoldOpenPicUrl(CUST_CONTACT);
                    node.setFoldClosePicUrl(CUST_CONTACT);
                } else {
                    node.setLeafPicUrl(CUST_ICON);
                    node.setFoldOpenPicUrl(CUST_ICON);
                    node.setFoldClosePicUrl(CUST_ICON);
                }

            } else {
                if (isContact) {
                    node.setLeafPicUrl(CUST_DECITION);
                    node.setFoldOpenPicUrl(CUST_DECITION);
                    node.setFoldClosePicUrl(CUST_DECITION);
                } else if (isDecition) {
                    node.setLeafPicUrl(CUST_CONTACT);
                    node.setFoldOpenPicUrl(CUST_CONTACT);
                    node.setFoldClosePicUrl(CUST_CONTACT);
                } else {
                    node.setLeafPicUrl(DEPT_ICON);
                    node.setFoldOpenPicUrl(DEPT_ICON);
                    node.setFoldClosePicUrl(DEPT_ICON);
                }
            }
            ICustOrganizeValue[] subCustOrganizeValues = CmServiceFactory.getCustomerSV()
                    .queryCustOrganizesByParentId(DataType.getAsLong(node.getTreeNodeId()), -1, -1);
            if (CmCommonUtil.isEmptyObject(subCustOrganizeValues)) {
                // 如果没有子节点，去除+号
                node.setLeaf(true);
            }
            parentNode.addChild(node);
            // Only expand non-leaf nodes; also avoid cycles defensively.
            if (!node.isLeaf()) {
                long childDeptId = DataType.getAsLong(node.getTreeNodeId());
                if (visitedDeptIds.contains(childDeptId)) {
                    if (log.isWarnEnabled()) {
                        log.warn("getGroupOrgTreeChildren: cyclic child deptId detected, skip expanding. childDeptId={}, childCustId(userObj)={}",
                                childDeptId, node.getUserObj());
                    }
                    node.setLeaf(true);
                } else {
                    getGroupOrgTreeChildren(node, visitedDeptIds);
                }
            }
        }
        return parentNode;
    }

    public TreeNodeVO getGroupDeptTree(long custId) throws Exception {
        TreeNodeVO rootNode = new TreeNodeVO();
        try {
            // 查询组织结构
            ICmDkCustomerSV dkCustomerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
            ICustOrganizeValue custOrganizeValue = dkCustomerSV.queryCustRootOrganize(custId);
            String tempName = "";
            if (custOrganizeValue != null) {
                rootNode.setLevel(1);
                rootNode.setValue(String.valueOf(custOrganizeValue.getDeptId()));
                tempName = subStringAsByte(custOrganizeValue.getDeptName());
                rootNode.setLabel(tempName);
                rootNode.setTreeNodeId(String.valueOf(custOrganizeValue.getDeptId()));
                rootNode.setUserObj(String.valueOf(-1));
                // 设置自定义的图标
                rootNode.setLeafPicUrl(DEPT_ICON);
                rootNode.setFoldOpenPicUrl(DEPT_ICON);
                rootNode.setFoldClosePicUrl(DEPT_ICON);
            } else {
                // 没有root节点，则默认新增一个
                ICustomerValue customerValue = CmServiceFactory.getCustomerSV().queryCustomerByCustId(custId);
                if (customerValue != null) {
                    // 新增默认部门
                    ICustOrganizeValue organizeValue = new CustOrganizeBean();
                    long deptId = CmServiceFactory.getCommonSV().getNewSequence(BOCmGroupOrgStructBean.class);
                    organizeValue.setDeptName(customerValue.getCustName());
                    organizeValue.setCustId(custId);
                    organizeValue.setDeptType(CmConstants.CustomerOrg.DEPARTMENT);
                    organizeValue.setDeptId(deptId);
                    IVOCustValue custValue = new VOCustBean();
                    custValue.addCustOrganize(organizeValue);
                    CmServiceFactory.getCustomerSV().saveCustomer(custValue);

                    // 根据新增的部门，设置根节点部门
                    rootNode.setLevel(1);
                    rootNode.setValue(String.valueOf(deptId));
                    tempName = subStringAsByte(customerValue.getCustName());
                    rootNode.setLabel(tempName);
                    rootNode.setTreeNodeId(String.valueOf(deptId));
                    rootNode.setUserObj(String.valueOf(-1));
                    // 设置自定义的图标
                    rootNode.setLeafPicUrl(CUST_ICON);
                    rootNode.setFoldOpenPicUrl(CUST_ICON);
                    rootNode.setFoldClosePicUrl(CUST_ICON);
                }
            }
            Set<Long> visitedDeptIds = new HashSet<Long>();
            getChildren(rootNode, visitedDeptIds);
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error(e.getMessage(), e);
            }
        }
        return rootNode;
    }

    private TreeNodeVO getChildren(TreeNodeVO parentNode, Set<Long> visitedDeptIds) throws Exception {
        long parentDeptId = Long.parseLong(parentNode.getValue());
        // 检查循环引用
        if (visitedDeptIds.contains(parentDeptId)) {
            throw new IllegalStateException("检测到循环引用，部门ID: " + parentDeptId);
        }
        visitedDeptIds.add(parentDeptId);
        // 添加最大深度限制
        if (parentNode.getLevel() >= MAX_DEPTH) {
            throw new IllegalStateException("超过最大树深度限制");
        }

        ICmDkCustomerSV customerSV = (ICmDkCustomerSV) ServiceFactory.getService(ICmDkCustomerSV.class);
        ICustOrganizeValue[] custOrganizeValues = customerSV.queryCustOrganizesByParentId(parentDeptId,
                CmConstants.CustomerOrg.DEPARTMENT, -1, -1);
        String tempName = "";
        for (ICustOrganizeValue organizeValue : custOrganizeValues) {
            TreeNodeVO node = new TreeNodeVO();
            node.setLevel(parentNode.getLevel() + 1);
            tempName = subStringAsByte(organizeValue.getDeptName());
            node.setLabel(tempName);
            node.setValue(String.valueOf(organizeValue.getDeptId()));
            node.setTreeNodeId(String.valueOf(organizeValue.getDeptId()));
            node.setParentNodeId(parentNode.getTreeNodeId());
            node.setUserObj(String.valueOf(organizeValue.getParentDeptId()));
            node.setLeafPicUrl(DEPT_ICON);
            node.setFoldOpenPicUrl(DEPT_ICON);
            node.setFoldClosePicUrl(DEPT_ICON);
            parentNode.addChild(node);
            getChildren(node, visitedDeptIds);// 递归获子节点
        }
        return parentNode;
    }

    private String subStringAsByte(String tempString) throws Exception {
        if (StringUtils.isNotBlank(tempString)) {
            // int byteLength = CmCommonUtil.getStringLengthByChar(tempString);
            // if (byteLength > 20) {
            //     tempString = CmCommonUtil.byteSubstring(tempString, 20) + "...";
            // }
            return tempString;
        }
        return null;
    }

    public IGroupMemberValue[] queryGroupMembersByCondition(long deptId, int startNum, int endNum) throws Exception {
        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "DEPT_ID", deptId + "");
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getCrossCenterService(ICmCustomerSV.class);
        return customerSV.queryGroupMembersByCondition(xmlParam.toXml(), startNum, endNum);
    }

    public int queryGroupMembersCountByCondition(long deptId) throws Exception {
        String beanClass = "com.ai.appframe2.bo.DataContainer";
        XmlParameters xmlParam = new XmlParameters();
        xmlParam.setBeanProp(beanClass, 0, "DEPT_ID", deptId + "");
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getCrossCenterService(ICmCustomerSV.class);
        return customerSV.queryGroupMembersCountByCondition(xmlParam.toXml());
    }

    public Map<String, Object> getSubNodeDeptIds(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retFlag = "Y";
        String deptIds = "";
        try {
            StringBuilder sb = new StringBuilder();
            List<String> deptIdsList = new ArrayList<String>();
            // 查询组织结构
            ICustOrganizeValue custOrganizeValues = CmServiceFactory.getCustomerSV()
                    .queryCustOrganizeByRelCustId(custId);
            getSubNodeDeptIds(custOrganizeValues.getDeptId(), deptIdsList);
            if (!deptIdsList.isEmpty()) {
                for (int i = 0; i < deptIdsList.size(); i++) {
                    if (i == deptIdsList.size() - 1) {
                        sb.append(deptIdsList.get(i));
                    } else {
                        sb.append(deptIdsList.get(i)).append(",");
                    }
                }
            }
            deptIds = sb.toString();
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("getSubNodeDeptIds exception.", e);
            }
            retFlag = "N";
        } finally {
            cp.put("retFlag", retFlag);
            cp.put("deptIds", deptIds);
        }
        return cp;
    }

    private void getSubNodeDeptIds(long parentDeptId, List<String> deptIdsList) throws Exception {
        deptIdsList.add(String.valueOf(parentDeptId));
        ICustOrganizeValue[] custOrganizeValues = CmServiceFactory.getCustomerSV()
                .queryCustOrganizesByParentId(parentDeptId, -1, -1);
        if (null != custOrganizeValues && custOrganizeValues.length > 0) {
            for (int i = 0; i < custOrganizeValues.length; i++) {
                getSubNodeDeptIds(custOrganizeValues[i].getDeptId(), deptIdsList);
            }
        }
    }

    public Map<String, Object> checkGroupOrgParent(long custId, long parentDeptId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String hasChild = "FALSE";
        String hasMember = "FALSE";
        try {
            custId = custId > 0 ? custId : -1;
            ICustOrganizeValue[] values = CmServiceFactory.getCustomerSV().querySubCustOrganizes(custId, parentDeptId);
            if (CmCommonUtil.isNotEmptyObject(values)) { // 包含子节点信息
                hasChild = "TRUE";
            }
            DataContainer condition = new DataContainer();
            condition.set(IGroupMemberValue.S_DeptId, Long.valueOf(parentDeptId));
            IGroupMemberValue[] groupMemberValues = CmServiceFactory.getCustomerSV().queryGroupMembers(condition, -1,
                    -1);
            if (groupMemberValues != null && groupMemberValues.length > 0) {
                hasMember = "TRUE";
            }
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0206009"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0206009",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("hasChild", hasChild);
            cp.put("hasMember", hasMember);
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> saveGroupCustOrgInfo(SaveCustOrganizeVO saveVO, String oldParentDeptId,
            String oldRelCustId)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        String id = "";
        try {
            // Validation is intentionally extracted into small methods:
            // - keep the main flow readable
            // - allow reusing the same validation rules for REST and legacy callers
            retMsg = validateSaveGroupCustOrgInput(saveVO);
            if (StringUtils.isNotBlank(retMsg)) {
                retVal = "N";
                return cp;
            }

            CmCustOrganizeVO newVO = saveVO.getNewData();
            CmCustOrganizeVO oldVO = saveVO.getOldData();
            boolean isModify = oldVO != null && oldVO.getDeptId() > 0;

            IVOCustValue custValue = new VOCustBean();
            ICustOrganizeValue custOrganizeValue = new CustOrganizeBean();
            buildCustOrganizeForSave(newVO, oldVO, custOrganizeValue);

            long relCustId = custOrganizeValue.getRelCustId();
            retMsg = validateNoSelfSubsidiary(custOrganizeValue, relCustId);
            if (StringUtils.isNotBlank(retMsg)) {
                retVal = "N";
                return cp;
            }

            // Resolve org by REL_CUST_ID once (used by both "occupied" validation and move validation fallback).
            ICustOrganizeValue relCustOrg = relCustId > 0
                    ? CmServiceFactory.getCustomerSV().queryCustOrganizeByRelCustId(relCustId)
                    : null;

            // Additional safety for create: REL_CUST_ID cannot be the same as the parent node's REL_CUST_ID.
            // Otherwise, org structure becomes inconsistent (self-referencing at customer dimension).
            retMsg = validateRelCustNotInAncestorRelCustIds(custOrganizeValue, oldParentDeptId);
            if (StringUtils.isNotBlank(retMsg)) {
                retVal = "N";
                return cp;
            }

            if (isModify) {
                // Structural validation should fail fast when moving nodes (avoid cycles / invalid parent).
                validateGroupOrgMoveIfNeeded(custOrganizeValue, oldParentDeptId, relCustOrg);

                retMsg = validateRelCustNotOccupiedOnModify(relCustId, oldRelCustId, relCustOrg);
                if (StringUtils.isNotBlank(retMsg)) {
                    retVal = "N";
                    return cp;
                }
                applyIsRevisableOnParentChanged(custOrganizeValue, oldParentDeptId);
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_HIERARCHY_MODIFY);
            } else {
                validateNoPendingApprovalOnCreate(relCustId);
                retMsg = validateRelCustNotOccupiedOnCreate(relCustId, relCustOrg);
                if (StringUtils.isNotBlank(retMsg)) {
                    retVal = "N";
                    return cp;
                }
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_HIERARCHY_CREATE);
            }

            retMsg = validateDeptNotSelfParent(custOrganizeValue);
            if (StringUtils.isNotBlank(retMsg)) {
                retVal = "N";
                return cp;
            }

            custValue.addCustOrganize(custOrganizeValue);
            attachGroupOrgDifferIfNeeded(custValue, custOrganizeValue, oldParentDeptId, relCustId);

            CmServiceFactory.getCustomerSV().saveCustomer(custValue);
            id = String.valueOf(custOrganizeValue.getDeptId());
            retMsg = resolveSaveGroupCustOrgSuccessMsg(isModify, newVO, oldVO);
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013029"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0013029",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
            cp.put("id", id);
        }
        return cp;
    }

    private String validateSaveGroupCustOrgInput(SaveCustOrganizeVO saveVO) {
        if (saveVO == null || saveVO.getNewData() == null) {
            return CrmLocaleFactory.getResource("CMS0000080");
        }
        return null;
    }

    private void buildCustOrganizeForSave(CmCustOrganizeVO newVO, CmCustOrganizeVO oldVO,
            ICustOrganizeValue custOrganizeValue) {
        if (oldVO != null && oldVO.getDeptId() > 0) {
            BeanUtils.copyProperties(oldVO, custOrganizeValue);
            custOrganizeValue.setStsToOld();
            BeanUtils.copyProperties(newVO, custOrganizeValue);
        } else {
            BeanUtils.copyProperties(newVO, custOrganizeValue);
            custOrganizeValue.setStsToNew();
        }
    }

    private String validateNoSelfSubsidiary(ICustOrganizeValue custOrganizeValue, long relCustId) {
        if (custOrganizeValue != null && custOrganizeValue.getCustId() == relCustId) {
            return "You cannot add the customer itself as a subsidiary.";
        }
        return null;
    }

    private String validateRelCustNotOccupiedOnModify(long relCustId, String oldRelCustId) throws Exception {
        return validateRelCustNotOccupiedOnModify(relCustId, oldRelCustId, null);
    }

    private String validateRelCustNotOccupiedOnModify(long relCustId, String oldRelCustId,
            ICustOrganizeValue relCustOrg) throws Exception {
        if (StringUtils.isNotBlank(oldRelCustId) && oldRelCustId.equals(String.valueOf(relCustId))) {
            return null;
        }
        return validateRelCustNotOccupied(relCustId, relCustOrg);
    }

    private String validateRelCustNotOccupiedOnCreate(long relCustId) throws Exception {
        return validateRelCustNotOccupiedOnCreate(relCustId, null);
    }

    private String validateRelCustNotOccupiedOnCreate(long relCustId, ICustOrganizeValue relCustOrg) throws Exception {
        return validateRelCustNotOccupied(relCustId, relCustOrg);
    }

    private String validateRelCustNotOccupied(long relCustId) throws Exception {
        return validateRelCustNotOccupied(relCustId, null);
    }

    private String validateRelCustNotOccupied(long relCustId, ICustOrganizeValue relCustOrg) throws Exception {
        ICustOrganizeValue orgValue = relCustOrg != null
                ? relCustOrg
                : CmServiceFactory.getCustomerSV().queryCustOrganizeByRelCustId(relCustId);
        if (orgValue == null) {
            return null;
        }
        if (orgValue.getCustId() != orgValue.getParentDeptId()) {
            return CrmLocaleFactory.getResource("CMS0013130");
        }
        return null;
    }

    private void validateNoPendingApprovalOnCreate(long relCustId) throws Exception {
        IBOCmPsSegmentCalValue segCalValue = CmServiceFactory.getCustomerSV().querySegCalValueByCustId(relCustId);
        if (CmCommonUtil.isNotEmptyObject(segCalValue)) {
            ExceptionUtil.throwBusinessException("CMS0000992");
        }
    }

    private void applyIsRevisableOnParentChanged(ICustOrganizeValue custOrganizeValue, String oldParentDeptId) {
        if (custOrganizeValue == null) {
            return;
        }
        if (!DataType.getAsString(custOrganizeValue.getParentDeptId()).equals(oldParentDeptId)) {
            custOrganizeValue.setIsRevisable(0);
        }
    }

    private String validateDeptNotSelfParent(ICustOrganizeValue custOrganizeValue) {
        if (custOrganizeValue != null && custOrganizeValue.getDeptId() == custOrganizeValue.getParentDeptId()) {
            return CrmLocaleFactory.getResource("CMS9988743");
        }
        return null;
    }

    private String validateRelCustNotInAncestorRelCustIds(ICustOrganizeValue custOrganizeValue, String oldParentDeptId)
            throws Exception {
        if (custOrganizeValue == null) {
            return null;
        }
        long relCustId = custOrganizeValue.getRelCustId();
        long parentDeptId = custOrganizeValue.getParentDeptId();
        if (relCustId <= 0 || parentDeptId <= 0) {
            return null;
        }
        // For modify, only validate when parent changes; for create, oldParentDeptId is usually blank.
        if (StringUtils.isNotBlank(oldParentDeptId) && parentDeptId == DataType.getAsLong(oldParentDeptId)) {
            return null;
        }

        // Walk up the ancestor chain (parent, grandparent, ...) and fail fast if any ancestor has the same REL_CUST_ID.
        // This prevents choosing an ancestor customer as the associated customer, which would create cycles
        // at the customer dimension.
        Set<Long> visitedDeptIds = new HashSet<>();
        long currentDeptId = parentDeptId;
        int depth = 0;
        while (currentDeptId > 0) {
            if (!visitedDeptIds.add(currentDeptId) || depth++ >= MAX_DEPTH) {
                break;
            }
            ICustOrganizeValue org = CmServiceFactory.getCustomerSV().queryCustOrganizeByIdDK(currentDeptId);
            if (org == null) {
                break;
            }
            long ancestorRelCustId = org.getRelCustId();
            if (ancestorRelCustId == relCustId) {
                return "When adding a subsidiary, the subsidiary cannot be a customer of its parent company.";
            }
            currentDeptId = org.getParentDeptId();
        }
        return null;
    }

    private void attachGroupOrgDifferIfNeeded(IVOCustValue custValue, ICustOrganizeValue custOrganizeValue,
            String oldParentDeptId, long relCustId) throws Exception {
        if (custValue == null || custOrganizeValue == null) {
            return;
        }
        if (!custOrganizeValue.isDeleted()
                && oldParentDeptId != null
                && oldParentDeptId.equals(String.valueOf(custOrganizeValue.getParentDeptId()))) {
            return;
        }
        IBOCmGroupOrgDifferValue groupOrgDiffer = new BOCmGroupOrgDifferBean();
        long oldParentCustId = 0L;
        String oldParentCustServiceId = "";
        if (oldParentDeptId != null && !"".equals(oldParentDeptId)) {
            groupOrgDiffer.setParentDeptId(DataType.getAsLong(oldParentDeptId));
            ICustOrganizeValue oldParentOrg = CmServiceFactory.getCustomerSV()
                    .queryCustOrganizeByParentDeptId(DataType.getAsLong(oldParentDeptId));
            oldParentCustId = oldParentOrg.getCustId();
            ICustomerValue oldParentCustomer = CmServiceFactory.getCustomerSV().queryCustomerByCustId(oldParentCustId);
            if (oldParentCustomer != null) {
                oldParentCustServiceId = oldParentCustomer.getCustServiceId();
            }
        }
        if (oldParentCustId > 0) {
            groupOrgDiffer.setParentCustId(oldParentCustId);
        }
        if (!StringUtils.isBlank(oldParentCustServiceId)) {
            groupOrgDiffer.setParentCustservId(oldParentCustServiceId);
        }
        if (relCustId > 0) {
            ICustomerValue relCustomer = CmServiceFactory.getCustomerSV().queryCustomerByCustId(relCustId);
            groupOrgDiffer.setCustServiceId(relCustomer.getCustServiceId());
        }
        custValue.setUserObject("oldData", groupOrgDiffer);
    }

    private String resolveSaveGroupCustOrgSuccessMsg(boolean isModify, CmCustOrganizeVO newVO, CmCustOrganizeVO oldVO) {
        if (!isModify && newVO != null) {
            return CrmLocaleFactory.getResource("CMS0013025");
        }
        if (isModify && newVO != null && oldVO != null && oldVO.getDeptId() > 0) {
            return CrmLocaleFactory.getResource("CMS0013026");
        }
        return "success";
    }

    private void validateGroupOrgMoveIfNeeded(ICustOrganizeValue custOrganizeValue, String oldParentDeptId)
            throws Exception {
        validateGroupOrgMoveIfNeeded(custOrganizeValue, oldParentDeptId, null);
    }

    private void validateGroupOrgMoveIfNeeded(ICustOrganizeValue custOrganizeValue, String oldParentDeptId,
            ICustOrganizeValue relCustOrg)
            throws Exception {
        if (custOrganizeValue == null || StringUtils.isBlank(oldParentDeptId)) {
            return;
        }
        long newParentDeptId = custOrganizeValue.getParentDeptId();
        long oldParent = DataType.getAsLong(oldParentDeptId);
        if (newParentDeptId <= 0 || newParentDeptId == oldParent) {
            return;
        }

        // In some callers the "Id" is actually REL_CUST_ID (customer id).
        // To keep consistent with cm_group_org_struct semantics, always resolve:
        //   REL_CUST_ID -> (current org row) -> DEPT_ID
        // then perform recursion starting from DEPT_ID.
        long relCustId = custOrganizeValue.getRelCustId();
        if (relCustId <= 0) {
            return;
        }
        ICustOrganizeValue currentOrg = (relCustOrg != null && relCustOrg.getRelCustId() == relCustId)
                ? relCustOrg
                : CmServiceFactory.getCustomerSV().queryCustOrganizeByRelCustId(relCustId);
        if (currentOrg == null || currentOrg.getDeptId() <= 0) {
            return;
        }
        long deptId = currentOrg.getDeptId();

        if (custOrganizeValue.getDeptType() == 0) {
            queryGroupOrgParentSafe(deptId, newParentDeptId, new HashSet<>(), 0);
        } else {
            queryGroupOrgNodeSafe(deptId, newParentDeptId, new HashSet<>(), 0);
        }
    }

    private void queryGroupOrgNodeSafe(long deptId, long parentDeptId, Set<Long> visitedDeptIds, int depth)
            throws Exception {
        if (deptId <= 0 || parentDeptId <= 0) {
            return;
        }
        // Defensive: avoid infinite recursion if org data is cyclic or excessively deep.
        if (!visitedDeptIds.add(deptId) || depth >= MAX_DEPTH) {
            return;
        }
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustOrganizeValue[] custOrganizeValues = customerSV.queryCustOrganizesByParentId(deptId, -1, -1);
        if (custOrganizeValues == null || custOrganizeValues.length == 0) {
            return;
        }
        for (ICustOrganizeValue child : custOrganizeValues) {
            if (child == null) {
                continue;
            }
            long childDeptId = child.getDeptId();
            if (childDeptId == parentDeptId) {
                ExceptionUtil.throwBusinessException("CMS0011891");
            }
            queryGroupOrgNodeSafe(childDeptId, parentDeptId, visitedDeptIds, depth + 1);
        }
    }

    private void queryGroupOrgParentSafe(long deptId, long parentDeptId, Set<Long> visitedDeptIds, int depth)
            throws Exception {
        if (deptId <= 0 || parentDeptId <= 0) {
            return;
        }
        // Defensive: avoid infinite recursion if org data is cyclic or excessively deep.
        if (!visitedDeptIds.add(deptId) || depth >= MAX_DEPTH) {
            return;
        }
        ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
        ICustOrganizeValue custOrganizeValue = customerSV.queryCustOrganizeByIdDK(deptId);
        if (custOrganizeValue == null) {
            return;
        }
        long p = custOrganizeValue.getParentDeptId();
        if (p == parentDeptId) {
            ExceptionUtil.throwBusinessException("CMS0011892");
        }
        queryGroupOrgParentSafe(p, parentDeptId, visitedDeptIds, depth + 1);
    }
    public Map<String, Object> delGroupCustOrg(long orgId)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            DataContainer conditionDC = new DataContainer();
            conditionDC.set(ICustOrganizeValue.S_DeptId, orgId);
            ICustOrganizeValue[] values = CmServiceFactory.getCustomerSV().queryCustOrganizes(conditionDC, -1, -1);
            if (values != null && values.length == 1) {
                long relCustId = values[0].getRelCustId();
                // 判断该集团是否有未处理完的工单
                IBOCmPsSegmentCalValue segCalValue = CmServiceFactory.getCustomerSV()
                        .querySegCalValueByCustId(relCustId);
                if (CmCommonUtil.isNotEmptyObject(segCalValue)) {
                    // 该客户有未审批记录，等完成审批后再进行操作！
                    ExceptionUtil.throwBusinessException("CMS0000992");
                }
                values[0].delete();
                IVOCustValue custValue = new VOCustBean();
                custValue.addCustOrganize(values[0]);
                custValue.setBusinessId(CmConstants.BusiLogId.GROUP_HIERARCHY_SPLIT);
                CmServiceFactory.getCustomerSV().saveCustomer(custValue);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0013027");
        } catch (Exception e) {
            retVal = "N";
            if (log.isErrorEnabled()) {
                log.error(CrmLocaleFactory.getResource("CMS0013030"), e);
            }
            retMsg = CrmLocaleFactory.getResource("CMS0013030",
                    (e.getCause() == null ? e.getMessage() : e.getCause().getMessage()));
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    public Map<String, Object> delGroupMember(SelectedCustDeptMemberVO deleteVO)
            throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            // 判断有没取到dcs
            if (deleteVO == null || deleteVO.getSelectMembers() == null) {
                retVal = "N";
                // 您已对数据进行过保存或从未对数据进行过修改，无需再次保存。
                retMsg = CrmLocaleFactory.getResource("CMS0000080");
            } else {
                List<CmCustMemberVO> list = deleteVO.getSelectMembers();
                IVOCustValue custValue = new VOCustBean();

                if (CmCommonUtil.isNotEmptyObject(list)) {
                    custValue.setUserObject(CmLnConstants.DealCustInfo.OP_STATE, CmLnConstants.DealCustInfo.OP_DEL);

                    ICustRelationshipValue custRelValue = new CustRelationshipBean();
                    CmCustMemberVO delMemberVO = list.get(0);
                    DataContainer dc = com.asiainfo.crm.util.BeanUtils.wrapObject(delMemberVO);
                    custRelValue.copy(dc);
                    custRelValue.setStsToOld();
                    custRelValue.delete();

                    // 网外成员判断cpr是否订购成功
                    if (custRelValue.getMemberType() == CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_OUT) {
                        // 固网不与CPR交互，加一个开关控制
                        IBOBsStaticDataValue[] staticValue = StaticDataUtil
                                .getStaticData("CM_USER_UNSUBSCRIBE_FROM_CPR");
                        if (CmCommonUtil.isNotEmptyObject(staticValue)) {
                            if ("Y".equals(staticValue[0].getCodeValue())) {
                                ICmCustRequestTaskSV requestTaskSV = (ICmCustRequestTaskSV) ServiceFactory
                                        .getService(ICmCustRequestTaskSV.class);
                                IBOCmCustRequestTaskValue[] taskValue = (IBOCmCustRequestTaskValue[]) requestTaskSV
                                        .queryByCustId(custRelValue.getMemberCustId());
                                if (taskValue != null && taskValue.length > 0) {
                                    if (!"F".equals(taskValue[0].getRequestStatus())) {
                                        // cpr订购未完成，不能删除成员
                                        retVal = "N";
                                        // 没有获取到要删除的成员信息！
                                        retMsg = CrmLocaleFactory.getResource("CMS9988903");
                                        return cp;
                                    }
                                }
                            }
                        }
                    }
                    // 判断集团成员是否订购产品
                    if (CmLnConstants.MemberStatus.MEMBER_STATUS_NETWORK_IN == custRelValue.getMemberType()) {
                        checkGrpMember(custRelValue.getBillId(), String.valueOf(custRelValue.getCustId()));
                    }
                    String memberName = custRelValue.getMemberName();
                    custRelValue.setRelationType(CmConstants.CustRelationShip.CUST_REL_TYPE_GROUP_MEMBER);
                    custValue.addCustRel(custRelValue);
                    ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
                    custValue.setBusinessId(CmConstants.BusiLogId.GROUP_MEMBER);
                    customerSV.saveCustomer(custValue);

                    // 成员[{0}]删除成功！
                    retMsg = CrmLocaleFactory.getResource("CMS5000097", memberName);

                } else {
                    retVal = "N";
                    // 没有获取到要删除的成员信息！
                    retMsg = CrmLocaleFactory.getResource("CMS5000096");
                }
            }

        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("delGroupMember exception.", e);
            }
            retVal = "N";
            retMsg = e.getCause() == null ? e.getMessage() : e.getCause().getMessage();
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }

    // 是否订购集团产品
    private void checkGrpMember(String billId, String grpCustId) throws Exception {
        // 判断集团成员是否订购产品
        CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, billId);
        ICmTeamInvokeSV iCmTeamInvokeSV = (ICmTeamInvokeSV) ServiceFactory.getCrossCenterService(ICmTeamInvokeSV.class);
        Map map = iCmTeamInvokeSV.unifiedGroupQuery(billId, grpCustId);
        boolean flag = (Boolean) map.get("FLAG");

        if (!flag) {
            throw new Exception(CrmLocaleFactory.getResource("CMS95100175", billId));
        }
    }

    public Map<String, Object> queryIndivCust(long custId) throws Exception {
        Map<String, Object> cp = new HashMap<>();
        String retVal = "Y";
        String retMsg = "";
        try {
            ICmCustomerSV customerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
            IBOCmIndivCustomerValue customerValue = customerSV.queryIndivCustomerInfo(custId);
            retMsg = String.valueOf(customerValue.getPartyId());
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error("queryIndivCust exception.", e);
            }
            retVal = "N";
        } finally {
            cp.put("retVal", retVal);
            cp.put("retMsg", retMsg);
        }
        return cp;
    }
}
