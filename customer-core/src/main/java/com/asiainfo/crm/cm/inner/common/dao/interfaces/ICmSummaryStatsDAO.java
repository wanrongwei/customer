package com.asiainfo.crm.cm.inner.common.dao.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsExtValue;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsValue;

import java.util.Map;

public interface ICmSummaryStatsDAO {
     //保存CmSummaryStats数据
    public void saveCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception;
    //删除数据
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception;
    //批量保存数据
    public void saveCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception;
    //批量删除数据
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception;
    //根据CustID查询CmSummaryStats数据
    public IBOCmSummaryStatsValue getCmSummaryStatsByCustID(long custId) throws Exception;

    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCustIDs(long[] custIds) throws Exception;

    public DataContainer[] groupUserByStateCatalog(long custId) throws Exception;

    public DataContainer[] groupUserByState(long custId) throws Exception;
    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCondition(Map condition,int start,int end) throws Exception;
    public IBOCmSummaryStatsExtValue[] getCmSummaryStatsExtByCondition(Map condition, int start, int end) throws Exception;
    public void saveCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception;
    public void deleteCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception;
    public long getCmSummaryExtId() throws Exception;

}
