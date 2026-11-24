package com.asiainfo.crm.cm.inner.common.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.complex.tab.split.SplitTableFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.pce.ivalues.IItemValue;
import com.ai.pce.service.interfaces.IProductFSV;
import com.asiainfo.crm.cm.inner.common.dao.interfaces.ICmCommonInnerDAO;
import com.asiainfo.crm.cm.inner.common.dao.interfaces.ICmSummaryStatsDAO;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsExtValue;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsValue;
import com.asiainfo.crm.cm.inner.common.service.interfaces.ICmSummaryStatsSV;
import com.asiainfo.crm.so.view360.search.vo.AttrVo;
import com.asiainfo.crm.util.View360Utils;
import org.apache.commons.lang.StringUtils;

import java.util.*;

public class CmSummaryStatsSVImpl implements ICmSummaryStatsSV {
    @Override
    public void saveCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        dao.saveCmSummaryStats(value);
    }

    @Override
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue value) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        dao.deleteCmSummaryStats(value);
    }

    @Override
    public void saveCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        dao.saveCmSummaryStats(values);
    }

    @Override
    public void deleteCmSummaryStats(IBOCmSummaryStatsValue[] values) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        dao.deleteCmSummaryStats(values);
    }

    @Override
    public IBOCmSummaryStatsValue getCmSummaryStatsByCustID(long custId) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        return dao.getCmSummaryStatsByCustID(custId);
    }

    @Override
    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCustIDs(long[] custIds) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        return dao.getCmSummaryStatsByCustIDs(custIds);
    }


    @Override
    public List<AttrVo> groupUserByStateCatalog(long custId) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        DataContainer[] dcs = dao.groupUserByStateCatalog(custId);
        IProductFSV productFSV = (IProductFSV) ServiceFactory.getService(IProductFSV.class);
        List<AttrVo> list = new ArrayList();
        if (dcs != null && dcs.length > 0) {
            for (DataContainer dc : dcs) {
                if (StringUtils.isNotBlank(dc.getAsString(IInsUserValue.S_ProdCatalogId)) && dc.getAsLong(IInsUserValue.S_ProdCatalogId)>0) {
                    IItemValue item = productFSV.getProdSpecById(dc.getAsLong(IInsUserValue.S_ProdCatalogId));
                    AttrVo attrVo = new AttrVo();
                    attrVo.setAttrCode(dc.getAsString(IInsUserValue.S_ProdCatalogId));
                    attrVo.setAttrName(item != null ? item.getName() : "");
                    attrVo.setAttrValue(dc.getAsInt("COUNT"));
                    list.add(attrVo);
                }
            }
        }
        return list;
    }

    @Override
    public List<AttrVo> groupUserByState(long custId) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        DataContainer[] dcs = dao.groupUserByState(custId);
        List<AttrVo> list = new ArrayList();
        if (dcs != null && dcs.length > 0) {
            for (DataContainer dc : dcs) {
                if (StringUtils.isNotBlank(dc.getAsString(IInsUserValue.S_State))) {
                    AttrVo attrVo = new AttrVo();
                    attrVo.setAttrCode(dc.getAsString(IInsUserValue.S_State));
                    attrVo.setAttrName(View360Utils.getUserStateName(dc.getAsString(IInsUserValue.S_State)));
                    attrVo.setAttrValue(dc.getAsInt("COUNT"));
                    list.add(attrVo);
                }
            }
        }
        return list;
    }

    @Override
    public IBOCmSummaryStatsValue[] getCmSummaryStatsByCondition(Map condition, int start, int end) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        return dao.getCmSummaryStatsByCondition(condition, start, end);
    }

    @Override
    public IBOCmSummaryStatsExtValue[] getCmSummaryStatsExtByCondition(Map condition, int start, int end) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        return dao.getCmSummaryStatsExtByCondition(condition, start, end);
    }

    public void saveCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        if (values != null && values.length > 0) {
            for (IBOCmSummaryStatsExtValue value : values) {
                if (value.getId() == 0) {
                    value.setId(dao.getCmSummaryExtId());
                }
            }
            dao.saveCmSummaryExtStats(values);
        }
    }

    public void deleteCmSummaryExtStats(IBOCmSummaryStatsExtValue[] values) throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        dao.deleteCmSummaryExtStats(values);
    }

    public long getCmSummaryExtId() throws Exception {
        ICmSummaryStatsDAO dao = (ICmSummaryStatsDAO) ServiceFactory.getService(ICmSummaryStatsDAO.class);
        return dao.getCmSummaryExtId();
    }

    public void synTaskFromIndivCustomer() throws Exception {
        ICmCommonInnerDAO dao = (ICmCommonInnerDAO) ServiceFactory.getService(ICmCommonInnerDAO.class);
        String sql = "INSERT INTO {CM_SUMMARY_TASK} (CUSTOMER_ID,CUST_NAME,CUST_TYPE,CUST_STATUS) " +
                "  SELECT CUST_ID,CUST_NAME,1 CUST_TYPE,CUST_STATUS FROM {CM_INDIV_CUSTOMER} T WHERE " +
                "   NOT EXISTS(SELECT 1 FROM  {CM_SUMMARY_TASK} A WHERE A.CUSTOMER_ID=T.CUST_ID AND a.CUST_TYPE=1) AND  T.CUST_STATUS =1 ";
        dao.executeSql(SplitTableFactory.createQuerySQL(sql, new HashMap()), new HashMap());
    }

    public void updateFromIndivCustomer() throws Exception {
        ICmCommonInnerDAO dao = (ICmCommonInnerDAO) ServiceFactory.getService(ICmCommonInnerDAO.class);
        String sql = "UPDATE  {CM_SUMMARY_TASK} SET " +
                "  CUST_STATUS=(SELECT t.CUST_STATUS FROM {CM_INDIV_CUSTOMER} t WHERE t.cust_id=customer_id)" +
                "  WHERE  CUST_TYPE =1 ";
        dao.executeSql(SplitTableFactory.createQuerySQL(sql, new HashMap()), new HashMap());
    }

    public void updateFromGroupCustomer() throws Exception {
        ICmCommonInnerDAO dao = (ICmCommonInnerDAO) ServiceFactory.getService(ICmCommonInnerDAO.class);
        String sql = "UPDATE  {CM_SUMMARY_TASK} SET " +
                "  CUST_STATUS=(SELECT t.CUST_STATUS FROM {CM_GROUP_CUSTOMER} t WHERE t.cust_id=customer_id)" +
                "  WHERE  CUST_TYPE =3 ";
        dao.executeSql(SplitTableFactory.createQuerySQL(sql, new HashMap()), new HashMap());
    }

    public void synTaskFromGroupCustomer() throws Exception {
        ICmCommonInnerDAO dao = (ICmCommonInnerDAO) ServiceFactory.getService(ICmCommonInnerDAO.class);
        String sql = "INSERT INTO {CM_SUMMARY_TASK} (CUSTOMER_ID,CUST_NAME,CUST_TYPE,CUST_STATUS) " +
                "  SELECT CUST_ID,CUST_NAME,3 CUST_TYPE,CUST_STATUS FROM {CM_GROUP_CUSTOMER} T WHERE " +
                "   NOT EXISTS(SELECT 1 FROM  {CM_SUMMARY_TASK} A WHERE A.CUSTOMER_ID=T.CUST_ID AND a.CUST_TYPE=3) AND  T.CUST_STATUS =1 ";
        dao.executeSql(SplitTableFactory.createQuerySQL(sql, new HashMap()), new HashMap());
    }

    public void updateSummaryTask(String setInfo,String condition,Map map) throws Exception {
        ICmCommonInnerDAO dao = (ICmCommonInnerDAO) ServiceFactory.getService(ICmCommonInnerDAO.class);
        String sql = "UPDATE {CM_SUMMARY_TASK} SET  " +setInfo+"  WHERE 1=1 "+condition;
        dao.executeSql(SplitTableFactory.createQuerySQL(sql, map), map);
    }
}