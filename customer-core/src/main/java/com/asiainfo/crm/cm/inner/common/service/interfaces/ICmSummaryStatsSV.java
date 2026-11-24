package com.asiainfo.crm.cm.inner.common.service.interfaces;

import com.ai.appframe2.bo.DataContainer;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsExtValue;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsValue;
import com.asiainfo.crm.so.view360.search.vo.AttrVo;

import java.util.List;
import java.util.Map;

public interface ICmSummaryStatsSV {
    //保存CmSummaryStats数据
    public void saveCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception;
    //删除数据
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception;
    //批量保存数据
    public void saveCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception;
    //批量删除数据
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception;

    public IBOCmSummaryStatsValue getCmSummaryStatsByCustID(long custId) throws Exception;

    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCustIDs(long[] custIds) throws Exception;

    public List<AttrVo> groupUserByStateCatalog(long custId) throws Exception;

    public List<AttrVo> groupUserByState(long custId) throws Exception;

    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCondition(Map condition,int start,int end) throws Exception ;
    public IBOCmSummaryStatsExtValue[] getCmSummaryStatsExtByCondition(Map condition, int start, int end) throws Exception;
    public void saveCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception;
    public void deleteCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception;
    public long getCmSummaryExtId() throws Exception;

    public void synTaskFromIndivCustomer() throws Exception ;
    public void synTaskFromGroupCustomer() throws Exception ;

    public void updateFromGroupCustomer() throws Exception;
    public void updateFromIndivCustomer() throws Exception;

    public void updateSummaryTask(String setInfo,String condition,Map map) throws Exception;


}
