package com.asiainfo.crm.cm.teaminvoke.in.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.ServiceManager;
import com.ai.appframe2.complex.tab.split.TenantIDFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.common.util.ExceptionUtil;
import com.asiainfo.crm.cm.teaminvoke.in.service.interfaces.ICs2CmSV;
import com.asiainfo.cs.base.tm.inter.common.remote.*;
import com.asiainfo.cs.base.tm.inter.common.service.interfaces.ITicketMgrRemoteSV;
import com.asiainfo.cs.base.tm.inter.service.interfaces.ITmCommonRemoteSV;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Cs2CmSVImpl implements ICs2CmSV {
    private static transient Log log = LogFactory.getLog(Cs2CmSVImpl.class);

    public String CreateTicketForCM(Map map) throws Exception {
        if (!map.isEmpty()) {
            String custId = null;
            String errorCode = null;
            String errorMsg = null;
            String srcSystem = null;
            String errorExtInfo = null;
            // Check Parameters
            if (map.containsKey("CUST_ID")) {
                custId = (String) map.get("CUST_ID");
                if (StringUtils.isBlank(custId)) {
                    ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "CUST_ID" });
                }
            } else {
                ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "CUST_ID" });
            }

            if (map.containsKey("ERROR_CODE")) {
                errorCode = (String) map.get("ERROR_CODE");
                if (StringUtils.isBlank(errorCode)) {
                    ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "ERROR_CODE" });
                }
            } else {
                ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "ERROR_CODE" });
            }

            if (map.containsKey("ERROR_MESSAGE")) {
                errorMsg = (String) map.get("ERROR_MESSAGE");
                if (StringUtils.isBlank(errorMsg)) {
                    ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "ERROR_MESSAGE" });
                }
            } else {
                ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "ERROR_MESSAGE" });
            }

            if (map.containsKey("SOURCE_SYSTEM")) {
                srcSystem = (String) map.get("SOURCE_SYSTEM");
                if (StringUtils.isBlank(srcSystem)) {
                    ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "SOURCE_SYSTEM" });
                }
            } else {
                ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "SOURCE_SYSTEM" });
            }

            if (map.containsKey("ERROR_EXT_INFO")) {
                errorExtInfo = (String) map.get("ERROR_EXT_INFO");
            }
            // 创建工单结构体
            CreateInfo createInfo = new CreateInfo();

            // 创建人，租户Id(必填）
            if (null != ServiceManager.getUser()) {
                createInfo.setOpCode(ServiceManager.getUser().getCode());
            } else {
                createInfo.setOpCode("21PA1TSM");
            }
            createInfo.setTenantId(TenantIDFactory.getTenant());

            // 工单类型 CM填写010开头的编码
            if (map.containsKey("TICKET_TYPE")) {
                createInfo.setTickeType(String.valueOf(map.get("TICKET_TYPE")));
            } else {
                createInfo.setTickeType("012");
            }

            // 外系统编码 CM填写CM101
            createInfo.setSysCode("CM101");

            // 塞上custId
            createInfo.setCustId(custId);
            // 如果是纯payer，TT要求在failnum塞入partyId
            createInfo.setFailureNum(custId);
            // 构建CM特殊投诉单特殊属性
            List<ElemItem> elemItemList = new ArrayList<ElemItem>();
            ElemItem elemItem = new ElemItem();
            // elemItem.setName("CUST_ID");
            // elemItem.setValue(custId);
            // elemItemList.add(elemItem);
            // elemItem = new ElemItem();
            elemItem.setName("ERROR_CODE");
            elemItem.setValue(errorCode);
            elemItemList.add(elemItem);
            elemItem = new ElemItem();
            elemItem.setName("ERROR_MESSAGE");
            elemItem.setValue(errorMsg);
            elemItemList.add(elemItem);
            elemItem = new ElemItem();
            elemItem.setName("SOURCE_SYSTEM");
            elemItem.setValue(srcSystem);
            elemItemList.add(elemItem);
            if (StringUtils.isNotBlank(errorExtInfo)) {
                elemItem = new ElemItem();
                elemItem.setName("ERROR_EXT_INFO");
                elemItem.setValue(errorExtInfo);
                elemItemList.add(elemItem);
            }
            createInfo.setElemItemList(elemItemList);

            createInfo.setCreateAttachmentList(new ArrayList<CreateAttachment>());
            // 创建投诉单
            String SerialNo = getTicketMgrRemote().createTicket(createInfo);
            log.info("testCreateTicketForNp complete,SerialNo is :" + SerialNo + ".");

            return SerialNo;
        } else {
            ExceptionUtil.throwBusinessException("CMS0000360", new String[] { "map" });
        }
        return null;
    }

    /**
     * 获取remote接口
     *
     * @return
     * @author yangjh
     * @date 2014-12-15 下午03:50:41
     */
    private ITicketMgrRemoteSV getTicketMgrRemote() {
        try {
            return (ITicketMgrRemoteSV) ServiceFactory.getService(ITicketMgrRemoteSV.class);
        } catch (Exception e) {
            log.info(e.getMessage(), e);
        }
        return null;
    }

    /*
     * (non-Javadoc)
     * @see com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#queryTicketListForCm(long, java.lang.String,
     * java.lang.String, java.lang.String, int, int)
     */
    public DataContainer[] queryTicketListForCm(long custId, String SrcType, String errorCode, String strDate, String endDate, int strIdx, int endIdx) throws Exception {
        // 初始化查询条件类
        QueryCond queryCond = new QueryCond();

        // 租户和查询人员条件（必填）
        queryCond.setTenantId(TenantIDFactory.getTenant());
        // queryCond.setOpCode(ServiceManager.getUser().getCode());

        // 工单分类条件，查询具体大类数据的基本条件（必填）
        queryCond.setTicketCategory("TM_CM_TICKET");

        // 分页条件（可选）
        if (strIdx > -1 && endIdx > -1) {
            queryCond.setPagetStartIndex(strIdx);
            queryCond.setPageSize(endIdx + 1 - strIdx);
        } else {
            queryCond.setPagetStartIndex(-1);
            queryCond.setPageSize(1000);
        }

        // 工单基本条件（工单流水号、工单类型、时间范围等）（可选）
        queryCond.setTicketType("012"); // 前匹配模式
        if (StringUtils.isNotBlank(strDate)) {
            queryCond.setCreateDateStart(strDate);
        }
        if (StringUtils.isNotBlank(endDate)) {
            queryCond.setCreateDateEnd(endDate);
        }

        // 排序条件（可选）
        List<SortClause> sortClauseList = new ArrayList<SortClause>();
        SortClause sortClause = SortClause.asc("CREATE_DATE");
        sortClauseList.add(sortClause);

        sortClause = SortClause.desc("LAST_MODIFIED_DATE");
        sortClauseList.add(sortClause);
        // 追加查询条件
        queryCond.setSortClauseList(sortClauseList);
        List<ElemItem> elemItemList = new ArrayList<ElemItem>();
        if (custId > 0) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("CUST_ID");
            elemItem.setValue(String.valueOf(custId));
            elemItemList.add(elemItem);
        }

        if (StringUtils.isNotBlank(SrcType)) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("SOURCE_SYSTEM");
            elemItem.setValue(SrcType);
            elemItemList.add(elemItem);

        }

        if (StringUtils.isNotBlank(errorCode)) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("ERROR_CODE");
            elemItem.setValue(errorCode);
            elemItemList.add(elemItem);

        }

        // 追加查询元素
        if (!elemItemList.isEmpty()) {
            queryCond.setElemItemList(elemItemList);
        }

        // 发起查询
        QueryResult queryResult = getTicketMgrRemote().queryTicketList(queryCond);
        List<QueryResultRow> reultList = queryResult.getQueryResultList();
        DataContainer[] dc = null;
        if (!reultList.isEmpty()) {
            dc = new DataContainer[reultList.size()];
            List<ElemItem> elementList = null;
            String eleName = null;
            String eleValue = null;
            int i = 0;
            for (QueryResultRow queryResultRow : reultList) {
                dc[i] = new DataContainer();
                dc[i].set("SHOW_SERIAL_NO", queryResultRow.getShowSerialNo());
                dc[i].set("CREATE_DATE", queryResultRow.getCreateDate());
                elementList = queryResultRow.getElemItemList();
                for (ElemItem elementItem : elementList) {
                    eleName = elementItem.getName();
                    eleValue = elementItem.getValue();
                    dc[i].set(eleName, eleValue);
                }
                if (dc[i].hasProperty("ERROR_EXT_INFO")) {
                    if (dc[i].get("ERROR_EXT_INFO").equals("null")) {
                        dc[i].set("ERROR_EXT_INFO", "");
                    }
                }
                String detail = "<a href=\"javascript:void(0)\" class=\"cellpath\" onclick=\"openCmTTDetail(" + i
                        + ")\" style=\"color:blue;margin-left:5px;text-decoration:underline\" >" + CrmLocaleFactory.getResource("CCS0000167") + "</a>";
                dc[i].set("ACTION", detail);
                i++;
            }
            return dc;
        }

        return new DataContainer[0];

    }

    /*
     * (non-Javadoc)
     * @see com.asiainfo.crm.cm.common.service.interfaces.ICmCommonSV#queryTicketListCountForCm(long, java.lang.String,
     * java.lang.String, java.lang.String)
     */
    public int queryTicketListCountForCm(long custId, String SrcType, String errorCode, String strDate, String endDate) throws Exception {
        // 初始化查询条件类
        QueryCond queryCond = new QueryCond();

        // 租户和查询人员条件（必填）
        queryCond.setTenantId(TenantIDFactory.getTenant());
        // queryCond.setOpCode(ServiceManager.getUser().getCode());

        // 工单分类条件，查询具体大类数据的基本条件（必填）
        queryCond.setTicketCategory("TM_CM_TICKET");

        // 工单基本条件（工单流水号、工单类型、时间范围等）（可选）
        queryCond.setTicketType("012"); // 前匹配模式
        if (StringUtils.isNotBlank(strDate)) {
            queryCond.setCreateDateStart(strDate);
        }
        if (StringUtils.isNotBlank(endDate)) {
            queryCond.setCreateDateEnd(endDate);
        }

        // 分页条件（可选）
        queryCond.setPagetStartIndex(-1);
        queryCond.setPageSize(1000);

        // 排序条件（可选）
        List<SortClause> sortClauseList = new ArrayList<SortClause>();
        SortClause sortClause = SortClause.asc("CREATE_DATE");
        sortClauseList.add(sortClause);

        sortClause = SortClause.desc("LAST_MODIFIED_DATE");
        sortClauseList.add(sortClause);
        // 追加查询条件
        queryCond.setSortClauseList(sortClauseList);
        List<ElemItem> elemItemList = new ArrayList<ElemItem>();
        if (custId > 0) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("CUST_ID");
            elemItem.setValue(String.valueOf(custId));
            elemItemList.add(elemItem);
        }

        if (StringUtils.isNotBlank(SrcType)) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("SOURCE_SYSTEM");
            elemItem.setValue(SrcType);
            elemItemList.add(elemItem);

        }

        if (StringUtils.isNotBlank(errorCode)) {
            ElemItem elemItem = new ElemItem();
            elemItem.setName("ERROR_CODE");
            elemItem.setValue(errorCode);
            elemItemList.add(elemItem);

        }

        // 追加查询元素
        if (!elemItemList.isEmpty()) {
            queryCond.setElemItemList(elemItemList);
        }

        // 发起查询
        QueryResult queryResult = getTicketMgrRemote().queryTicketList(queryCond);
        if (queryResult != null) {
            return queryResult.getTotalCount();
        }

        return 0;
    }
}
