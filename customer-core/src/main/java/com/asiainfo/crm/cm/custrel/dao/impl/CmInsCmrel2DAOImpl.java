package com.asiainfo.crm.cm.custrel.dao.impl;

import com.ai.appframe2.complex.tab.split.SplitTableFactory;
import com.ai.omframe.instance.ivalues.IInsCmRelValue;
import com.asiainfo.crm.cm.common.bo.BOCmInsCmrelBean;
import com.asiainfo.crm.cm.common.bo.BOCmInsCmrelEngine;
import com.asiainfo.crm.cm.custrel.dao.interfaces.ICmInsCmrel2DAO;

import java.util.HashMap;
import java.util.Map;

public class CmInsCmrel2DAOImpl implements ICmInsCmrel2DAO {
    @Override
    public BOCmInsCmrelBean[] queryCmInsCmrelUserIds(String custIds, long realType) throws Exception {
        HashMap map = new HashMap();
        StringBuilder builder = new StringBuilder("select distinct user_id from {CM_INS_CMREL} where  ");
        builder.append(IInsCmRelValue.S_CustId + " in (").append(custIds).append(')');
        if(realType > 0){
            builder.append(" AND ").append(IInsCmRelValue.S_RelaType + "=:realType");
            map.put("realType", realType);
        }
        builder.append(" AND ").append(IInsCmRelValue.S_State + "=:state");
        map.put("state", 1);

        String custId = custIds.split(",")[0];
        Map params = new HashMap();
        params.put(BOCmInsCmrelBean.S_CustId,custId);
        String sql= SplitTableFactory.createQuerySQL(builder.toString(),params);
        return BOCmInsCmrelEngine.getBeansFromSql(sql, map);
    }
}
