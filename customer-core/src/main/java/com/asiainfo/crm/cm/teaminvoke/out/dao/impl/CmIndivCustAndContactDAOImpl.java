package com.asiainfo.crm.cm.teaminvoke.out.dao.impl;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.ai.appframe2.common.ServiceManager;
import com.ai.common.util.TimeUtil;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.inner.contact.bo.BOCmContactEngine;
import com.asiainfo.crm.cm.inner.contact.ivalues.IBOCmContactValue;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmGroupCustomerBean;
import com.asiainfo.crm.cm.inner.customer.bo.BOCmIndivCustomerBean;
import com.asiainfo.crm.cm.inner.customer.bo.QBOCmIndivCustAndContactEngine;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmGroupCustomerValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmIndivCustomerValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IQBOCmIndivCustAndContactValue;
import com.asiainfo.crm.cm.teaminvoke.out.dao.interfaces.ICmIndivCustAndContactDAO;
import org.apache.commons.collections.MapUtils;

public class CmIndivCustAndContactDAOImpl implements ICmIndivCustAndContactDAO
{

	public IQBOCmIndivCustAndContactValue queryIndivCustAndContactById(long indivCustId) throws Exception
	{
		Map parameter = new HashMap();
		StringBuilder condition = new StringBuilder();
		Timestamp sysdate = ServiceManager.getIdGenerator().getSysDate();
		 Timestamp curMaxDate = TimeUtil.getCurrentDayEndDate(sysdate);
		condition.append(IQBOCmIndivCustAndContactValue.S_IndivCustId).append(" = :indivCustId ");
		parameter.put("indivCustId", Long.valueOf(indivCustId));
		condition.append(" AND ").append(IQBOCmIndivCustAndContactValue.S_EffectiveDate).append(" <= ").append(
				":currentDate ");
		condition.append(" AND ").append(IQBOCmIndivCustAndContactValue.S_ExpireDate).append(" > ").append(
				" now() ");
		parameter.put("currentDate", curMaxDate);
		IQBOCmIndivCustAndContactValue[] indivCustAndContactValues = QBOCmIndivCustAndContactEngine.getBeans(condition
				.toString(), parameter);
		return (indivCustAndContactValues == null || indivCustAndContactValues.length == 0) ? null
				: indivCustAndContactValues[0];
	}

	public void saveContactValue(IBOCmContactValue contactValue) throws Exception {
		BOCmContactEngine.save(contactValue);
	}

	public long getNewId() throws Exception{
		return BOCmContactEngine.getNewId().longValue();
	}

	@Override
	public BOCmIndivCustomerBean[] queryIndivCustInfolikeCustId(Map map, int start, int end) throws Exception {
		StringBuffer condition = new StringBuffer(" 1=1 ");
		Map parameters = new HashMap();
		if(map.containsKey("custId")&&map.get("custId")!=null){
			condition.append(" and ").append(IBOCmIndivCustomerValue.S_CustId).append(" like :custId ");
			parameters.put("custId", MapUtils.getString(map,"custId")+ "%");
		}
		if(map.containsKey("custName")&&map.get("custName")!=null){
			condition.append(" and ").append(IBOCmIndivCustomerValue.S_CustName).append(" like :custName ");
			parameters.put("custName", "%"+ MapUtils.getString(map,"custName")+ "%");
		}
		condition.append(" and ").append(IBOCmIndivCustomerValue.S_IndivCustType).append("= 1 ");
		BOCmIndivCustomerBean[] gMgrRel = com.asiainfo.crm.cm.inner.customer.bo.BOCmIndivCustomerEngine.getBeans(null,condition.toString(),
				parameters, start, end, false);

		// 修改可能的隐患
		if (CmCommonUtil.isEmptyObject(gMgrRel)) {
			return null;
		}
		return gMgrRel;
	}

	@Override
	public int queryIndivCustInfolikeCustIdCount(Map map) throws Exception {
		StringBuffer condition = new StringBuffer(" 1=1 ");
		Map parameters = new HashMap();
		if(map.containsKey("custId")&&map.get("custId")!=null){
			condition.append(" and ").append(IBOCmIndivCustomerValue.S_CustId).append(" like :custId ");
			parameters.put("custId", MapUtils.getString(map,"custId")+ "%");
		}
		if(map.containsKey("custName")&&map.get("custName")!=null){
			condition.append(" and ").append(IBOCmIndivCustomerValue.S_CustName).append(" like :custName ");
			parameters.put("custName", "%"+ MapUtils.getString(map,"custName")+ "%");
		}
		condition.append(" and ").append(IBOCmIndivCustomerValue.S_IndivCustType).append("= 1 ");
		return  com.asiainfo.crm.cm.inner.customer.bo.BOCmIndivCustomerEngine.getBeansCount(condition.toString(),
				parameters);
	}
	public BOCmIndivCustomerBean[] queryIndivCustInfos(String custids) throws Exception{
		StringBuffer condition = new StringBuffer();
		Map parameters = new HashMap();
		condition.append(IBOCmIndivCustomerValue.S_CustId).append(" in (").append(custids).append(") ");
		BOCmIndivCustomerBean[] gMgrRel = com.asiainfo.crm.cm.inner.customer.bo.BOCmIndivCustomerEngine.getBeans(null,condition.toString(),
				parameters, -1, -1, false);
		// 修改可能的隐患
		if (CmCommonUtil.isEmptyObject(gMgrRel)) {
			return null;
		}
		return gMgrRel;
	}



}
