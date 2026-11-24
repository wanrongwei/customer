package com.asiainfo.crm.cm.teaminvoke.out.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.DataContainerInterface;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.omframe.common.service.interfaces.CenterConst;
import com.ai.omframe.instance.ivalues.IInsAccrelValue;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.omframe.instance.service.interfaces.IInstanceQrySV;
import com.ai.omframe.util.SoServiceFactory;
import com.ai.pce.ivalues.IItemValue;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmVpmnCustomerValue;
import com.asiainfo.crm.cm.ln.account.ivalues.IBOCmInsAccrelValue;
import com.asiainfo.crm.cm.service.interfaces.ICmPartySV;
import com.asiainfo.crm.cm.service.interfaces.IVpmnCustomerSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICm2SoSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICustFSV;
import com.asiainfo.crm.constant.OrderConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class CustFSVImpl implements ICustFSV {

	public IBOCmVpmnCustomerValue queryVpmnCustomerByGroupId(long groupId) throws Exception {
		IVpmnCustomerSV vpmnCustomerSV = (IVpmnCustomerSV)ServiceFactory.getService(IVpmnCustomerSV.class);
		return vpmnCustomerSV.queryVpmnCustomerByGroupId(groupId);
	}

	public Map queryUserSplitAccount(long custId, String serviceNumber, long defaultAcctId, long splitAcctId, long splitRuleId , String itemIdName , int start , int end) throws Exception{
		List<DataContainerInterface> dataList = new ArrayList<DataContainerInterface>();
		List resultList = new ArrayList<>();
		int count=0;
		Map result=new HashMap<>();
		result.put("TOTAL",count);
		result.put("LIST",resultList);
		ICm2SoSV iCm2SoSV = (ICm2SoSV) ServiceFactory.getService(ICm2SoSV.class);
		// 当serviceNumber传进来的时候直接通过号码查询用户,否则根据custId遍历用户id
		if (serviceNumber != null && serviceNumber.length() > 0) {
			// 根据userId获取billId
			String number = serviceNumber;
			String regionId = CenterUtil.getRegionIdByBillId(number);
			if (StringUtils.isBlank(regionId)) {
				return result;
			}
			CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
			IInsUserValue insUserValue = SoServiceFactory.getInstanceQrySV().getInstUserByBillId(serviceNumber);
			long userId = insUserValue.getUserId();
			long bCustId = insUserValue.getCustId();
			if(custId != bCustId){
				return result;
			}
			String billId = serviceNumber;
			dataList= this.queryUserSplitAccountDetail(custId, serviceNumber, defaultAcctId, splitAcctId, splitRuleId, itemIdName, userId, billId);
		} else if( splitAcctId!=-1){
			DataContainerInterface[] custAccts = iCm2SoSV.queryAcctByCustId(custId, splitAcctId, "", "", "", 1, -1, -1);
			dataList = queryInsAccrelByAccts(splitRuleId, custAccts);
		}else{// 电话号码没有传进来
			DataContainerInterface[] custAccts = iCm2SoSV.queryAcctByCustId(custId, defaultAcctId, "", "", "", 1, -1, -1);
			dataList = queryInsAccrelByAccts(splitRuleId, custAccts);
		}
		DataContainerInterface[] queryUserSplitAccount  = dataList.toArray(new DataContainerInterface[0]);
		if(queryUserSplitAccount.length > 0){
			if(start>0&end>0){
				for (int i = start - 1; i < queryUserSplitAccount.length && i < end; i++) {
					resultList.add(queryUserSplitAccount[i].getProperties());
				}
			}
			result.put("TOTAL",queryUserSplitAccount.length);
		}
		return result;
	}
	public List<DataContainerInterface> queryUserSplitAccountDetail(long custId, String serviceNumber, long defaultAcctId, long splitAcctId, long splitRuleId, String itemIdName, long userId, String billId) throws Exception {
		IInstanceQrySV iInstanceQrySV = (IInstanceQrySV) ServiceFactory.getService(IInstanceQrySV.class);
		List rtn = new ArrayList();
		DataContainerInterface userSplitAccountDetailNext = queryUserSplitAccountDetailNext(custId, serviceNumber, defaultAcctId, splitAcctId, splitRuleId, itemIdName, userId, billId);
		if(userSplitAccountDetailNext != null){
			rtn.add(userSplitAccountDetailNext);
		}
		// 根据用户id查 分账规则 第二个参数传 1 @return payType:1:默认付费；2：分帐付费；-1：全部
		IInsAccrelValue[] iInsAccrelValues = iInstanceQrySV.getInstAccrelByUserId(userId, 2);
		// 根据userId获取默认账户
		IInsAccrelValue[] iInsAccrelValuesDeafault = iInstanceQrySV.getInstAccrelByUserId(userId, 1);
		long defaultAcctIDQry = 0;
		if (iInsAccrelValuesDeafault != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValuesDeafault) {
				defaultAcctIDQry = iInsAccrelValue.getAcctId();
			}
		}
		// 根据userId获取分账账户
		long splitAcctIdQry = 0;
		if (iInsAccrelValues != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValues) {
				splitAcctIdQry = iInsAccrelValue.getAcctId();
			}
		}
		// 当传入的账户和查询出来的账户id不相同的时候直接返回空
		if (defaultAcctId != -1) {
			if (defaultAcctId != defaultAcctIDQry) {
				return new ArrayList<>();
			}
		}

		if (splitAcctId != -1) {
			if (splitAcctId != splitAcctIdQry) {
				return new ArrayList<>();
			}
		}

		if (iInsAccrelValues != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValues) {
				// 取出分账规则与前台选择的分账规则id进行比较
				long itemId = iInsAccrelValue.getItemId();
				// 获取分账规则名称
				String itemName = "";

				// 根据分账规则ID获取 分账规则详细描述
				IItemValue iItemValue = SoServiceFactory.getCrmProductServce().getUpProductItem(itemId);
				String patternDescription = "";
				if(iItemValue != null){
					patternDescription = iItemValue.getDescription();
					itemName = iItemValue.getName();
				}else{
					itemName = itemIdName;
				}
				// 账户id
				long acctId = iInsAccrelValue.getAcctId();
				// 当分账规则传进来的时候
				if (splitRuleId != -1) {
					if (splitRuleId == itemId) {
						DataContainerInterface acctInfo = new DataContainer();
						acctInfo.set("SUBSCRIBER_NUMBER", billId);
						acctInfo.set("DEFAULT_BAN_FOR_SUBSCRIBER", defaultAcctIDQry);
						acctInfo.set("SPLIT_BILL_BAN_FOR_SUBSCRIBER", acctId);
						acctInfo.set("PATTERN_NAME", itemName);
						acctInfo.set("PATTERN_DESCRIPTION", patternDescription);
						acctInfo.set("SPLIT_BILL_EFFECTIVE_DATE", iInsAccrelValue.getEffectiveDate());
						acctInfo.set("SPLIT_BILL_EXPIRE_DATE", iInsAccrelValue.getExpireDate());
						rtn.add(acctInfo);
					}
				} else {// 当分账规则没有传进来的时候
					DataContainerInterface acctInfo = new DataContainer();
					acctInfo.set("SUBSCRIBER_NUMBER", billId);
					acctInfo.set("DEFAULT_BAN_FOR_SUBSCRIBER", defaultAcctIDQry);
					acctInfo.set("SPLIT_BILL_BAN_FOR_SUBSCRIBER", acctId);
					acctInfo.set("PATTERN_NAME", itemName);
					acctInfo.set("PATTERN_DESCRIPTION", patternDescription);
					acctInfo.set("SPLIT_BILL_EFFECTIVE_DATE", iInsAccrelValue.getEffectiveDate());
					acctInfo.set("SPLIT_BILL_EXPIRE_DATE", iInsAccrelValue.getExpireDate());
					rtn.add(acctInfo);
				}
			}
		}
		return  rtn;
	}
	public DataContainerInterface queryUserSplitAccountDetailNext(long custId, String serviceNumber, long defaultAcctId, long splitAcctId, long splitRuleId, String itemIdName, long userId, String billId) throws Exception {
		DataContainerInterface acctInfo = new DataContainer();
		IInstanceQrySV iInstanceQrySV = (IInstanceQrySV) ServiceFactory.getService(IInstanceQrySV.class);
		List rtn = new ArrayList();
		// 根据用户id查 分账规则 第二个参数传 1 @return payType:1:默认付费；2：分帐付费；-1：全部
		IInsAccrelValue[] iInsAccrelValues = iInstanceQrySV.getInstAccrelByUserId(userId, 2, OrderConst.VALID_TYPE_NEXT);
		// 根据userId获取默认账户
		IInsAccrelValue[] iInsAccrelValuesDeafault = iInstanceQrySV.getInstAccrelByUserId(userId, 1);
		long defaultAcctIDQry = 0;
		if (iInsAccrelValuesDeafault != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValuesDeafault) {
				defaultAcctIDQry = iInsAccrelValue.getAcctId();
			}
		}
		// 根据userId获取分账账户
		long splitAcctIdQry = 0;
		if (iInsAccrelValues != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValues) {
				splitAcctIdQry = iInsAccrelValue.getAcctId();
			}
		}
		// 当传入的账户和查询出来的账户id不相同的时候直接返回空
		if (defaultAcctId != -1) {
			if (defaultAcctId != defaultAcctIDQry) {
				return null;
			}
		}

		if (splitAcctId != -1) {
			if (splitAcctId != splitAcctIdQry) {
				return null;
			}
		}

		if (iInsAccrelValues != null) {
			for (IInsAccrelValue iInsAccrelValue : iInsAccrelValues) {
				// 取出分账规则与前台选择的分账规则id进行比较
				long itemId = iInsAccrelValue.getItemId();
				// 获取分账规则名称
				String itemName = "";

				// 根据分账规则ID获取 分账规则详细描述
				IItemValue iItemValue = SoServiceFactory.getCrmProductServce().getUpProductItem(itemId);
				String patternDescription = "";
				if(iItemValue != null){
					patternDescription = iItemValue.getDescription();
					itemName = iItemValue.getName();
				}else{
					itemName = itemIdName;
				}
				// 账户id
				long acctId = iInsAccrelValue.getAcctId();
				// 当分账规则传进来的时候
				if (splitRuleId != -1) {
					if (splitRuleId == itemId) {
						acctInfo.set("SUBSCRIBER_NUMBER", billId);
						acctInfo.set("DEFAULT_BAN_FOR_SUBSCRIBER", defaultAcctIDQry);
						acctInfo.set("SPLIT_BILL_BAN_FOR_SUBSCRIBER", acctId);
						acctInfo.set("PATTERN_NAME", itemName);
						acctInfo.set("PATTERN_DESCRIPTION", patternDescription);
						acctInfo.set("SPLIT_BILL_EFFECTIVE_DATE", iInsAccrelValue.getEffectiveDate());
						acctInfo.set("SPLIT_BILL_EXPIRE_DATE", iInsAccrelValue.getExpireDate());
						return acctInfo;

					}

				} else {// 当分账规则没有传进来的时候
					acctInfo.set("SUBSCRIBER_NUMBER", billId);
					acctInfo.set("DEFAULT_BAN_FOR_SUBSCRIBER", defaultAcctIDQry);
					acctInfo.set("SPLIT_BILL_BAN_FOR_SUBSCRIBER", acctId);
					acctInfo.set("PATTERN_NAME", itemName);
					acctInfo.set("PATTERN_DESCRIPTION", patternDescription);
					acctInfo.set("SPLIT_BILL_EFFECTIVE_DATE", iInsAccrelValue.getEffectiveDate());
					acctInfo.set("SPLIT_BILL_EXPIRE_DATE", iInsAccrelValue.getExpireDate());
					return acctInfo;

				}

			}
		}
		return null;
	}
	public List<DataContainerInterface>  queryInsAccrelByAccts(long splitRuleId,
															   DataContainerInterface[] custAccts) throws Exception,
			RemoteException {
		List<DataContainerInterface> dataList = new ArrayList<DataContainerInterface>();
		IInstanceQrySV iInstanceQrySV = (IInstanceQrySV) ServiceFactory.getCrossCenterService(IInstanceQrySV.class);
		ICm2SoSV iCm2SoSV = (ICm2SoSV) ServiceFactory.getService(ICm2SoSV.class);
		Map<Long, DataContainer> userMap = new HashMap<Long, DataContainer>();
		for(int i=0;custAccts!=null && i<custAccts.length;i++){

			long acctId = custAccts[i].getAsLong("a.ACCT_ID")==0L?custAccts[i].getAsLong("ACCT_ID"):custAccts[i].getAsLong("a.ACCT_ID");
			IBOCmInsAccrelValue[] insAccrelValue = iCm2SoSV.getInsAccrelsByAcct(acctId, -1, -1, -1);
			for(int index=0;insAccrelValue !=null && index<insAccrelValue.length;index++){

				String desctiption = "";
				long defalutAcct = 0L;
				long splitAcct = 0L;
				if(splitRuleId!=-1L && insAccrelValue[index].getItemId() != splitRuleId){

					log.info("Compare_SplitRuleID:"+insAccrelValue[index].getItemId()+"_"+splitRuleId);
					continue;
				}
				if(!userMap.containsKey(insAccrelValue[index].getUserId())){

					DataContainer dataContainer = new DataContainer();
					String regionId = CenterUtil.getRegionIdByUserId(insAccrelValue[index].getUserId());
					CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
					IInsUserValue insUserValue = SoServiceFactory.getInstanceQrySV().getInstUserByUserId(insAccrelValue[index].getUserId());
					if(insUserValue == null){

						continue;
					}
					dataContainer.set("SUBSCRIBER_NUMBER", insUserValue.getBillId());
					userMap.put(insAccrelValue[index].getUserId(), dataContainer);
				}
				DataContainer dataContainer = userMap.get(insAccrelValue[index].getUserId());

				if(insAccrelValue[index].getPayType()==1){
					defalutAcct = insAccrelValue[index].getAcctId();
					dataContainer.set("DEFAULT_BAN_FOR_SUBSCRIBER", defalutAcct);
				}else{
					if(splitRuleId!=-1L && insAccrelValue[index].getItemId() != splitRuleId){
						log.info("Compare_SplitRuleID:"+insAccrelValue[index].getItemId()+"_"+splitRuleId);
						continue;
					}
					IItemValue itemValue = SoServiceFactory.getCrmProductServce().getUpProductItem(insAccrelValue[index].getItemId());
					dataContainer.set("PATTERN_NAME", "");
					dataContainer.set("PATTERN_DESCRIPTION", "");
					if(itemValue!=null){

						desctiption  = itemValue.getDescription();
						dataContainer.set("PATTERN_NAME", itemValue.getName());
						dataContainer.set("PATTERN_DESCRIPTION", desctiption);
					}

					splitAcct = insAccrelValue[index].getAcctId();
					dataContainer.set("SPLIT_BILL_BAN_FOR_SUBSCRIBER", splitAcct);
					dataContainer.set("SPLIT_BILL_EFFECTIVE_DATE", insAccrelValue[index].getEffectiveDate());
					dataContainer.set("SPLIT_BILL_EXPIRE_DATE", insAccrelValue[index].getExpireDate());
				}
			}
		}

		for(Iterator<Map.Entry<Long,DataContainer>> it = userMap.entrySet().iterator(); it.hasNext();){

			Map.Entry<Long, DataContainer> entry = it.next();
			dataList.add(entry.getValue());
		}

		for (Iterator<DataContainerInterface> iterator = dataList.iterator();iterator.hasNext();) {

			DataContainerInterface dc = iterator.next();
			if(dc.getAsLong("SPLIT_BILL_BAN_FOR_SUBSCRIBER") <= 0l){

				iterator.remove();
				continue;
			}
			if(dc.getAsDateTime("SPLIT_BILL_EXPIRE_DATE").compareTo(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())))<0){

				iterator.remove();
			}
		}
		return dataList;
	}
}
