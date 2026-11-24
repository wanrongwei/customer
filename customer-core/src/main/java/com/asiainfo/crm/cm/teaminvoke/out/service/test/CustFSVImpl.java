package com.asiainfo.crm.cm.teaminvoke.out.service.test;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.ExceptionUtil;
import com.ai.omframe.instance.ivalues.IInsAccrelValue;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.CmServiceFactory;
import com.asiainfo.crm.cm.common.CmxServiceFactory;
import com.asiainfo.crm.cm.common.util.CmCommonUtil;
import com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmVpmnCustomerValue;
import com.asiainfo.crm.cm.model.ivalues.IAccountProfileValue;
import com.asiainfo.crm.cm.model.ivalues.IAcctBillCycleValue;
import com.asiainfo.crm.cm.service.interfaces.ICmAccountSV;
import com.asiainfo.crm.cm.service.interfaces.ICmGroupCustomerSV;
import com.asiainfo.crm.cm.service.interfaces.IVpmnCustomerSV;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICustFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmExtFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.asiainfo.crm.util.StringUtil.isEmpty;


public class CustFSVImpl{

	private ICrmFSV getCrm2CmFSV() {
		return (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);

	}

	public Map queryAcctPaymentInfos(Map parameter) throws Exception {

		Map returnMap = new HashMap();// 返回Map

		returnMap.put("returnCode", "0");

		returnMap.put("returnMsg", "Query account information ok");

		Map acctUserSnMap = new HashMap();

		// log.debug("map*******="+parameter);

		if (!isEmpty(parameter.get("ServiceNum"))) {

			IInsUserValue insValues = getCrm2CmFSV().getInsUser(0, parameter.get("ServiceNum").toString());

			if (insValues == null) {

				ExceptionUtil.throwBusinessException("CMS0000202");

			}

			IInsAccrelValue[] acctVs = getCrm2CmFSV().getInstAccrel(0, parameter.get("ServiceNum").toString());

			if (acctVs != null && acctVs.length > 0) {

				List acctList = new ArrayList();

				for (int i = 0; i < acctVs.length; i++) {

					Map acctMap = new HashMap();

					long acctId = acctVs[i].getAcctId();

					IAccountProfileValue acctProfile = CmxServiceFactory.getLnAccountSV().queryAccountProfileByAcctId(acctId);



					if (acctProfile == null)

						continue;

					acctMap.put("InstallmentFlag", acctProfile.getInstallmentFlag());



					acctMap.put("PayMethod", acctProfile.getPayMethod());

					acctMap.put("AccId", acctProfile.getAcctId());

					acctMap.put("CustId", acctProfile.getCustId());

					acctMap.put("BillDay", acctProfile.getBillDay());

					acctMap.put("BillDueDate", acctProfile.getBillDueDate());

					// modify by caiyu 20121025

					// 应外围接口-电渠要求，增加信用级别的中文翻译CrtLevelName

					long cid = acctProfile.getCustId();

					int custType = CmCommonUtil.getCustType(cid);

					if (custType == CmConstants.CustomerType.INDIVIDUAL) {

						// 个人客户

						// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_CREDIT_LEVEL",

						// String.valueOf(acctProfile.getCreditLevel()));

						// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

					} else if (custType == CmConstants.CustomerType.GROUP) {

						// 集团客户

						// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_GRP_CREDIT_LEVEL",

						// String.valueOf(acctProfile.getCreditLevel()));

						// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

					} else if (custType == CmConstants.CustomerType.FAMILY) {

						// 家庭客户

						// TODO:预留家庭客户翻译

					} else if (custType == CmConstants.CustomerType.VIRTUAL) {

						// 虚拟客户

						// TODO:预留虚拟客户翻译

					}



					acctMap.put("AccType", acctProfile.getAcctType());

					acctMap.put("AccStatus", acctProfile.getAcctStatus());

					acctMap.put("AccName", acctProfile.getAcctName());



					acctMap.put("CreditLevel", acctProfile.getCreditLevel());

					acctMap.put("CreditValue", acctProfile.getCreditValue());

					acctMap.put("UrgeStopFlag", acctProfile.getUrgeStopFlag());



					// 用户数据

					acctMap.put("RegionId", insValues.getRegionId());

					acctMap.put("CountyId", insValues.getCountryCode());

					// 以后添加

					acctMap.put("AccExtendInfo", "");



					IAcctBillCycleValue billCyle = getAccountSV().queryCurrAcctBillCyclesByAcctId(acctId);



					if (billCyle != null)

						acctMap.put("AccCycle", billCyle.getBillDay());

					acctList.add(acctMap);



				}

				Map aMap = new HashMap();

				aMap.put("AcctInfo", acctList);

				returnMap.put("returnObj", aMap);

				return returnMap;

			} else {

				ExceptionUtil.throwBusinessException("CMS95000036");

			}

		} else if (!isEmpty(parameter.get("UserId")) && Long.valueOf(parameter.get("UserId").toString()) > 0) {

			IInsUserValue insValues = getCrm2CmFSV().getInsUser(Long.valueOf(parameter.get("UserId").toString()), null);

			if (insValues == null) {

				ExceptionUtil.throwBusinessException("CMS0000202");

			}

			IInsAccrelValue[] acctVs = getCrm2CmFSV().getInstAccrel(Long.valueOf(parameter.get("UserId").toString()), "");

			if (null != acctVs && acctVs.length > 0) {

				List acctList = new ArrayList();

				for (int i = 0; i < acctVs.length; i++) {

					Map acctMap = new HashMap();

					long acctId = acctVs[i].getAcctId();

					IAccountProfileValue acctProfile = CmxServiceFactory.getLnAccountSV().queryAccountProfileByAcctId(acctId);



					if (acctProfile == null)

						continue;



					acctMap.put("PayMethod", acctProfile.getPayMethod());

					acctMap.put("AccId", acctProfile.getAcctId());

					acctMap.put("CustId", acctProfile.getCustId());

					acctMap.put("InstallmentFlag", acctProfile.getInstallmentFlag());

					acctMap.put("BillDueDate", acctProfile.getBillDueDate());

					// modify by caiyu 20121025

					// 应外围接口-电渠要求，增加信用级别的中文翻译CreditLevelName

					long cid = acctProfile.getCustId();

					int custType = CmCommonUtil.getCustType(cid);

					if (custType == CmConstants.CustomerType.INDIVIDUAL) {

						// 个人客户

						// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_CREDIT_LEVEL",

						// String.valueOf(acctProfile.getCreditLevel()));

						// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

					} else if (custType == CmConstants.CustomerType.GROUP) {

						// 集团客户

						// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_GRP_CREDIT_LEVEL",

						// String.valueOf(acctProfile.getCreditLevel()));

						// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

					} else if (custType == CmConstants.CustomerType.FAMILY) {

						// 家庭客户

						// TODO:预留家庭客户翻译

					} else if (custType == CmConstants.CustomerType.VIRTUAL) {

						// 虚拟客户

						// TODO:预留虚拟客户翻译

					}



					acctMap.put("AccType", acctProfile.getAcctType());

					acctMap.put("AccStatus", acctProfile.getAcctStatus());

					acctMap.put("AccName", acctProfile.getAcctName());



					acctMap.put("CreditLevel", acctProfile.getCreditLevel());

					acctMap.put("CreditValue", acctProfile.getCreditValue());

					acctMap.put("UrgeStopFlag", acctProfile.getUrgeStopFlag());



					// 用户数据

					acctMap.put("RegionId", insValues.getRegionId());

					acctMap.put("CountyId", insValues.getCountryCode());

					// 以后添加

					acctMap.put("AccExtendInfo", "");

					// 添加出账日

					acctMap.put("BillDay", acctProfile.getBillDay());



					IAcctBillCycleValue billCyle = getAccountSV().queryCurrAcctBillCyclesByAcctId(acctId);



					if (billCyle != null)

						acctMap.put("AccCycle", billCyle.getBillDay());



					acctList.add(acctMap);

				}

				Map aMap = new HashMap();

				aMap.put("AcctInfo", acctList);

				returnMap.put("returnObj", aMap);

				return returnMap;

			} else {

				ExceptionUtil.throwBusinessException("CMS95000036");



			}

		} else if (!isEmpty(parameter.get("AcctId")) && Long.valueOf(parameter.get("AcctId").toString()) > 0) {

			IAccountProfileValue acctProfile = CmxServiceFactory.getLnAccountSV().queryAccountProfileByAcctId(Long.valueOf(parameter.get("AcctId").toString()));



			if (acctProfile == null) {

				ExceptionUtil.throwBusinessException("CMS5000151", parameter.get("AcctId").toString());

			} else {

				Map acctMap = new HashMap();

				List acctList = new ArrayList();

				acctMap.put("PayMethod", acctProfile.getPayMethod());

				acctMap.put("AccId", acctProfile.getAcctId());

				acctMap.put("CustId", acctProfile.getCustId());

				acctMap.put("InstallmentFlag", acctProfile.getInstallmentFlag());

				acctMap.put("BillDueDate", acctProfile.getBillDueDate());

				// modify by caiyu 20121025

				// 应外围接口-电渠要求，增加信用级别的中文翻译CreditLevelName

				long cid = acctProfile.getCustId();

				int custType = CmCommonUtil.getCustType(cid);

				if (custType == CmConstants.CustomerType.INDIVIDUAL) {

					// 个人客户

					// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_CREDIT_LEVEL",

					// String.valueOf(acctProfile.getCreditLevel()));

					// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

				} else if (custType == CmConstants.CustomerType.GROUP) {

					// 集团客户

					// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_GRP_CREDIT_LEVEL",

					// String.valueOf(acctProfile.getCreditLevel()));

					// acctMap.put("CrtLevelName", staticDataValue.getCodeName());

				} else if (custType == CmConstants.CustomerType.FAMILY) {

					// 家庭客户

					// TODO:预留家庭客户翻译

				} else if (custType == CmConstants.CustomerType.VIRTUAL) {

					// 虚拟客户

					// TODO:预留虚拟客户翻译

				}



				acctMap.put("AccType", acctProfile.getAcctType());

				acctMap.put("AccStatus", acctProfile.getAcctStatus());

				acctMap.put("AccName", acctProfile.getAcctName());



				acctMap.put("CreditLevel", acctProfile.getCreditLevel());

				acctMap.put("CreditValue", acctProfile.getCreditValue());

				acctMap.put("UrgeStopFlag", acctProfile.getUrgeStopFlag());

				// 添加出账日

				acctMap.put("BillDay", acctProfile.getBillDay());

				// 用户数据

				// IInsUserValue insValues =

				// getCrm2CmFSV().getInsUser(acctProfile.getUserId(), null);

				ICmGroupCustomerSV cnGroupSv = (ICmGroupCustomerSV) ServiceFactory.getService(ICmGroupCustomerSV.class);

				long groupCustId = acctProfile.getCustId();

				com.asiainfo.crm.cm.inner.customer.ivalues.IBOCmGroupCustomerValue cmGroupValue = cnGroupSv.queryGroupCustInfoByCustId(groupCustId);

				if (null != cmGroupValue) {

					acctMap.put("RegionId", cmGroupValue.getRegionId());

					acctMap.put("CountyId", cmGroupValue.getCountyId());

				} else {

					acctMap.put("RegionId", "");

					acctMap.put("CountyId", "");

				}



				// 以后添加

				acctMap.put("AccExtendInfo", "");



				IAcctBillCycleValue billCyle = getAccountSV().queryCurrAcctBillCyclesByAcctId(acctProfile.getAcctId());



				if (billCyle != null) {

					acctMap.put("AccCycle", billCyle.getBillDay());

				} else {

					// modify by caiyu 默认帐期日为1；

					acctMap.put("AccCycle", 1);

				}



				Map aMap = new HashMap();

				acctList.add(acctMap);

				aMap.put("AcctInfo", acctList);

				returnMap.put("returnObj", aMap);



				return returnMap;

			}

		} else if (!isEmpty(parameter.get("CustId")) && Long.parseLong(parameter.get("CustId").toString()) > 0) {



			// modify by caiyu 20121025 根据custid查询账户，需要先查询cm_cust_acct_rel表

			long custId = Long.parseLong(parameter.get("CustId").toString());



			long installmentFlag = -1;

			if (!isEmpty(parameter.get("InstallmentFlag")) && Long.parseLong(parameter.get("InstallmentFlag").toString()) >= 0) {

				installmentFlag = Long.parseLong(parameter.get("InstallmentFlag").toString());

			}

			IAccountProfileValue[] values = CmServiceFactory.getAccountSV().queryAcctDtsByIdAndInstallmentFlag(-1, custId, installmentFlag, -1, -1);



			// log.debug("^^^^^^^^^^^^^^^^*******");

			// dc.set(IAccountProfileValue.S_CustId,

			// Long.parseLong(parameter.get("CustId").toString()));

			// log.debug("dc="+dc);

			// log.debug("^^^^^^^^^^^^^^^^*******");

			// IAccountProfileValue[] values =

			// CmxServiceFactory.getLnAccountSV().queryAccountProfiles(dc, min,

			// max);

			// log.debug("values="+values);

			// log.debug("^^^^^^^^^^^^^^^^*******");



			if (values != null && values.length > 0) {

				List acctList = new ArrayList();

				// System.out.print("values:" + values.length);//

				for (IAccountProfileValue value : values) {

					Map acctMap = new HashMap();



					acctMap.put("PayMethod", value.getPayMethod());

					acctMap.put("AccId", value.getAcctId());

					acctMap.put("CustId", value.getCustId());

					acctMap.put("InstallmentFlag", value.getInstallmentFlag());

					acctMap.put("BillDueDate", value.getBillDueDate());

					acctMap.put("BillDay", value.getBillDay());

					// modify by caiyu 20121025

					// 应外围接口-电渠要求，增加信用级别的中文翻译CreditLevelName

					long cid = value.getCustId();

					int custType = CmCommonUtil.getCustType(cid);

					if (custType == CmConstants.CustomerType.INDIVIDUAL) {

						// 个人客户

						// IBOBsStaticDataValue staticDataValue = StaticDataUtil.getStaticData("CM_CREDIT_LEVEL",

						// String.valueOf(value.getCreditLevel()));

						// String indivCrtName = staticDataValue == null ? "" : staticDataValue.getCodeName();

						// acctMap.put("CrtLevelName", indivCrtName);

					} else if (custType == CmConstants.CustomerType.GROUP) {

						// 集团客户

						// groupCrtname = staticDataValue == null ? "" : staticDataValue.getCodeName();

						// acctMap.put("CrtLevelName", groupCrtname);

					} else if (custType == CmConstants.CustomerType.FAMILY) {

						// 家庭客户

						// TODO:预留家庭客户翻译

					} else if (custType == CmConstants.CustomerType.VIRTUAL) {

						// 虚拟客户

						// TODO:预留虚拟客户翻译

					}



					acctMap.put("AccType", value.getAcctType());

					acctMap.put("AccStatus", value.getAcctStatus());

					acctMap.put("AccName", value.getAcctName());



					acctMap.put("CreditLevel", value.getCreditLevel());

					acctMap.put("CreditValue", value.getCreditValue());

					acctMap.put("UrgeStopFlag", value.getUrgeStopFlag());



					// 用户数据

					acctMap.put("RegionId", value.getRegionId());

					acctMap.put("CountyId", "");

					// 以后添加

					acctMap.put("AccExtendInfo", "");



					IAcctBillCycleValue billCyle = getAccountSV().queryCurrAcctBillCyclesByAcctId(value.getAcctId());



					if (billCyle != null)

						acctMap.put("AccCycle", billCyle.getCycleType());

					else

						acctMap.put("AccCycle", 5);



					acctList.add(acctMap);

				}

				Map aMap = new HashMap();

				aMap.put("AcctInfo", acctList);

				returnMap.put("returnObj", aMap);

				return returnMap;

			}

		}

		return acctUserSnMap;

	}
	private ICmAccountSV getAccountSV() {
		return (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);

	}
	public boolean updateAcctInfo4CPA(long acctId, String cycleType, String billDate) throws Exception {
		ICrmExtFSV fsv = (ICrmExtFSV) ServiceFactory.getService(ICrmExtFSV.class);
		return fsv.updateAcctInfo4CPA(acctId, cycleType, "1", billDate);
	}

}
