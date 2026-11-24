package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.tab.split.TenantIDFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.CustomProperty;
import com.ai.appframe2.web.HttpUtil;
import com.ai.common.i18n.BusinessException;
import com.ai.common.i18n.CrmLocaleFactory;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.custgroup.ivalues.IBOCmCustomerGroupValue;
import com.asiainfo.crm.cm.custgroup.teaminvoke.out.service.interfaces.ICustGroupOutSV;
import com.asiainfo.crm.cm.custview.ivalues.IBOCmCfgViewDefineValue;
import com.asiainfo.crm.cm.custview.service.interfaces.ICmCustViewSV;
import com.asiainfo.crm.cm.custview.util.CmCfgViewDefineUtil;
import com.asiainfo.crm.cm.vo.QueryCustViewTreeVo;
import com.asiainfo.crm.cm.vo.TreeNodeVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.*;

@Slf4j
@Component
public class CustomerViewBFImpl {
    private String queryString = "";
    /**
     * 用于获取对应的客户层次数等
     */
    private long custId = 0L;
    /**
     * 根据不同的访问渠道展示对应的视图
     */
    private int channelType = -1;

    /**
     * 业务编码
     */
    private long businessId = 0L;

    private String custServiceId = "";

    /**
     * 操作员编号：用于过滤该操作员定制的视图
     */
    private long operId = 0L;

    /**
     * 客户名称
     */
    private String custName = "";
    private long partyId = 0;

    private String regionId = "";

    private String allEditFlag = "";

    private static int IS_CUSTOM_IMPL = 1;// 表示有自定义的动态获得节点的方法

    private static final int MAX_DEPTH = 20;

    public TreeNodeVO init(QueryCustViewTreeVo queryCustViewTreeVo) throws Exception {
        StringBuilder qstr = new StringBuilder();
        String str = "";
        Map<String, String> params = queryCustViewTreeVo.getParams();
        Iterator<Map.Entry<String, String>> it = params.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> entry = it.next();
            if(entry.getKey().equals("custName")){
                str += entry.getValue();
                continue;
            }
            if (!"action".equals(entry.getKey()) && !"pk".equals(entry.getKey())) {
                qstr.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
        }

        if (StringUtils.isNotBlank(str)) {
            qstr.append("custName=").append(str);
        }
        if (qstr.length() > 0) {
            // 去掉最后一个&符号
            if (qstr.indexOf("&") > 0) {
                qstr.delete(qstr.length() - 1, qstr.length());
            }
            this. queryString = qstr.toString();
        }
        this.custId = (StringUtils.isNotBlank( params.get( CmConstants.CommonPageParamName.CUST_ID))) ? Long.parseLong(params.get(CmConstants.CommonPageParamName.CUST_ID)) : this.custId;
        this.channelType = 0;
        this.businessId = (StringUtils.isNotBlank(params.get( CmConstants.CommonPageParamName.BUSINESS_ID))) ? Long.parseLong(params.get(CmConstants.CommonPageParamName.BUSINESS_ID))  : this.businessId;
        this.operId = ServiceManager.getUser().getID();
        this.custName = (StringUtils.isNotBlank(params.get( CmConstants.CommonPageParamName.CUST_NAME))) ? params.get( CmConstants.CommonPageParamName.CUST_NAME) : this.custName;
        this.custServiceId = (StringUtils.isNotBlank(params.get( CmConstants.CommonPageParamName.CUST_SERVICE_ID))) ? params.get( CmConstants.CommonPageParamName.CUST_SERVICE_ID) : this.custServiceId;
        // 增加对RegionId的解析 --2012-4-30
        this.regionId =  params.get(CmConstants.CommonPageParamName.REGION_ID);
        if (StringUtils.isBlank(regionId)) {
            this.regionId = params.get("REGION_ID");
        }
        if (StringUtils.isBlank(regionId)) {
            this.regionId = CmCommonUtil.getDefaultRegionId();
        }
        this.allEditFlag = params.get("allEditFlag");
        this.partyId = Long.parseLong(params.get("partyId"));

        TreeNodeVO rootNode = new TreeNodeVO();
        try {
            int custType = CmCommonUtil.getCustType(this.custId);
            IBOCmCfgViewDefineValue rootViewDefineValue = CmCfgViewDefineUtil.getRootCfgViewDefine(businessId, custType, channelType);
            if (rootViewDefineValue != null) {
                rootNode.setLevel(1);
                rootNode.setValue(String.valueOf(rootViewDefineValue.getViewId()));
                // 客户信息概览[4123321|zcz],modify by xialing,2013-8-28,从国际化取菜单名称
                rootNode.setLabel(new StringBuilder(CrmLocaleFactory.getResource(rootViewDefineValue.getViewTitle())).append("[").append(this.custName).append("]").toString());
                rootNode.setTreeNodeId(String.valueOf(rootViewDefineValue.getViewId()));
                // 设置自定义的图标
                if (StringUtils.isNotBlank(rootViewDefineValue.getViewIconUrl())) {
                    rootNode.setFoldClosePicUrl(rootViewDefineValue.getViewIconUrl());
                    rootNode.setFoldOpenPicUrl(rootViewDefineValue.getViewIconUrl());
                    rootNode.setLeafPicUrl(rootViewDefineValue.getViewIconUrl());
                }
                if (StringUtils.isNotBlank(rootViewDefineValue.getViewUrl())) {
                    StringBuilder url = new StringBuilder(rootViewDefineValue.getViewUrl());
                    if (url.indexOf("?") >= 0) {
                        url.append("&viewId=").append(rootViewDefineValue.getViewId()).append("&").append(this.queryString);
                    } else {
                        url.append("?").append("viewId=").append(rootViewDefineValue.getViewId()).append("&").append(this.queryString);
                    }
                    rootNode.setUserObj(url.toString());
                }
            } else {
                rootNode.setValue("-1");
                rootNode.setTreeNodeId("-1");
            }
        } catch (Exception e) {
            if (log.isErrorEnabled()) {
                log.error(e.getMessage(), e);
            }
        }
        Set<String> viewIds = new HashSet<>();
        getChildren(rootNode,viewIds);
        return rootNode;
    }

    public TreeNodeVO getChildren(TreeNodeVO parentNode, Set<String> viewIds) throws Exception {
        String viewId = parentNode.getValue();
        IBOCmCfgViewDefineValue parentValue = CmCfgViewDefineUtil.getCfgViewDefineById(Long.parseLong(viewId));
        // 避免空指针异常，如果找不到则认为是点击了自定义实现节点，暂不支持。
        if (!CmCommonUtil.isNotEmptyObject(parentValue)) {
            return null;
        }
        // 检查循环引用
        if (viewIds.contains(viewId)) {
            throw new IllegalStateException("检测到循环引用，VIEW_ID: " + viewId);
        }
        viewIds.add(viewId);
        // 添加最大深度限制
        if (parentNode.getLevel() >= MAX_DEPTH) {
            throw new IllegalStateException("超过最大树深度限制");
        }
        if (parentValue.getIsCustomImpl() == IS_CUSTOM_IMPL) {
            //此段逻辑暂时不做
            if (StringUtils.isNotBlank(parentValue.getCustomImplClass())) {
                return null;
            }
        } else {
            ICmCustViewSV custViewSV = (ICmCustViewSV) ServiceFactory.getService(ICmCustViewSV.class);
            IBOCmCfgViewDefineValue[] viewDefineValues = custViewSV.queryOperViewDefine(this.operId, Long.valueOf(parentNode.getValue()), 1);
            if (CmCommonUtil.isNotEmptyObject(viewDefineValues)) {
                for (int i = 0; i < viewDefineValues.length; i++) {
                    // 针对21租户隐藏合同信息
                    if (TenantIDFactory.getTenantId().equals(CmConstants.TenantId.TENANT_21)) {
                        if (viewDefineValues[i].getViewId() == 303) {
                            continue;
                        }
                    }
                    // 针对丹麦和匈牙利的处理
                    if (String.valueOf(viewDefineValues[i].getChannelType()).indexOf(TenantIDFactory.getTenantId()) == -1) {
                        continue;
                    }
                    TreeNodeVO node = new TreeNodeVO();
                    node.setLevel(viewDefineValues[i].getViewLevel());
                    node.setValue(String.valueOf(viewDefineValues[i].getViewId()));
                    // 客户信息概览[4123321|zcz]
                    node.setLabel(CrmLocaleFactory.getResource(viewDefineValues[i].getViewTitle()));	// modify by
                    // xialing,2013-8-28,从国际化取菜单名称
                    node.setTreeNodeId(String.valueOf(viewDefineValues[i].getViewId()));
                    // 设置自定义的图标
                    if (StringUtils.isNotBlank(viewDefineValues[i].getViewIconUrl())) {
                        node.setFoldClosePicUrl(viewDefineValues[i].getViewIconUrl());
                        node.setFoldOpenPicUrl(viewDefineValues[i].getViewIconUrl());
                        node.setLeafPicUrl(viewDefineValues[i].getViewIconUrl());
                    }
                    // 设置是否叶子节点
                    switch (viewDefineValues[i].getIsLeaf()) {
                        case 1:
                            node.setLeaf(true);
                            break;
                        default:
                            node.setLeaf(false);
                            break;
                    }
                    if (StringUtils.isNotBlank(viewDefineValues[i].getViewUrl())) {
                        StringBuilder url = new StringBuilder(viewDefineValues[i].getViewUrl());
                        if (url.indexOf("?") >= 0) {
                            url.append("&");
                        } else {
                            url.append("?");
                        }
                        // 视图编号，用于某些视图还包含有子视图的情况
                        url.append("viewId=").append(viewDefineValues[i].getViewId());
                        // 客户编号（客户管理侧）
                        url.append("&").append(CmConstants.CommonPageParamName.CUST_ID).append("=").append(this.custId);
                        // 客户服务编号（客户管理侧）
                        url.append("&").append(CmConstants.CommonPageParamName.CUST_SERVICE_ID).append("=").append(this.custServiceId);
                        // 渠道类型（客户管理侧）
                        url.append("&").append(CmConstants.CommonPageParamName.CHANNEL_TYPE).append("=").append(this.channelType);
                        // 地市编码
                        url.append("&").append(CmConstants.CommonPageParamName.REGION_ID).append("=").append(this.regionId);
                        // 渠道类型（业务受理侧）
                        url.append("&CHANNEL_TYPE=").append(this.channelType);
                        // 增加对业务受理侧集成支持：业务受理侧客户编号使用CUSTOMER_ID、客户名称使用CUSTOMER_NAME。
                        url.append("&CUSTOMER_ID=").append(this.custId).append("&CUST_SERVICE_ID=").append(custServiceId);
                        // 业务编码
                        url.append("&BUSINESS_ID=").append(viewDefineValues[i].getBusinessId()).append("&").append(CmConstants.CommonPageParamName.BUSINESS_ID).append("=")
                                .append(viewDefineValues[i].getBusinessId());
                        // 集团视图控制变量
                        url.append("&allEditFlag=").append(this.allEditFlag);
                        url.append("&partyId=").append(this.partyId);

                        // 客户名称（客户管理侧）
                        url.append("&").append(CmConstants.CommonPageParamName.CUST_NAME).append("=").append(this.custName).append("&CUSTOMER_NAME=").append(this.custName);
                        // url.append("&").append(this.queryString);
                        node.setUserObj(url.toString());
                    }
                    parentNode.addChild(node);
                    getChildren(node,viewIds);
                }
            } else {
                parentNode.setLeaf(true);
            }
        }
        return parentNode;
    }

    public Map queryGroupByCustId(long custId ){
        Map cp = new HashMap();
        String retFlag = "Y";
        String message = "";
        try {
            ICustGroupOutSV custGroupOutSV = (ICustGroupOutSV) ServiceFactory.getService(ICustGroupOutSV.class);
                IBOCmCustomerGroupValue custGroupValue = custGroupOutSV.getGroupBasicInfo(custId);

            if (custGroupValue != null) {
                HashMap<String,Object> propertiesMap = custGroupValue.getProperties();
                for (Map.Entry<String,Object> entry:propertiesMap.entrySet()){
                    cp.put( entry.getKey(), String.valueOf(entry.getValue()) );
                }
            }
            message = "operation succeeded.";
        }catch(BusinessException e ){
            retFlag = "N";
            message = "operation failed."+e.getMessage();
        } catch (Exception e) {
            retFlag = "N";
            message = "operation failed."+e.getMessage();
            e.printStackTrace();
        }
        cp.put("retFlag", retFlag);
        cp.put("message", message);
        return cp;
    }
}
