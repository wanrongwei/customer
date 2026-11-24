package com.asiainfo.crm.cm.inner.common.dao.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.complex.tab.split.SplitTableFactory;
import com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStatsBean;
import com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStatsEngine;
import com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStatsExtBean;
import com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStatsExtEngine;
import com.asiainfo.crm.cm.inner.common.dao.interfaces.ICmSummaryStatsDAO;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsExtValue;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsValue;
import com.asiainfo.crm.cm.inner.util.CmInnerServiceFactory;

import java.util.HashMap;
import java.util.Map;

public class CmSummaryStatsDAOImpl implements ICmSummaryStatsDAO {
    @Override
    public void saveCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception {
        BOCmSummaryStatsEngine.save(value);
    }

    @Override
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception {
        value.delete();
        BOCmSummaryStatsEngine.save(value);
    }

    @Override
    public void saveCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception {
        BOCmSummaryStatsEngine.save(values);
    }

    @Override
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception {
      for(IBOCmSummaryStatsValue value:values){
            value.delete();
        }
        BOCmSummaryStatsEngine.saveBatch(values);
    }

    @Override
    public IBOCmSummaryStatsValue getCmSummaryStatsByCustID(long custId) throws Exception {
        String condition = "CUSTOMER_ID = :S_CUSTOMER_ID";
        Map map = new HashMap();
        map.put("S_CUSTOMER_ID",custId);
        BOCmSummaryStatsBean[] beans = BOCmSummaryStatsEngine.getBeans(condition,map);
        if(beans!=null && beans.length==1) {
            return beans[0];
        }
        return null;
    }

    @Override
    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCustIDs(long[] custIds) throws Exception {
        String condition = "CUSTOMER_ID IN (:S_CUSTOMER_ID) ";
        Map map = new HashMap();
        //先将custIds转成String,再用，拼接
        StringBuilder sb = new StringBuilder();
        for (long custId : custIds) {
            sb.append(custId).append(",");
        }
        // 删除最后一个逗号
        if (sb.length() > 0) {
            sb.setLength(sb.length() - 1);
        }
        map.put("S_CUSTOMER_ID", sb.toString());
        BOCmSummaryStatsBean[] beans = BOCmSummaryStatsEngine.getBeans(condition,map);
        return beans;
    }


    public DataContainer[] groupUserByStateCatalog(long custId) throws Exception{
        String condition = "SELECT PROD_CATALOG_ID,COUNT(USER_ID) COUNT FROM {CM_INS_CMREL} A " +
                "WHERE A.STATE = 1 AND A.CUST_ID = :CUST_ID " +
                " AND RELA_TYPE=2 AND offer_id !=70130 " +
                " GROUP BY PROD_CATALOG_ID ";
        HashMap map = new HashMap();
        map.put("CUST_ID", custId);
        String sql = SplitTableFactory.createQuerySQL(condition, map);
        DataContainer[] insValues = (DataContainer[]) CmInnerServiceFactory.getCommonInnerSV().getBeansFromSql(DataContainer.class, sql, map);
        return insValues;
    }

    public DataContainer[] groupUserByState(long custId) throws Exception{
        String condition = "SELECT  (CASE WHEN ext2 LIKE '%1%' AND ext1 <> 3 THEN 8 ELSE  ext1 END) STATE,COUNT(USER_ID) COUNT FROM {CM_INS_CMREL} A " +
                "WHERE A.STATE = 1 AND A.CUST_ID = :CUST_ID " +
                " AND RELA_TYPE=2 " +
                " AND offer_id !=70130 " +
                " GROUP BY  (CASE WHEN ext2 LIKE '%1%' AND ext1 <> 3 THEN 8 ELSE  ext1 END) ";
        HashMap map = new HashMap();
        map.put("CUST_ID", custId);
        String sql = SplitTableFactory.createQuerySQL(condition, map);
        DataContainer[] insValues = (DataContainer[]) CmInnerServiceFactory.getCommonInnerSV().getBeansFromSql(DataContainer.class, sql, map);
        return insValues;
    }

    @Override
    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCondition(Map condition,int start,int end) throws Exception {
        StringBuffer bf = new StringBuffer(" 1=1 ");
       if(!condition.isEmpty()){
           //loop map中的key
           for(Object key:condition.keySet()){
               bf.append(" AND ").append(key).append(" = :").append(key).append(" ");
           }
       }
       BOCmSummaryStatsBean[] beans = BOCmSummaryStatsEngine.getBeans(null,bf.toString(),condition,start,end,false);
       return beans;
    }

    @Override
    public IBOCmSummaryStatsExtValue[] getCmSummaryStatsExtByCondition(Map condition, int start, int end) throws Exception {
        StringBuffer bf = new StringBuffer(" 1=1 ");
        if(!condition.isEmpty()){
            //loop map中的key
            for(Object key:condition.keySet()){
                bf.append(" AND ").append(key).append(" = :").append(key).append(" ");
            }
        }
        BOCmSummaryStatsExtBean[] beans = BOCmSummaryStatsExtEngine.getBeans(null,bf.toString(),condition,start,end,false);
        return beans;
    }

    @Override
    public void saveCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception {
        BOCmSummaryStatsExtEngine.saveBatch(values);
    }

    @Override
    public void deleteCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception {
        for(IBOCmSummaryStatsExtValue value:values){
            value.delete();
        }
        BOCmSummaryStatsExtEngine.saveBatch(values);
    }

    @Override
    public long getCmSummaryExtId() throws Exception {
        return BOCmSummaryStatsExtEngine.getNewId().longValue();
    }

}
