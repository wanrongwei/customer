package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.common.SessionManager;
import com.ai.appframe2.privilege.UserInfoInterface;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.appframe2.web.action.BaseAction;
import com.ai.common.i18n.CrmLocaleFactory;
import com.ai.oneframe.view.bo.BOOf2VcCustItemBean;
import com.ai.oneframe.view.service.interfaces.IOf2VcCustItemSV;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

@Slf4j
public class CustItemBFImpl {


    public Map saveVcCustItemInfo(int custType, int ownSys, String itemCodes) throws Exception {
        IOf2VcCustItemSV sv = (IOf2VcCustItemSV)ServiceFactory.getService(IOf2VcCustItemSV.class);
        UserInfoInterface user = SessionManager.getUser();
        long visualId = user.getID();
        int maxSort = sv.getMaxSortNo(visualId, custType, ownSys);
        List<BOOf2VcCustItemBean> beans = new ArrayList();
        BOOf2VcCustItemBean bean = null;
        Map<String,Object> cp=new HashMap<>();
        String retVal = "Y";
        StringBuilder retMsg = new StringBuilder();

        try {
            if (itemCodes.length() > 1) {
                String[] items = itemCodes.split(",");
                int i = 0;

                for(int len = items.length; i < len; ++i) {
                    if (StringUtils.isNotEmpty(items[i])) {
                        bean = new BOOf2VcCustItemBean();
                        bean.setVisualId(visualId);
                        bean.setItemType(custType);
                        bean.setOwnSys(ownSys);
                        bean.setIsVisible(1);
                        bean.isNew();
                        bean.setItemCode(items[i]);
                        ++maxSort;
                        bean.setSortNo(maxSort);
                        beans.add(bean);
                    }
                }

                sv.saveBatch((BOOf2VcCustItemBean[])beans.toArray(new BOOf2VcCustItemBean[0]));
            }
        } catch (Exception var22) {
            retVal = "N";
            retMsg.append(CrmLocaleFactory.getFixResource("OFS2000384")).append(var22.getCause() == null ? var22.getMessage() : var22.getCause().getMessage());
            if (log.isErrorEnabled()) {
                log.error(var22.getMessage(), var22);
            }
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg.toString());
        return cp;

    }

    public Map deleteVcCustItemInfo(int custType,int ownSys,String itemCodes) throws Exception {
        IOf2VcCustItemSV sv = (IOf2VcCustItemSV)ServiceFactory.getService(IOf2VcCustItemSV.class);
        UserInfoInterface user = SessionManager.getUser();
        long visualId = user.getID();
        Map<String,Object> cp = new HashMap<>();
        String retVal = "Y";
        StringBuilder retMsg = new StringBuilder();

        try {
            if (itemCodes.length() > 1) {
                sv.deleteVcCustItem(visualId, ownSys, custType, itemCodes);
                BOOf2VcCustItemBean[] values = sv.getVcCustItem(visualId, ownSys, custType);
                if (values != null && values.length > 0) {
                    int i = 0;

                    for(int len = values.length; i < len; ++i) {
                        values[i].setSortNo(i + 1);
                        values[i].isModified();
                    }

                    sv.saveBatch(values);
                }
            }
        } catch (Exception var19) {
            retVal = "N";
            retMsg.append(CrmLocaleFactory.getFixResource("OFS2000385")).append(var19.getCause() == null ? var19.getMessage() : var19.getCause().getMessage());
            if (log.isErrorEnabled()) {
                log.error(var19.getMessage(), var19);
            }
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg.toString());
        return cp;
    }

    public Map moveVcCustItemData(String itemCode,int custType,int ownSys,String opFlag,int sortNo) throws Exception {
        IOf2VcCustItemSV sv = (IOf2VcCustItemSV)ServiceFactory.getService(IOf2VcCustItemSV.class);
        Map<String,Object> cp = new HashMap<>();
        String retVal = "Y";
        StringBuilder retMsg = new StringBuilder();
        UserInfoInterface user = SessionManager.getUser();
        long visualId = user.getID();
        try {
            sv.moveVcCustItemData(visualId, itemCode, custType, ownSys, opFlag, sortNo);
        } catch (Exception var19) {
            retVal = "N";
            retMsg.append(CrmLocaleFactory.getFixResource("OFS2000387")).append(var19.getCause() == null ? var19.getMessage() : var19.getCause().getMessage());
            if (log.isErrorEnabled()) {
                log.error(var19.getMessage(), var19);
            }
        }
        cp.put("retVal", retVal);
        cp.put("retMsg", retMsg.toString());
        return cp;
    }
}
