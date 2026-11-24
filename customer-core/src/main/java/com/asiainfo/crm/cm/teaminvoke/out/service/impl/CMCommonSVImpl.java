package com.asiainfo.crm.cm.teaminvoke.out.service.impl;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.complex.center.CenterFactory;
import com.ai.appframe2.service.ServiceFactory;
import com.ai.common.util.CenterUtil;
import com.ai.omframe.common.service.interfaces.CenterConst;
import com.ai.omframe.instance.ivalues.IInsAccrelValue;
import com.ai.omframe.instance.ivalues.IInsCmRelValue;
import com.ai.omframe.instance.ivalues.IInsUserValue;
import com.ai.omframe.util.SoServiceFactory;
import com.asiainfo.crm.cm.common.CmConstants;
import com.asiainfo.crm.cm.common.util.ws.address;
import com.asiainfo.crm.cm.inner.account.ivalues.IBOCmCustAcctRelValue;
import com.asiainfo.crm.cm.inner.customer.ivalues.*;
import com.asiainfo.crm.cm.model.ivalues.*;
import com.asiainfo.crm.cm.service.interfaces.ICmAccountSV;
import com.asiainfo.crm.cm.service.interfaces.ICmCustomerSV;
import com.ai.oneframe.search.bo.BOB2BCustomerInfoBean;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.*;
import com.asiainfo.crm.cm.teaminvoke.out.service.support.B2bCustomerAdvanceSearchSupport;
import com.asiainfo.crm.constant.OrderConst;
import com.asiainfo.crm.inter.exe.remote.bean.*;
import com.asiainfo.crm.so.order.rboss.instance.service.interfaces.IFixedLineInsSV;
import com.asiainfo.crm.so.teaminvoke.out.instance.service.interfaces.ICrmInsFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmExtFSV;
import com.asiainfo.crm.so.teaminvoke.out.service.interfaces.ICrmFSV;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.lang.reflect.Method;

public class CMCommonSVImpl implements ICMCommonSV {

	private static transient Log log = LogFactory.getLog(ICMCommonSV.class);

	public CustomerBean queryGroupCustByMember(long custId, String opCode)throws Exception {
		
		if(log.isErrorEnabled()){
			StringBuilder logIn = new StringBuilder();
			logIn.append("ICMCommonSV.queryGroupCust()---Input Param custId:").append(custId);
			log.error(logIn);
		}
		
		ICmGroupCustByIndivCustIdSV sv = (ICmGroupCustByIndivCustIdSV)ServiceFactory.getService(ICmGroupCustByIndivCustIdSV.class);
		ICustomerValue  value = sv.queryCustomerByIndivCustId(custId);
		CustomerBean bean = null;
		if(null != value ){
			bean = new CustomerBean();
			bean.setPostAddress(value.getPostAddress());
			bean.setBudget(value.getBudget());
			bean.setCityId(value.getCityId());
			bean.setMultiProvinceDesc(value.getMultiProvinceDesc());
			bean.setCustLevel(value.getCustLevel());
			bean.setEducationLevelDesc(value.getEducationLevelDesc());
			bean.setDevelopTypeDesc(value.getDevelopTypeDesc());
			bean.setCharacterDesc(value.getCharacterDesc());
			bean.setContDesc(value.getContDesc());
			bean.setVillegeIdDesc(value.getVillegeIdDesc());
			bean.setIncomeLevel(value.getIncomeLevel());
			bean.setFirstName(value.getFirstName());
			bean.setSubRegionTypeDesc(value.getSubRegionTypeDesc());
			bean.setCustPassword(value.getCustPassword());
			bean.setCustLanguage(value.getCustLanguage());
			bean.setCustZipcode(value.getCustZipcode());
			bean.setEcCode(value.getEcCode());
			bean.setEnglishName(value.getEnglishName());
			bean.setLunar(value.getLunar());
			bean.setRealNameFlagDesc(value.getRealNameFlagDesc());
			bean.setOfficeTel(value.getOfficeTel());
			bean.setGroupFax(value.getGroupFax());
			bean.setCustNameQry(value.getCustNameQry());
			bean.setGroupTypeDesc(value.getGroupTypeDesc());
			bean.setIsVipDesc(value.getIsVipDesc());
			bean.setPostCode(value.getPostCode());
			bean.setSubVocationDesc(value.getSubVocationDesc());
			bean.setMemberNum(value.getMemberNum());
			bean.setIsVip(value.getIsVip());
			bean.setNationalType(value.getNationalType());
			bean.setIndivCustId(value.getIndivCustId());
			bean.setPartyId(value.getPartyId());
			bean.setMarryStatusDesc(value.getMarryStatusDesc());
			bean.setLegalCustId(value.getLegalCustId());
			bean.setNationality(value.getNationality());
			bean.setVillegeId(value.getVillegeId());
			bean.setTownIdDesc(value.getTownIdDesc());
			bean.setCustAddress(value.getCustAddress());
			bean.setVirtualCustTypeDesc(value.getVirtualCustTypeDesc());
			bean.setCustId(value.getCustId());
			bean.setMarryStatus(value.getMarryStatus());
			bean.setCustServiceLevel(value.getCustServiceLevel());
			bean.setDoneCode(value.getDoneCode());
			bean.setRealNameFlag(value.getRealNameFlag());
			bean.setCreditLevel(value.getCreditLevel());
			bean.setCustStatus(value.getCustStatus());
			bean.setOccupationDesc(value.getOccupationDesc());
			bean.setOrgIdDesc(value.getOrgIdDesc());
			bean.setJobCompany(value.getJobCompany());
			bean.setParentCustId(value.getParentCustId());
			bean.setProvinceId(value.getProvinceId());
			bean.setOrgId(value.getOrgId());
			bean.setJobPosition(value.getJobPosition());
			bean.setSubVocation(value.getSubVocation());
			bean.setMiddleName(value.getMiddleName());
			bean.setLunarDesc(value.getLunarDesc());
			bean.setGroupCustSegment(value.getGroupCustSegment());
			bean.setIndivCustType(value.getIndivCustType());
			bean.setHobby(value.getHobby());
			bean.setEducationLevel(value.getEducationLevel());
			bean.setContId(value.getContId());
			bean.setCountyIdDesc(value.getCountyIdDesc());
			bean.setSubRegionType(value.getSubRegionType());
			bean.setIndivCustTypeDesc(value.getIndivCustTypeDesc());
			bean.setCustTypeDesc(value.getCustTypeDesc());
			bean.setCustCertType(value.getCustCertType());
			bean.setVocation(value.getVocation());
			bean.setCustCertCode(value.getCustCertCode());
			bean.setTownId(value.getTownId());
			bean.setPrioryLevel(value.getPrioryLevel());
			bean.setMultiProvince(value.getMultiProvince());
			bean.setOpId(value.getOpId());
			bean.setGenderDesc(value.getGenderDesc());
			bean.setOccupation(value.getOccupation());
			bean.setContEmail(value.getContEmail());
			bean.setHqNumber(value.getHqNumber());
			bean.setManagerName(value.getManagerName());
			bean.setRegionType(value.getRegionType());
			bean.setVocationDesc(value.getVocationDesc());
			bean.setCustType(value.getCustType());
			bean.setLastName(value.getLastName());
			bean.setVirtualCustType(value.getVirtualCustType());
			bean.setNationalTypeDesc(value.getNationalTypeDesc());
			bean.setCustName(value.getCustName());
			bean.setManagerId(value.getManagerId());
			bean.setStaffAmount(value.getStaffAmount());
			bean.setBlogNo(value.getBlogNo());
			bean.setDevelopType(value.getDevelopType());
			bean.setIncomeLevelDesc(value.getIncomeLevelDesc());
			bean.setIndivCustSegment(value.getIndivCustSegment());
			bean.setPoliticsFace(value.getPoliticsFace());
			bean.setState(value.getState());
			bean.setRemarks(value.getRemarks());
			bean.setRegAmount(value.getRegAmount());
			bean.setContName(value.getContName());
			bean.setCreditValue(value.getCreditValue());
			bean.setShortName(value.getShortName());
			bean.setCustStatusDesc(value.getCustStatusDesc());
			bean.setGroupType(value.getGroupType());
			bean.setCustControlType(value.getCustControlType());
			bean.setHomeTel(value.getHomeTel());
			bean.setOpIdDesc(value.getOpIdDesc());
			bean.setContMobile(value.getContMobile());
			bean.setGroupSubType(value.getGroupSubType());
			bean.setManagerPhone(value.getManagerPhone());
			bean.setCreateOpId(value.getCreateOpId());
			bean.setCustServiceLevelDesc(value.getCustServiceLevelDesc());
			bean.setQqNo(value.getQqNo());
			bean.setFamilyPhone(value.getFamilyPhone());
			bean.setPoliticsFaceDesc(value.getPoliticsFaceDesc());
			bean.setAccountCycle(value.getAccountCycle());
			bean.setRegionTypeDesc(value.getRegionTypeDesc());
			bean.setLegalCustName(value.getLegalCustName());
			bean.setContAddress(value.getContAddress());
			bean.setCustServiceId(value.getCustServiceId());
			bean.setLastNameQry(value.getLastNameQry());
			bean.setNationalityDesc(value.getNationalityDesc());
			bean.setFamilyInfo(value.getFamilyInfo());
			bean.setRegionId(value.getRegionId());
			bean.setCreateOrgId(value.getCreateOrgId());
			bean.setCreditLevelDesc(value.getCreditLevelDesc());
			bean.setCountyId(value.getCountyId());
			bean.setGender(value.getGender());
			bean.setReligion(value.getReligion());
			bean.setFirstNameQry(value.getFirstNameQry());
			bean.setMiddleNameQry(value.getMiddleNameQry());
			bean.setCustCertTypeDesc(value.getCustCertTypeDesc());
			bean.setContFax(value.getContFax());
			bean.setCustCertAddress(value.getCustCertAddress());
			bean.setGroupWeb(value.getGroupWeb());
			bean.setCustCertExpire(value.getCustCertExpire());
			bean.setExpireDate(value.getExpireDate());
			bean.setBirthday(value.getBirthday());
			bean.setCustCertEffdate(value.getCustCertEffdate());
			bean.setEffectiveDate(value.getEffectiveDate());
			bean.setGroupDate(value.getGroupDate());
			bean.setCreateDate(value.getCreateDate());
			bean.setDoneDate(value.getDoneDate());
		}
		
		return bean;
	}
	

	public CustomerBean queryCustByEmail(String email , String opCode) throws Exception {
		if(log.isErrorEnabled()){
			StringBuilder logIn = new StringBuilder();
			logIn.append("ICMCommonSV.queryCustByEmail()---Input Param E-mail :").append(email);
			log.error(logIn);
		}
		
		CustomerBean bean = null;
		ICm2CsSV sv = (ICm2CsSV)ServiceFactory.getService(ICm2CsSV.class);
		ICustomerValue value = sv.queryCustByEmail(email);
		if(null != value){
			bean = new CustomerBean();
			bean.setCustId(value.getCustId());
			bean.setFirstName(value.getFirstName());
			bean.setLastName(value.getLastName());
			bean.setCustName(value.getCustName());
			bean.setBirthday(value.getBirthday());
			bean.setGender(value.getGender());
			bean.setCustStatus(value.getCustStatus());
		}
		
		return bean;
	}

	public CustomerBean queryCustByServiceNum(String serviceNum, String opCode)
			throws Exception {
		
		if(log.isErrorEnabled()){
			StringBuilder logIn = new StringBuilder();
			logIn.append("ICMCommonSV.queryCustByServiceNum()---Input Param ServiceNum :").append(serviceNum);
			log.error(logIn);
		}
		
		CustomerBean bean = null;
		CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, serviceNum);
		ICrmFSV fsv = (ICrmFSV)ServiceFactory.getService(ICrmFSV.class);
		IInsUserValue userInfo = fsv.getUserInfoByBillId(serviceNum);
//		ICustomerValue value = sv.queryCustByEmail(email);
		if(null != userInfo){
			ICmInterfaceSV sv = (ICmInterfaceSV)ServiceFactory.getService(ICmInterfaceSV.class);
			ICustomerValue  value = sv.queryCustomerByCustId(userInfo.getCustId(), "");
			if(null != value){
				bean = new CustomerBean();
				bean.setCustId(value.getCustId());
				bean.setFirstName(value.getFirstName());
				bean.setLastName(value.getLastName());
				bean.setCustName(value.getCustName());
				bean.setBirthday(value.getBirthday());
				bean.setGender(value.getGender());
				bean.setCustStatus(value.getCustStatus());
			}
		}
		return bean;
	}

	public CustPerferInfomation[] getCmCustPerferInfomation(	long custId, int perferType , String opCode) throws Exception {
		ICm2CsSV sv = (ICm2CsSV )ServiceFactory.getService(ICm2CsSV.class);
		IBOCmCustPerferInfomationValue[] values = sv.getCmCustPerferInfomation(custId, perferType);
		CustPerferInfomation[] perferInfomations = null;
		if(values != null && values.length > 0){
			int length = values.length;
			perferInfomations = new CustPerferInfomation[length];
			for(int index = 0 ; index < length ; index++){
				perferInfomations[index] = new CustPerferInfomation();
				perferInfomations[index].setMediumDoneCode(values[index].getMediumDoneCode());
				perferInfomations[index].setChannelDoneCode(values[index].getChannelDoneCode());
				perferInfomations[index].setAddressId(values[index].getAddressId());
				perferInfomations[index].setChannelCreateOrgId(values[index].getChannelCreateOrgId());
				perferInfomations[index].setPreferChannelId(values[index].getPreferChannelId());
				perferInfomations[index].setMediumOpId(values[index].getMediumOpId());
				perferInfomations[index].setChannelCreateOpId(values[index].getChannelCreateOpId());
				perferInfomations[index].setFaxNumber(values[index].getFaxNumber());
				perferInfomations[index].setAddressCode(values[index].getAddressCode());
				perferInfomations[index].setChannelRegionId(values[index].getChannelRegionId());
				perferInfomations[index].setUpContMedTypeId(values[index].getUpContMedTypeId());
				perferInfomations[index].setPreferChannelName(values[index].getPreferChannelName());
				perferInfomations[index].setAddressDetail(values[index].getAddressDetail());
				perferInfomations[index].setCustId(values[index].getCustId());
				perferInfomations[index].setProtectExpDate(values[index].getProtectExpDate());
				perferInfomations[index].setChannelDoneDate(values[index].getChannelDoneDate());
				perferInfomations[index].setAction(values[index].getAction());
				perferInfomations[index].setMediumExpireDate(values[index].getMediumExpireDate());
				perferInfomations[index].setContMedTypeName(values[index].getContMedTypeName());
				perferInfomations[index].setProtectEffDate(values[index].getProtectEffDate());
				perferInfomations[index].setChannelEffectiveDate(values[index].getChannelEffectiveDate());
				perferInfomations[index].setChannelExpireDate(values[index].getChannelExpireDate());
				perferInfomations[index].setChannelRemarks(values[index].getChannelRemarks());
				perferInfomations[index].setChannelCreateDate(values[index].getChannelCreateDate());
				perferInfomations[index].setMediumRemarks(values[index].getMediumRemarks());
				perferInfomations[index].setMediumDoneDate(values[index].getMediumDoneDate());
				perferInfomations[index].setPriority(values[index].getPriority());
				perferInfomations[index].setMediumOrgId(values[index].getMediumOrgId());
				perferInfomations[index].setChannelOrgId(values[index].getChannelOrgId());
				perferInfomations[index].setMediumEffectiveDate(values[index].getMediumEffectiveDate());
				perferInfomations[index].setChannelState(values[index].getChannelState());
				perferInfomations[index].setCustContRelaId(values[index].getCustContRelaId());
				perferInfomations[index].setMediumCreateOpId(values[index].getMediumCreateOpId());
				perferInfomations[index].setContNumber(values[index].getContNumber());
				perferInfomations[index].setContMedTypeId(values[index].getContMedTypeId());
				perferInfomations[index].setPerferType(values[index].getPerferType());
				perferInfomations[index].setMediumRegionId(values[index].getMediumRegionId());
				perferInfomations[index].setIsNoDisturbing(values[index].getIsNoDisturbing());
				perferInfomations[index].setChannelOpId(values[index].getChannelOpId());
				perferInfomations[index].setMediumCreateDate(values[index].getMediumCreateDate());
				perferInfomations[index].setPostalCode(values[index].getPostalCode());
				perferInfomations[index].setMediumState(values[index].getMediumState());
				perferInfomations[index].setMediumCreateOrgId(values[index].getMediumCreateOrgId());
				perferInfomations[index].setPrior(values[index].getPrior());
				perferInfomations[index].setEmailAddress(values[index].getEmailAddress());
			}
		}
		return perferInfomations;
	}

	public CustPerferInfo[] getBOCmPreferPeriods(long preferId , String opCode) throws Exception {
		ICm2CsSV sv = (ICm2CsSV )ServiceFactory.getService(ICm2CsSV.class);
		IBOCmCustPerferInfoValue[]  values = sv.getBOCmPreferPeriods(preferId);
		CustPerferInfo[] infos = null;
		if(values != null && values.length > 0){
			int length = values.length;
			infos = new CustPerferInfo[length];
			for(int index = 0 ; index < length ; index++){
				infos[index] = new CustPerferInfo();
				infos[index].setChannelDoneCode(values[index].getChannelDoneCode());
				infos[index].setTimeBeginUnit(values[index].getTimeBeginUnit());
				infos[index].setState(values[index].getState());
				infos[index].setTimeBeginAttr(values[index].getTimeBeginAttr());
				infos[index].setChannelCreateOrgId(values[index].getChannelCreateOrgId());
				infos[index].setRemarks(values[index].getRemarks());
				infos[index].setPreferChannelId(values[index].getPreferChannelId());
				infos[index].setChannelCreateOpId(values[index].getChannelCreateOpId());
				infos[index].setPreferPeriodId(values[index].getPreferPeriodId());
				infos[index].setChannelRegionId(values[index].getChannelRegionId());
				infos[index].setPreferChannelName(values[index].getPreferChannelName());
				infos[index].setCustId(values[index].getCustId());
				infos[index].setCreateOpId(values[index].getCreateOpId());
				infos[index].setChannelDoneDate(values[index].getChannelDoneDate());
				infos[index].setDoneCode(values[index].getDoneCode());
				infos[index].setAction(values[index].getAction());
				infos[index].setTimeType(values[index].getTimeType());
				infos[index].setChannelEffectiveDate(values[index].getChannelEffectiveDate());
				infos[index].setExpireDate(values[index].getExpireDate());
				infos[index].setTimeEndAttr(values[index].getTimeEndAttr());
				infos[index].setEffectiveDate(values[index].getEffectiveDate());
				infos[index].setOpId(values[index].getOpId());
				infos[index].setUpPreferPeriodId(values[index].getUpPreferPeriodId());
				infos[index].setChannelRemarks(values[index].getChannelRemarks());
				infos[index].setChannelExpireDate(values[index].getChannelExpireDate());
				infos[index].setChannelCreateDate(values[index].getChannelCreateDate());
				infos[index].setChannelOrgId(values[index].getChannelOrgId());
				infos[index].setChannelState(values[index].getChannelState());
				infos[index].setCustContRelaId(values[index].getCustContRelaId());
				infos[index].setOrgId(values[index].getOrgId());
				infos[index].setRegionId(values[index].getRegionId());
				infos[index].setCreateOrgId(values[index].getCreateOrgId());
				infos[index].setPerferType(values[index].getPerferType());
				infos[index].setChannelOpId(values[index].getChannelOpId());
				infos[index].setTimeEndUnit(values[index].getTimeEndUnit());
				infos[index].setDoneDate(values[index].getDoneDate());
				infos[index].setCreateDate(values[index].getCreateDate());
				infos[index].setPrior(values[index].getPrior());
			}
		}
		return infos;
	}

	public CmxIndivCustomer getCmxIndivCustomerByCustId(long custId, String opCode) throws Exception {
		ICm2CsSV sv = (ICm2CsSV )ServiceFactory.getService(ICm2CsSV.class);
		IBOCmxIndivCustomerValue  value = sv.getCmxIndivCustomerByCustId(custId);
		CmxIndivCustomer customer = null;
		if(value != null){
			customer = new CmxIndivCustomer();
			customer.setPnr(value.getPnr());
			customer.setProtectExpireDate(value.getProtectExpireDate());
			customer.setManualCommercialProtection(value.getManualCommercialProtection());
			customer.setUpdateFlag(value.getUpdateFlag());
			customer.setExpireDate(value.getExpireDate());
			customer.setAksStatus(value.getAksStatus());
			customer.setOpId(value.getOpId());
			customer.setEffectiveDate(value.getEffectiveDate());
			customer.setCoName(value.getCoName());
			customer.setContactProtection(value.getContactProtection());
			customer.setPersonStatus(value.getPersonStatus());
			customer.setCurResidenceStrDate(value.getCurResidenceStrDate());
			customer.setStatusEffDate(value.getStatusEffDate());
			customer.setExt9(value.getExt9());
			customer.setDirectMarketingProtection(value.getDirectMarketingProtection());
			customer.setDoneDate(value.getDoneDate());
			customer.setBadPayerFlag(value.getBadPayerFlag());
			customer.setExt5(value.getExt5());
			customer.setExt6(value.getExt6());
			customer.setExt7(value.getExt7());
			customer.setCreateDate(value.getCreateDate());
			customer.setExt8(value.getExt8());
			customer.setManualProtectExpireDate(value.getManualProtectExpireDate());
			customer.setExt1(value.getExt1());
			customer.setExt2(value.getExt2());
			customer.setExt3(value.getExt3());
			customer.setExt4(value.getExt4());
			customer.setExt20(value.getExt20());
			customer.setExt30(value.getExt30());
			customer.setState(value.getState());
			customer.setManualProtectEffectiveDate(value.getManualProtectEffectiveDate());
			customer.setAttorneys(value.getAttorneys());
			customer.setCustId(value.getCustId());
			customer.setCreateOpId(value.getCreateOpId());
			customer.setExt19(value.getExt19());
			customer.setExt29(value.getExt29());
			customer.setExt18(value.getExt18());
			customer.setExt17(value.getExt17());
			customer.setExt27(value.getExt27());
			customer.setExt16(value.getExt16());
			customer.setExt28(value.getExt28());
			customer.setExt15(value.getExt15());
			customer.setExt25(value.getExt25());
			customer.setExt14(value.getExt14());
			customer.setDoneCode(value.getDoneCode());
			customer.setExt26(value.getExt26());
			customer.setExt13(value.getExt13());
			customer.setExt23(value.getExt23());
			customer.setExt12(value.getExt12());
			customer.setDuplicateCprId(value.getDuplicateCprId());
			customer.setExt24(value.getExt24());
			customer.setExt11(value.getExt11());
			customer.setExt21(value.getExt21());
			customer.setExt10(value.getExt10());
			customer.setExt22(value.getExt22());
			customer.setProtectEffDate(value.getProtectEffDate());
			customer.setMotherName(value.getMotherName());
			customer.setAksRegistrationDate(value.getAksRegistrationDate());
			customer.setOrgId(value.getOrgId());
			customer.setRegionId(value.getRegionId());
			customer.setCreateOrgId(value.getCreateOrgId());
			customer.setFormerName(value.getFormerName());
			customer.setGuardianName(value.getGuardianName());
		}
		return customer;
	}

	public CustComplexInfo queryCustomerDtl(long custId, String opCode)	throws Exception {
		ICm2SoSV sv = (ICm2SoSV )ServiceFactory.getService(ICm2SoSV.class);
		IVOCustValue  value = sv.queryCustomerDtlForPushC(custId);
		CustComplexInfo cust = null;
		if(value != null){
			cust = new CustComplexInfo();
			ICustomerValue custVal =  value.getCustomer();
			if(custVal != null){
				CustomerInfo customer = new CustomerInfo();
				customer.setBudget(custVal.getBudget());
				customer.setPostAddress(custVal.getPostAddress());
				customer.setBadPayer(custVal.getBadPayer());
				customer.setMultiProvinceDesc(custVal.getMultiProvinceDesc());
				customer.setCustLevel(custVal.getCustLevel());
				customer.setEducationLevelDesc(custVal.getEducationLevelDesc());
				customer.setDevelopTypeDesc(custVal.getDevelopTypeDesc());
				customer.setCharacterDesc(custVal.getCharacterDesc());
				customer.setContDesc(custVal.getContDesc());
				customer.setManualCommercialProtection(custVal.getManualCommercialProtection());
				customer.setCustPassword(custVal.getCustPassword());
				customer.setCustCertExpire(custVal.getCustCertExpire());
				customer.setLegalForm(custVal.getLegalForm());
				customer.setEcCode(custVal.getEcCode());
				customer.setEnglishName(custVal.getEnglishName());
				customer.setLunar(custVal.getLunar());
				customer.setExpireDate(custVal.getExpireDate());
				customer.setAksStatus(custVal.getAksStatus());
				customer.setCurResidenceStrDate(custVal.getCurResidenceStrDate());
				customer.setRealNameFlagDesc(custVal.getRealNameFlagDesc());
				customer.setStatusEffDate(custVal.getStatusEffDate());
				customer.setOfficeTel(custVal.getOfficeTel());
				customer.setCustNameQry(custVal.getCustNameQry());
				customer.setDoneDate(custVal.getDoneDate());
				customer.setGuardianDate(custVal.getGuardianDate());
				customer.setCreateDate(custVal.getCreateDate());
				customer.setHeadOffice(custVal.getHeadOffice());
				customer.setMemberNum(custVal.getMemberNum());
				customer.setIsVip(custVal.getIsVip());
				customer.setNationalType(custVal.getNationalType());
				customer.setIndivCustId(custVal.getIndivCustId());
				customer.setCorporateIdentificationNumbe(custVal.getCorporateIdentificationNumbe());
				customer.setMarryStatusDesc(custVal.getMarryStatusDesc());
				customer.setLegalCustId(custVal.getLegalCustId());
				customer.setNationality(custVal.getNationality());
				customer.setCustAddress(custVal.getCustAddress());
				customer.setAttorneys(custVal.getAttorneys());
				customer.setVirtualCustTypeDesc(custVal.getVirtualCustTypeDesc());
				customer.setCustId(custVal.getCustId());
				customer.setCustServiceLevel(custVal.getCustServiceLevel());
				customer.setDoneCode(custVal.getDoneCode());
				customer.setProtectEffDate(custVal.getProtectEffDate());
				customer.setPreferStore(custVal.getPreferStore());
				customer.setPostalCity(custVal.getPostalCity());
				customer.setMotherName(custVal.getMotherName());
				customer.setParentCustId(custVal.getParentCustId());
				customer.setProvinceId(custVal.getProvinceId());
				customer.setAlias(custVal.getAlias());
				customer.setOrgId(custVal.getOrgId());
				customer.setSubVocation(custVal.getSubVocation());
				customer.setLunarDesc(custVal.getLunarDesc());
				customer.setGroupCustSegment(custVal.getGroupCustSegment());
				customer.setIndivCustType(custVal.getIndivCustType());
				customer.setContId(custVal.getContId());
				customer.setSubRegionType(custVal.getSubRegionType());
				customer.setCustTypeDesc(custVal.getCustTypeDesc());
				customer.setVocation(custVal.getVocation());
				customer.setTownId(custVal.getTownId());
				customer.setGroupSegmentId(custVal.getGroupSegmentId());
				customer.setTaxId(custVal.getTaxId());
				customer.setMultiProvince(custVal.getMultiProvince());
				customer.setEffectiveDate(custVal.getEffectiveDate());
				customer.setContactProtection(custVal.getContactProtection());
				customer.setOccupation(custVal.getOccupation());
				customer.setContEmail(custVal.getContEmail());
				customer.setIsVpmn(custVal.getIsVpmn());
				customer.setCustCertEffdate(custVal.getCustCertEffdate());
				customer.setSeNumber(custVal.getSeNumber());
				customer.setBlogNo(custVal.getBlogNo());
				customer.setStockExchangeFlag(custVal.getStockExchangeFlag());
				customer.setDevelopType(custVal.getDevelopType());
				customer.setIncomeLevelDesc(custVal.getIncomeLevelDesc());
				customer.setIndivCustSegment(custVal.getIndivCustSegment());
				customer.setManualProtectExpireDate(custVal.getManualProtectExpireDate());
				customer.setSendPersonName(custVal.getSendPersonName());
				customer.setRegistrationNumber(custVal.getRegistrationNumber());
				customer.setPoliticsFace(custVal.getPoliticsFace());
				customer.setState(custVal.getState());
				customer.setRegAmount(custVal.getRegAmount());
				customer.setRemarks(custVal.getRemarks());
				customer.setContName(custVal.getContName());
				customer.setCreditValue(custVal.getCreditValue());
				customer.setShortName(custVal.getShortName());
				customer.setGroupType(custVal.getGroupType());
				customer.setCustControlType(custVal.getCustControlType());
				customer.setTaxFlag(custVal.getTaxFlag());
				customer.setGroupSubType(custVal.getGroupSubType());
				customer.setContMobile(custVal.getContMobile());
				customer.setManagerPhone(custVal.getManagerPhone());
				customer.setCreateOpId(custVal.getCreateOpId());
				customer.setFamilyPhone(custVal.getFamilyPhone());
				customer.setAnonymousFlag(custVal.getAnonymousFlag());
				customer.setPoliticsFaceDesc(custVal.getPoliticsFaceDesc());
				customer.setAccountCycle(custVal.getAccountCycle());
				customer.setBirthday(custVal.getBirthday());
				customer.setCustServiceId(custVal.getCustServiceId());
				customer.setLastNameQry(custVal.getLastNameQry());
				customer.setIsProtected(custVal.getIsProtected());
				customer.setNationalityDesc(custVal.getNationalityDesc());
				customer.setCountyId(custVal.getCountyId());
				customer.setSegmentId(custVal.getSegmentId());
				customer.setReligion(custVal.getReligion());
				customer.setMiddleNameQry(custVal.getMiddleNameQry());
				customer.setBirthPlace(custVal.getBirthPlace());
				customer.setCurrencyCode(custVal.getCurrencyCode());
				customer.setGroupWeb(custVal.getGroupWeb());
				customer.setCityId(custVal.getCityId());
				customer.setPnr(custVal.getPnr());
				customer.setVillegeIdDesc(custVal.getVillegeIdDesc());
				customer.setIncomeLevel(custVal.getIncomeLevel());
				customer.setIsRevisable(custVal.getIsRevisable());
				customer.setFirstName(custVal.getFirstName());
				customer.setSubRegionTypeDesc(custVal.getSubRegionTypeDesc());
				customer.setServBeginTime(custVal.getServBeginTime());
				customer.setUpdateFlag(custVal.getUpdateFlag());
				customer.setCertificateFilePath(custVal.getCertificateFilePath());
				customer.setCustLanguage(custVal.getCustLanguage());
				customer.setCustZipcode(custVal.getCustZipcode());
				customer.setEstablished(custVal.getEstablished());
				customer.setCoName(custVal.getCoName());
				customer.setEntTotalEmployees(custVal.getEntTotalEmployees());
				customer.setPersonStatus(custVal.getPersonStatus());
				customer.setExportCountryCode(custVal.getExportCountryCode());
				customer.setGroupFax(custVal.getGroupFax());
				customer.setGroupTypeDesc(custVal.getGroupTypeDesc());
				customer.setIsVipDesc(custVal.getIsVipDesc());
				customer.setPostCode(custVal.getPostCode());
				customer.setSubVocationDesc(custVal.getSubVocationDesc());
				customer.setPartyId(custVal.getPartyId());
				customer.setManualProtectEffectiveDate(custVal.getManualProtectEffectiveDate());
				customer.setVillegeId(custVal.getVillegeId());
				customer.setTownIdDesc(custVal.getTownIdDesc());
				customer.setMarryStatus(custVal.getMarryStatus());
				customer.setServProtocolPath(custVal.getServProtocolPath());
				customer.setExportTurnoverRatio(custVal.getExportTurnoverRatio());
				customer.setCprStatus(custVal.getCprStatus());
				customer.setCreditLevel(custVal.getCreditLevel());
				customer.setRealNameFlag(custVal.getRealNameFlag());
				customer.setCustStatus(custVal.getCustStatus());
				customer.setOccupationDesc(custVal.getOccupationDesc());
				customer.setOrgIdDesc(custVal.getOrgIdDesc());
				customer.setJobCompany(custVal.getJobCompany());
				customer.setAksRegistrationDate(custVal.getAksRegistrationDate());
				customer.setPoBox(custVal.getPoBox());
				customer.setCompanyFormCode(custVal.getCompanyFormCode());
				customer.setJobPosition(custVal.getJobPosition());
				customer.setMiddleName(custVal.getMiddleName());
				customer.setPostProvince(custVal.getPostProvince());
				customer.setHobby(custVal.getHobby());
				customer.setEducationLevel(custVal.getEducationLevel());
				customer.setProtectExpireDate(custVal.getProtectExpireDate());
				customer.setSegmentName(custVal.getSegmentName());
				customer.setCountyIdDesc(custVal.getCountyIdDesc());
				customer.setIndivCustTypeDesc(custVal.getIndivCustTypeDesc());
				customer.setGroupDate(custVal.getGroupDate());
				customer.setCustCertType(custVal.getCustCertType());
				customer.setCprStatusDate(custVal.getCprStatusDate());
				customer.setCustCertCode(custVal.getCustCertCode());
				customer.setRegistrationDate(custVal.getRegistrationDate());
				customer.setPrioryLevel(custVal.getPrioryLevel());
				customer.setOpId(custVal.getOpId());
				customer.setGenderDesc(custVal.getGenderDesc());
				customer.setHqNumber(custVal.getHqNumber());
				customer.setManagerName(custVal.getManagerName());
				customer.setPhysiologicalState(custVal.getPhysiologicalState());
				customer.setRegionType(custVal.getRegionType());
				customer.setVocationDesc(custVal.getVocationDesc());
				customer.setCustType(custVal.getCustType());
				customer.setLastName(custVal.getLastName());
				customer.setBiCompanyName(custVal.getBiCompanyName());
				customer.setVirtualCustType(custVal.getVirtualCustType());
				customer.setCustName(custVal.getCustName());
				customer.setManagerId(custVal.getManagerId());
				customer.setNationalTypeDesc(custVal.getNationalTypeDesc());
				customer.setStaffAmount(custVal.getStaffAmount());
				customer.setDirectMarketingProtection(custVal.getDirectMarketingProtection());
				customer.setBadPayerFlag(custVal.getBadPayerFlag());
				customer.setAddressId(custVal.getAddressId());
				customer.setStaffAmountType(custVal.getStaffAmountType());
				customer.setWorkplaceNumber(custVal.getWorkplaceNumber());
				customer.setWorkplaceCode(custVal.getWorkplaceCode());
				customer.setCustStatusDesc(custVal.getCustStatusDesc());
				customer.setCustSegment(custVal.getCustSegment());
				customer.setHomeTel(custVal.getHomeTel());
				customer.setOpIdDesc(custVal.getOpIdDesc());
				customer.setCustServiceLevelDesc(custVal.getCustServiceLevelDesc());
				customer.setExpenseType(custVal.getExpenseType());
				customer.setQqNo(custVal.getQqNo());
				customer.setLegalCustName(custVal.getLegalCustName());
				customer.setRegionTypeDesc(custVal.getRegionTypeDesc());
				customer.setContAddress(custVal.getContAddress());
				customer.setFamilyInfo(custVal.getFamilyInfo());
				customer.setCreateOrgId(custVal.getCreateOrgId());
				customer.setRegionId(custVal.getRegionId());
				customer.setCreditLevelDesc(custVal.getCreditLevelDesc());
				customer.setFormerName(custVal.getFormerName());
				customer.setGender(custVal.getGender());
				customer.setCompanyStatus(custVal.getCompanyStatus());
				customer.setRegistrationCode(custVal.getRegistrationCode());
				customer.setFirstNameQry(custVal.getFirstNameQry());
				customer.setServEndTime(custVal.getServEndTime());
				customer.setGuardianName(custVal.getGuardianName());
				customer.setContFax(custVal.getContFax());
				customer.setCustCertAddress(custVal.getCustCertAddress());
				customer.setCustCertTypeDesc(custVal.getCustCertTypeDesc());
				cust.setCustomerInfo(customer);
			}
			
			IBOCmCustContactMediumValue[]  contactVals = value.getCustContMedium();
			if(	contactVals != null && contactVals.length > 0){
				int length = contactVals.length;
				CustContactMedium[] custConts = new CustContactMedium[length];
				for(int index = 0 ; index < length ; index++){
					custConts[index] = new CustContactMedium();
					custConts[index].setAddressId(contactVals[index].getAddressId());
					custConts[index].setState(contactVals[index].getState());
					custConts[index].setRemarks(contactVals[index].getRemarks());
					custConts[index].setFaxNumber(contactVals[index].getFaxNumber());
					custConts[index].setAddressCode(contactVals[index].getAddressCode());
					custConts[index].setCustId(contactVals[index].getCustId());
					custConts[index].setAddressDetail(contactVals[index].getAddressDetail());
					custConts[index].setProtectExpDate(contactVals[index].getProtectExpDate());
					custConts[index].setCreateOpId(contactVals[index].getCreateOpId());
					custConts[index].setContactPerson(contactVals[index].getContactPerson());
					custConts[index].setDoneCode(contactVals[index].getDoneCode());
					custConts[index].setProtectEffDate(contactVals[index].getProtectEffDate());
					custConts[index].setExpireDate(contactVals[index].getExpireDate());
					custConts[index].setEffectiveDate(contactVals[index].getEffectiveDate());
					custConts[index].setOpId(contactVals[index].getOpId());
					custConts[index].setPriority(contactVals[index].getPriority());
					custConts[index].setCustContRelaId(contactVals[index].getCustContRelaId());
					custConts[index].setContNumber(contactVals[index].getContNumber());
					custConts[index].setOrgId(contactVals[index].getOrgId());
					custConts[index].setRegionId(contactVals[index].getRegionId());
					custConts[index].setCreateOrgId(contactVals[index].getCreateOrgId());
					custConts[index].setContMedTypeId(contactVals[index].getContMedTypeId());
					custConts[index].setIsNoDisturbing(contactVals[index].getIsNoDisturbing());
					custConts[index].setDoneDate(contactVals[index].getDoneDate());
					custConts[index].setExt5(contactVals[index].getExt5());
					custConts[index].setExt6(contactVals[index].getExt6());
					custConts[index].setPostalCode(contactVals[index].getPostalCode());
					custConts[index].setCreateDate(contactVals[index].getCreateDate());
					custConts[index].setExt1(contactVals[index].getExt1());
					custConts[index].setExt2(contactVals[index].getExt2());
					custConts[index].setEmailAddress(contactVals[index].getEmailAddress());
					custConts[index].setExt3(contactVals[index].getExt3());
					custConts[index].setExt4(contactVals[index].getExt4());
				}
				cust.setCustContactMediums(custConts);
			}
			
			IVOCustAddressValue[]  custAdds = value.getCustAddress();
			if(custAdds != null && custAdds.length > 0){
				int length = custAdds.length;
				CustAddress[] custAddress = new CustAddress[length];
				for(int index = 0 ; index < length ; index++){
					custAddress[index] = new CustAddress();
					custAddress[index].setAddressId(custAdds[index].getAddressId());
					custAddress[index].setPriority(custAdds[index].getContMedium().getPriority());
					custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
					address address = custAdds[index].getAddress();
					if(address != null){
						Address add = new Address();
						add.setCountry(address.getCountry());
						add.setAddressType(address.getAddressType());
						add.setDistrictId(address.getDistrictId());
						add.setZipcode(address.getZipcode());
						add.setCity(address.getCity());
						add.setCounty(address.getCounty());
						add.setStreetName(address.getStreetName());
						add.setApartment(address.getApartment());
						add.setFloor(address.getFloor());
						add.setHouseLetter(address.getHouseLetter());
						add.setHouseNumber(address.getHouseNumber());
						add.setMainDoor(address.getMainDoor());
						add.setDoorNumber(address.getDoorNumber());
						add.setAddrDesc(address.getAddrDesc());
						add.setBlackState(address.getBlackState());
						add.setDeliveryState(address.getDeliveryState());
						add.setMunicipality(address.getMunicipality());
						custAddress[index].setAddress(add);
					}
				}
				cust.setCustAddresses(custAddress);
			}
		}
		return cust;
	}

	public CustSimpleInfo queryCustSimpleInfo(String serviceNum, String opCode)
			throws Exception {
		
		CustSimpleInfo custInfo = null ;
		long custId = 0L;
		String regionId = CenterUtil.getRegionIdByBillId(serviceNum);
		if(StringUtils.isNotBlank(regionId)){
			CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, serviceNum);
			ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
			IInsUserValue[] users = fsv.getInsUserByBillIdOrUserId(serviceNum, -1, OrderConst.VALID_TYPE_ALL);
			if(null != users && users.length > 0){
				custId = users[0].getCustId();
			}
		}else{
			// Voip  号码
			CenterUtil.generatorRegionId();
			IFixedLineInsSV fixSV = (IFixedLineInsSV)ServiceFactory.getCrossCenterService(IFixedLineInsSV.class);
			regionId = fixSV.getRegionIdByVoIPNum(serviceNum);
			if(StringUtils.isNotBlank(regionId)){
				CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
				ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
				IInsUserValue user = fsv.getDSLUserByVoIPNum(serviceNum, OrderConst.VALID_TYPE_ALL);
				if(null != user ){
					custId = user.getCustId();
				}
			}else{
				// add by zoudj 2016-1-28 通过副号查询
				ICrmExtFSV crmExtSV = (ICrmExtFSV) ServiceFactory.getCrossCenterService(ICrmExtFSV.class);
				IInsUserValue insUserByMultNumber = crmExtSV.getInsUserByMultNumber(serviceNum);
				if(insUserByMultNumber != null){
					custId = insUserByMultNumber.getCustId();
				}
			}
		}
		if(custId > 0L){
			ICmInterfaceSV sv = (ICmInterfaceSV)ServiceFactory.getService(ICmInterfaceSV.class);
			ICustomerValue  value = sv.queryCustomerByCustId(custId, "");
			if(null != value ){
				custInfo = new CustSimpleInfo();
				custInfo.setCustId(value.getCustId());
				custInfo.setCustType(value.getCustType());
				custInfo.setCustName(value.getCustName());
				custInfo.setCustStatus(value.getCustStatus());
			}
		}
		
		return custInfo ;
	}

	public GroupCustInfo queryGroupCust(long custId, String opCode)
			throws Exception {
		ICm2SoSV sv = (ICm2SoSV )ServiceFactory.getService(ICm2SoSV.class);
		IVOCustValue  value = sv.queryCustomerDtl(custId);
		GroupCustInfo custInfo = null ;
		if(null != value){
			custInfo = new GroupCustInfo();
			ICustomerValue custVal =  value.getCustomer();
			if(custVal != null){
				custInfo.setCompanyName(custVal.getCustName()) ;
				custInfo.setCustId(custVal.getCustId());
				custInfo.setSegmentId(String.valueOf(custVal.getCustSegment()));
				custInfo.setSegmentName(custVal.getGroupSegmentId());
				custInfo.setCustStatus(custVal.getCustStatus());
				custInfo.setIdType(custVal.getCustCertType());
				custInfo.setIdNumber(custVal.getCustCertCode());
			}
			
			IBOCmCustContactMediumValue[]  contactVals = value.getCustContMedium();
			if(	contactVals != null && contactVals.length > 0){
				int length = contactVals.length;
				CustContactMedium[] custConts = new CustContactMedium[length];
				for(int index = 0 ; index < length ; index++){
					custConts[index] = new CustContactMedium();
					custConts[index].setAddressId(contactVals[index].getAddressId());
					custConts[index].setState(contactVals[index].getState());
					custConts[index].setRemarks(contactVals[index].getRemarks());
					custConts[index].setFaxNumber(contactVals[index].getFaxNumber());
					custConts[index].setAddressCode(contactVals[index].getAddressCode());
					custConts[index].setCustId(contactVals[index].getCustId());
					custConts[index].setAddressDetail(contactVals[index].getAddressDetail());
					custConts[index].setProtectExpDate(contactVals[index].getProtectExpDate());
					custConts[index].setCreateOpId(contactVals[index].getCreateOpId());
					custConts[index].setContactPerson(contactVals[index].getContactPerson());
					custConts[index].setDoneCode(contactVals[index].getDoneCode());
					custConts[index].setProtectEffDate(contactVals[index].getProtectEffDate());
					custConts[index].setExpireDate(contactVals[index].getExpireDate());
					custConts[index].setEffectiveDate(contactVals[index].getEffectiveDate());
					custConts[index].setOpId(contactVals[index].getOpId());
					custConts[index].setPriority(contactVals[index].getPriority());
					custConts[index].setCustContRelaId(contactVals[index].getCustContRelaId());
					custConts[index].setContNumber(contactVals[index].getContNumber());
					custConts[index].setOrgId(contactVals[index].getOrgId());
					custConts[index].setRegionId(contactVals[index].getRegionId());
					custConts[index].setCreateOrgId(contactVals[index].getCreateOrgId());
					custConts[index].setContMedTypeId(contactVals[index].getContMedTypeId());
					custConts[index].setIsNoDisturbing(contactVals[index].getIsNoDisturbing());
					custConts[index].setDoneDate(contactVals[index].getDoneDate());
					custConts[index].setExt5(contactVals[index].getExt5());
					custConts[index].setExt6(contactVals[index].getExt6());
					custConts[index].setPostalCode(contactVals[index].getPostalCode());
					custConts[index].setCreateDate(contactVals[index].getCreateDate());
					custConts[index].setExt1(contactVals[index].getExt1());
					custConts[index].setExt2(contactVals[index].getExt2());
					custConts[index].setEmailAddress(contactVals[index].getEmailAddress());
					custConts[index].setExt3(contactVals[index].getExt3());
					custConts[index].setExt4(contactVals[index].getExt4());
				}
				custInfo.setContactMedium(custConts);
			}
			
			IVOCustAddressValue[]  custAdds = value.getCustAddress();
			if(custAdds != null && custAdds.length > 0){
				int length = custAdds.length;
				CustAddress[] custAddress = new CustAddress[length];
				for(int index = 0 ; index < length ; index++){
					custAddress[index] = new CustAddress();
					custAddress[index].setAddressId(custAdds[index].getAddressId());
					custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
					address address = custAdds[index].getAddress();
					if(address != null){
						Address add = new Address();
						add.setCountry(address.getCountry());
						add.setAddressType(address.getAddressType());
						add.setDistrictId(address.getDistrictId());
						add.setZipcode(address.getZipcode());
						add.setCity(address.getCity());
						add.setCounty(address.getCounty());
						add.setStreetName(address.getStreetName());
						add.setApartment(address.getApartment());
						add.setFloor(address.getFloor());
						add.setHouseLetter(address.getHouseLetter());
						add.setHouseNumber(address.getHouseNumber());
						add.setMainDoor(address.getMainDoor());
						add.setDoorNumber(address.getDoorNumber());
						add.setAddrDesc(address.getAddrDesc());
						add.setBlackState(address.getBlackState());
						add.setDeliveryState(address.getDeliveryState());
						add.setMunicipality(address.getMunicipality());
						custAddress[index].setAddress(add);
					}
				}
				custInfo.setCustAddress(custAddress);
			}
			
			ICmCustomerSV cmCustomerSV = (ICmCustomerSV) ServiceFactory.getService(ICmCustomerSV.class);
			ICustManagerValue custManager = cmCustomerSV.queryMainCustManagersByCustId(custId);
			if(null != custManager ){
				CustManagerInfo custMgrInfo = new CustManagerInfo();
				custMgrInfo.setManagerId(custManager.getManagerId());
				custMgrInfo.setStaffName(custManager.getStaffName());
				custMgrInfo.setManagerType(custManager.getManagerType());
				custMgrInfo.setMobileNumber(custManager.getBillId());
				custMgrInfo.setContEmail(custManager.getContEmail());
				custInfo.setCustManager(custMgrInfo);
			}
			
			ICm2InterFSV inSv = (ICm2InterFSV) ServiceFactory.getService(ICm2InterFSV.class);
			IVOCustContactValue[] contactVOs = inSv.queryGroupContacts(custId, -1, "", -1);
			if(	contactVOs != null && contactVOs.length > 0){
				CustContactInfo[] custContact = new CustContactInfo[contactVOs.length] ;
				for(int index = 0 ; index < contactVOs.length ; index++){
					IContactValue  icontact = contactVOs[index].getContactValue();
					if(null != icontact ){
						CustContactInfo contact = new CustContactInfo();
						contact.setCustContId(icontact.getCustContId());
						contact.setFirstName(icontact.getFirstName());
						contact.setLastName(icontact.getLastName());
						contact.setPrioryLevel(icontact.getPrioryLevel());
						contact.setContType(icontact.getContType());
						contact.setContactPermissions(icontact.getContactPermissions());
						
						IBOCmContactContMediumValue[] contMeds =   contactVOs[index].getCustContMediums();
						if(contMeds!=null && contMeds.length>0){
							ContactContMedium[] contactConts = new ContactContMedium[contMeds.length];
							for(int kndex = 0 ; kndex < contMeds.length ; kndex ++ ){
								ContactContMedium cMed = new ContactContMedium();
								cMed.setContMedTypeId(contMeds[kndex].getContMedTypeId());
								cMed.setContNumber(contMeds[kndex].getContNumber());
								cMed.setEmailAddress(contMeds[kndex].getEmailAddress());
								cMed.setIsNoDisturbing(contMeds[kndex].getIsNoDisturbing());
								cMed.setPriority(contMeds[kndex].getPriority());
								contactConts[kndex] = cMed ;
							}
							contact.setContactContMedium(contactConts);
						}
						custContact[index] = contact ;
					}
					
				}
				custInfo.setCustContact(custContact);
			}
			custInfo.setAccounts(getAccountList(custId));
		}
		return custInfo;
	}

	public IndivCustInfo queryIndivCust(long custId, String opCode)
			throws Exception {
		ICm2SoSV sv = (ICm2SoSV )ServiceFactory.getService(ICm2SoSV.class);
		IVOCustValue  value = sv.queryCustomerDtl(custId);
		IndivCustInfo custInfo = null ;
		if(null != value){
			custInfo = new IndivCustInfo();
			ICustomerValue custVal =  value.getCustomer();
			if(custVal != null){
				custInfo.setCustName(custVal.getCustName());
				custInfo.setCustId(custVal.getCustId());
				custInfo.setFirstName(custVal.getFirstName());
				custInfo.setMiddleName(custVal.getMiddleName());
				custInfo.setLastName(custVal.getLastName());
				if(custVal.getCustCertType() == CmConstants.CertificateType.CPR ){
					custInfo.setIdNumber(custVal.getCustCertCode());
				}
				custInfo.setBirthDate(custVal.getBirthday());
				custInfo.setSegmentId(String.valueOf(custVal.getCustSegment()));
				custInfo.setSegmentName(custVal.getGroupSegmentId());
				custInfo.setCustStatus(custVal.getCustStatus());
				custInfo.setGender(custVal.getGender());
				custInfo.setPhysiologyStatus(custVal.getPhysiologicalState());
				
				DataContainer dc = new DataContainer();
				dc.set(IGroupMemberValue.S_MemberCustId, custVal.getCustId());
				ICmInterfaceSV memSv = (ICmInterfaceSV)ServiceFactory.getService(ICmInterfaceSV.class);
				IGroupMemberValue[] gms = memSv.queryGroupMembers(dc , -1 ,-1 );
				if(null != gms && gms.length > 0){
					custInfo.setEmployee(true);
					custInfo.setGroupCustId(gms[0].getCustId());
				}
			}
			
			IBOCmCustContactMediumValue[]  contactVals = value.getCustContMedium();
			if(	contactVals != null && contactVals.length > 0){
				int length = contactVals.length;
				CustContactMedium[] custConts = new CustContactMedium[length];
				for(int index = 0 ; index < length ; index++){
					custConts[index] = new CustContactMedium();
					custConts[index].setAddressId(contactVals[index].getAddressId());
					custConts[index].setState(contactVals[index].getState());
					custConts[index].setRemarks(contactVals[index].getRemarks());
					custConts[index].setFaxNumber(contactVals[index].getFaxNumber());
					custConts[index].setAddressCode(contactVals[index].getAddressCode());
					custConts[index].setCustId(contactVals[index].getCustId());
					custConts[index].setAddressDetail(contactVals[index].getAddressDetail());
					custConts[index].setProtectExpDate(contactVals[index].getProtectExpDate());
					custConts[index].setCreateOpId(contactVals[index].getCreateOpId());
					custConts[index].setContactPerson(contactVals[index].getContactPerson());
					custConts[index].setDoneCode(contactVals[index].getDoneCode());
					custConts[index].setProtectEffDate(contactVals[index].getProtectEffDate());
					custConts[index].setExpireDate(contactVals[index].getExpireDate());
					custConts[index].setEffectiveDate(contactVals[index].getEffectiveDate());
					custConts[index].setOpId(contactVals[index].getOpId());
					custConts[index].setPriority(contactVals[index].getPriority());
					custConts[index].setCustContRelaId(contactVals[index].getCustContRelaId());
					custConts[index].setContNumber(contactVals[index].getContNumber());
					custConts[index].setOrgId(contactVals[index].getOrgId());
					custConts[index].setRegionId(contactVals[index].getRegionId());
					custConts[index].setCreateOrgId(contactVals[index].getCreateOrgId());
					custConts[index].setContMedTypeId(contactVals[index].getContMedTypeId());
					custConts[index].setIsNoDisturbing(contactVals[index].getIsNoDisturbing());
					custConts[index].setDoneDate(contactVals[index].getDoneDate());
					custConts[index].setExt5(contactVals[index].getExt5());
					custConts[index].setExt6(contactVals[index].getExt6());
					custConts[index].setPostalCode(contactVals[index].getPostalCode());
					custConts[index].setCreateDate(contactVals[index].getCreateDate());
					custConts[index].setExt1(contactVals[index].getExt1());
					custConts[index].setExt2(contactVals[index].getExt2());
					custConts[index].setEmailAddress(contactVals[index].getEmailAddress());
					custConts[index].setExt3(contactVals[index].getExt3());
					custConts[index].setExt4(contactVals[index].getExt4());
				}
				custInfo.setContactMedium(custConts);
			}
			
			// 
			IVOCustAddressValue[]  custAdds = value.getCustAddress();
			if(custAdds != null && custAdds.length > 0){
				int length = custAdds.length;
				CustAddress[] custAddress = new CustAddress[length];
				for(int index = 0 ; index < length ; index++){
					custAddress[index] = new CustAddress();
					if(log.isInfoEnabled()){
						log.info("ContMedium : " + custAdds[index].getContMedium()) ;
					}
					if(custAdds[index].getContMedium() != null){
						custAddress[index].setAddressId(custAdds[index].getContMedium().getAddressId());
						custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
					}
					address address = custAdds[index].getAddress();
					if(address != null){
						Address add = new Address();
						add.setCountry(address.getCountry());
						add.setAddressType(address.getAddressType());
						add.setDistrictId(address.getDistrictId());
						add.setZipcode(address.getZipcode());
						add.setCity(address.getCity());
						add.setCounty(address.getCounty());
						add.setStreetName(address.getStreetName());
						add.setApartment(address.getApartment());
						add.setFloor(address.getFloor());
						add.setHouseLetter(address.getHouseLetter());
						add.setHouseNumber(address.getHouseNumber());
						add.setMainDoor(address.getMainDoor());
						add.setDoorNumber(address.getDoorNumber());
						add.setAddrDesc(address.getAddrDesc());
						add.setBlackState(address.getBlackState());
						add.setDeliveryState(address.getDeliveryState());
						add.setMunicipality(address.getMunicipality());
						custAddress[index].setAddress(add);
					}
				}
				custInfo.setCustAddress(custAddress);
			}
			custInfo.setAccounts(getAccountList(custId));
		}
		
		return custInfo;
	}
	
	
	/**
	 * 为TT单独重写的一个新的方法，返回客户的信息
	* <p>Title: </p>
	* <p>Description: </p>
	* <p>Company: AsiaInfo</p> 
	* @author YuJing
	* @date 2018-7-17
	* ICRMCommonRemote
	 */
	public IndivCustInfo queryIndivCustForTT(long custId, String opCode)
			throws Exception {
		ICm2SoSV sv = (ICm2SoSV )ServiceFactory.getService(ICm2SoSV.class);
		IVOCustValue  value = sv.queryCustomerDtlForTT(custId);
		IndivCustInfo custInfo = null ;
		if(null != value){
			custInfo = new IndivCustInfo();
			ICustomerValue custVal =  value.getCustomer();
			if(custVal != null){
				custInfo.setCustName(custVal.getCustName());
				custInfo.setCustId(custVal.getCustId());
				custInfo.setFirstName(custVal.getFirstName());
				custInfo.setMiddleName(custVal.getMiddleName());
				custInfo.setLastName(custVal.getLastName());
				if(custVal.getCustCertType() == CmConstants.CertificateType.CPR ){
					custInfo.setIdNumber(custVal.getCustCertCode());
				}
				custInfo.setBirthDate(custVal.getBirthday());
				custInfo.setSegmentId(String.valueOf(custVal.getCustSegment()));
				custInfo.setSegmentName(custVal.getGroupSegmentId());
				custInfo.setCustStatus(custVal.getCustStatus());
				custInfo.setGender(custVal.getGender());
				custInfo.setPhysiologyStatus(custVal.getPhysiologicalState());
				
				DataContainer dc = new DataContainer();
				dc.set(IGroupMemberValue.S_MemberCustId, custVal.getCustId());
				ICmInterfaceSV memSv = (ICmInterfaceSV)ServiceFactory.getService(ICmInterfaceSV.class);
				IGroupMemberValue[] gms = memSv.queryGroupMembers(dc , -1 ,-1 );
				if(null != gms && gms.length > 0){
					custInfo.setEmployee(true);
					custInfo.setGroupCustId(gms[0].getCustId());
				}
			}
			
			IBOCmCustContactMediumValue[]  contactVals = value.getCustContMedium();
			if(	contactVals != null && contactVals.length > 0){
				int length = contactVals.length;
				CustContactMedium[] custConts = new CustContactMedium[length];
				for(int index = 0 ; index < length ; index++){
					custConts[index] = getMappingInstance(CustContactMedium.class, contactVals[index]) ; 
//							new CustContactMedium();
				}
				custInfo.setContactMedium(custConts);
			}
			
			// 
			IVOCustAddressValue[]  custAdds = value.getCustAddress();
			if(custAdds != null && custAdds.length > 0){
				int length = custAdds.length;
				CustAddress[] custAddress = new CustAddress[length];
				for(int index = 0 ; index < length ; index++){
					custAddress[index] = new CustAddress();
					if(log.isInfoEnabled()){
						log.info("ContMedium : " + custAdds[index].getContMedium()) ;
					}
					if(custAdds[index].getContMedium() != null){
						custAddress[index].setAddressId(custAdds[index].getContMedium().getAddressId());
						custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
					}
				}
				custInfo.setCustAddress(custAddress);
			}
			custInfo.setAccounts(getAccountList(custId));
		}
		
		return custInfo;
	}
	
	private Account[] getAccountList(long custId) throws Exception{
		Account[] accounts = null ;
		ICm2SoSV sv = (ICm2SoSV)ServiceFactory.getService(ICm2SoSV.class);
		IBOCmCustAcctRelValue[]  values = sv.queryCsutAcctRel(custId, -1L, null, -1, -1, -1, null, -1, -1);
		if(null != values && values.length > 0){
			accounts = new Account[values.length];
			for(int i = 0 ; i < values.length ; i++){
				Account acct = new Account();
				acct.setAcctId(values[i].getAcctId());
				acct.setAcctName(values[i].getAcctName());
				acct.setAcctState(values[i].getState());
				accounts[i] = acct ;
			}
		}
		return accounts;
	}
	
	public AccountInfo getAccountInfo(long acctId , String opCode) throws Exception{
		AccountInfo accountInfo = null;		
		try {
			ICmAccountSV accountSv = (ICmAccountSV) ServiceFactory.getService(ICmAccountSV.class);
			ICm2SoSV sv = (ICm2SoSV) ServiceFactory.getService(ICm2SoSV.class);
			IBOCmCustAcctRelValue[] acctInfoArr = accountSv.queryCustAcctRelFor360(-1,  acctId, null,-1, -1, -1, null, null, -1, -1);
			DataContainer dc =sv.queryPayerByAcctId(acctId);
			if (null != acctInfoArr && acctInfoArr.length > 0) {				
				accountInfo = new AccountInfo();
				accountInfo.setAcctId(acctInfoArr[0].getAcctId());
				accountInfo.setAcctName(acctInfoArr[0].getAcctName());
				accountInfo.setAccountStatus(acctInfoArr[0].getExt1());
				accountInfo.setAcctState(acctInfoArr[0].getState());
			    accountInfo.setPayName((String)dc.get("PAYER_NAME")); 

			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
//			e.printStackTrace();
		}
		return accountInfo;
	}
	

	
//	public static void main(String[] args) throws Exception{
//		Class clazz = Class.forName("com.asiainfo.crm.agreement.template.termtemplate.ivalues.IBOAgrTermTemplateValue");
//		Method[] methods =  clazz.getDeclaredMethods();
//		IBOAgrTermTemplateValue  value = new BOAgrTermTemplateBean();
//		AgrTermTemplate term = new AgrTermTemplate();
//		value.setCreateDate(new Timestamp(new Date().getTime()));
//		value.setIsHistory(1L);
//		value.setDoneCode("AALLLL");
//		value.setOperatorId(1111111L);
//		System.out.println(methods.length);
//		term = new ICMCommonSV().getMappingInstance(AgrTermTemplate.class , value );
//		
//		System.out.println(term.getCreateDate());
//		System.out.println(term.getIsHistory());
//		System.out.println(term.getDoneCode());
//		System.out.println(term.getOperatorId());
//	}
	
	private <U> U getMappingInstance(Class<U> dest ,  Object src ) throws Exception{
		U u = dest.newInstance();
		Method[] methods =  dest.getDeclaredMethods();
		for(int i = 0 ; i < methods.length ; i ++){
			if(methods[i].getName().startsWith("set")){
				Method getMethod = src.getClass().getMethod(methods[i].getName().replaceFirst("set", "get"), new Class[]{});
				Object o = getMethod.invoke(src, new Object[]{});
			   methods[i].invoke(u, new Object[]{o});
			}
		}
		return u;
	}

	public String getPerferAgent(String phoneNumber , long custId, String opCode) throws Exception {
		
		if(StringUtils.isNotBlank(phoneNumber)){
			CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, phoneNumber);
			IInsUserValue user =  SoServiceFactory.getInstanceQrySV().getInstUserByBillId(phoneNumber);
			if(user != null){
				custId = user.getCustId();
			}
		}
		
		ICmCustomerSV sv = (ICmCustomerSV)ServiceFactory.getService(ICmCustomerSV.class);
		ICustomerValue  value = sv.queryCustomerByCustId(custId);	
		String perferAgent = null;
		if(null != value){
			if(CmConstants.CustomerType.INDIVIDUAL == value.getCustType()){
				perferAgent =  value.getExt1() ;
			}else if(CmConstants.CustomerType.GROUP == value.getCustType()){
				perferAgent =  value.getExt5();
			}
		}
		
		return perferAgent;
	}

	public CustComplexInfo[] queryCustomerDtlByIds(long[] custIds, String opCode) throws Exception {
		
		ICm2CsSV sv = (ICm2CsSV)ServiceFactory.getService(ICm2CsSV.class);
		IVOCustValue[] values = sv.queryCustByCustIds(custIds);
		CustComplexInfo[] custInfos = null;
		if( null != values && values.length > 0){
			custInfos = new CustComplexInfo[values.length];
			ICustomerValue  value = null;
			CustomerInfo customer = null;
			IBOCmCustContactMediumValue[] contactValue = null;
			for(int i = 0 ; i < values.length ; i ++ ){
				custInfos[i] = new CustComplexInfo();
				value = values[i].getCustomer();
				customer = getMappingInstance(CustomerInfo.class, value);
				custInfos[i].setCustomerInfo(customer);
				
				contactValue = values[i].getCustContMedium();
				if(null != contactValue && contactValue.length > 0){
					int length = contactValue.length;
					CustContactMedium[] custConts = new CustContactMedium[length];
					for(int index = 0 ; index < length ; index ++){
						custConts[index] = getMappingInstance(CustContactMedium.class, contactValue[index]) ;
					}
					custInfos[i].setCustContactMediums(custConts);
				}
				
				IVOCustAddressValue[] custAdds = values[i].getCustAddress();
				if(null != custAdds && custAdds.length > 0){
					int length = custAdds.length;
					CustAddress[] custAddress = new CustAddress[length];
					for(int index = 0 ; index < length ; index++){
						custAddress[index] = new CustAddress();
						custAddress[index].setAddressId(custAdds[index].getAddressId());
						if(custAdds[index].getContMedium() != null){
							custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
						}
						address address = custAdds[index].getAddress();
						if(address != null){
							Address add = getMappingInstance(Address.class, address);
							custAddress[index].setAddress(add);
						}
					}
					custInfos[i].setCustAddresses(custAddress);
				}
			}
		}
		
		return custInfos;
	}
	
	public CustComplexInfo queryCustomerDtlByPhoneNumber(String phoneNumber, String opCode) throws Exception {
		
		CenterFactory.setCenterInfoByTypeAndValue(CenterUtil.BILL_ID, phoneNumber);
		IInsUserValue user =  SoServiceFactory.getInstanceQrySV().getInstUserByBillId(phoneNumber);
		CustComplexInfo custInfo = null;
		if(user != null){
			ICrmInsFSV fsv = (ICrmInsFSV)ServiceFactory.getService(ICrmInsFSV.class);
			IInsCmRelValue relVal =  fsv.queryInsCmRelByUserId(user.getUserId());
			
			long[] custIds = null;
			if(relVal != null){
				custIds = new long[]{relVal.getCustId()};
			}else{
				custIds = new long[]{user.getCustId()};
			}
			
			ICm2CsSV sv = (ICm2CsSV)ServiceFactory.getService(ICm2CsSV.class);
			IVOCustValue[] values = sv.queryCustByCustIds(custIds);
			if(null != values && values.length > 0){
				custInfo = new CustComplexInfo();
				CustomerInfo customer = getMappingInstance(CustomerInfo.class, values[0].getCustomer());
				custInfo.setCustomerInfo(customer);
				
				IBOCmCustContactMediumValue[] contactValue = values[0].getCustContMedium();
				if(null != contactValue && contactValue.length > 0){
					int length = contactValue.length;
					CustContactMedium[] custConts = new CustContactMedium[length];
					for(int index = 0 ; index < length ; index ++){
						custConts[index] = getMappingInstance(CustContactMedium.class, contactValue[index]) ;
					}
					custInfo.setCustContactMediums(custConts);
				}
				
				IVOCustAddressValue[] custAdds = values[0].getCustAddress();
				if(null != custAdds && custAdds.length > 0){
					int length = custAdds.length;
					CustAddress[] custAddress = new CustAddress[length];
					for(int index = 0 ; index < length ; index++){
						custAddress[index] = new CustAddress();
						custAddress[index].setAddressId(custAdds[index].getAddressId());
//						custAddress[index].setContMedTypeId(custAdds[index].getContMedium().getContMedTypeId());
						address address = custAdds[index].getAddress();
						if(address != null){
							Address add = getMappingInstance(Address.class, address);
							custAddress[index].setAddress(add);
						}
					}
					custInfo.setCustAddresses(custAddress);
				}
			}
		}
		
		return custInfo;
	}
	
	
	
	public long[] getCustIdsByEmail(String email, int mediaType, String opCode) throws Exception{
		ICm2InterFSV sv = (ICm2InterFSV)ServiceFactory.getService(ICm2InterFSV.class);
		// Perfer mail = 22 
		return sv.queryCustomerByMedium(email, mediaType);
	}



	@Override
	public long queryAccountIdByServiceNum(String serviceNum, String opCode) throws Exception {
		long accountId = 0;
		if(log.isErrorEnabled()){
			StringBuilder logIn = new StringBuilder();
			logIn.append("ICMCommonSV.queryAccountIdByServiceNum()---Input Param ServiceNum :").append(serviceNum);
			log.error(logIn);
		}
		String regionId = CenterUtil.getRegionIdByBillId(serviceNum);

		if(StringUtils.isNotBlank(regionId)){
			CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, serviceNum);
            ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
			IInsUserValue userInfo = fsv.getUserInfoByBillId(serviceNum);
			if(null != userInfo){
				IInsAccrelValue[] iInsAccrelValue  = fsv.getInstAccrelByUserId(userInfo.getUserId(), OrderConst.ACCT_BASE_PAY_TYPE);
				if (null != iInsAccrelValue && iInsAccrelValue.length > 0) {
					IInsAccrelValue accrelValue = iInsAccrelValue[0];
					accountId = accrelValue.getAcctId();
				}
			}
		}else{
			// Voip  号码
			CenterUtil.generatorRegionId();
			IFixedLineInsSV fixSV = (IFixedLineInsSV)ServiceFactory.getCrossCenterService(IFixedLineInsSV.class);
			regionId = fixSV.getRegionIdByVoIPNum(serviceNum);
			if(StringUtils.isNotBlank(regionId)){
				CenterFactory.setCenterInfoByTypeAndValue(CenterConst.REGION_ID, regionId);
                ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
				IInsUserValue userInfo = fsv.getUserInfoByBillId(serviceNum);
				if(null != userInfo){
					IInsAccrelValue[] iInsAccrelValue  = fsv.getInstAccrelByUserId(userInfo.getUserId(), OrderConst.ACCT_BASE_PAY_TYPE);
					if (null != iInsAccrelValue && iInsAccrelValue.length > 0) {
						IInsAccrelValue accrelValue = iInsAccrelValue[0];
						accountId = accrelValue.getAcctId();
					}
				}
			}else{
				// add by zoudj 2016-1-28 通过副号查询
				ICrmExtFSV crmExtSV = (ICrmExtFSV) ServiceFactory.getCrossCenterService(ICrmExtFSV.class);
				IInsUserValue insUserByMultNumber = crmExtSV.getInsUserByMultNumber(serviceNum);
				if(null != insUserByMultNumber){
                    CenterFactory.setCenterInfoByTypeAndValue(CenterConst.BILL_ID, insUserByMultNumber.getBillId());
                    ICrmFSV fsv =  (ICrmFSV) ServiceFactory.getService(ICrmFSV.class);
					IInsAccrelValue[] iInsAccrelValue  = fsv.getInstAccrelByUserId(insUserByMultNumber.getUserId(), OrderConst.ACCT_BASE_PAY_TYPE);
					if (null != iInsAccrelValue && iInsAccrelValue.length > 0) {
						IInsAccrelValue accrelValue = iInsAccrelValue[0];
						accountId = accrelValue.getAcctId();
					}
				}
			}
		}
		return accountId;
	}

	@Override
	public BOB2BCustomerInfoBean[] queryB2BCustomers(String customer_type, String customer_state,
			String customer_status, String customer_certificate_id, String customer_id, String old_customer_id,
			String icc_id, String customer_name, String short_name, String subscriber_number, String account_id,
			String major_account_number, String address_type, String address_id, String contract_number,
			String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
			String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
			String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
			String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
			String opennetCustId, int startRow, int endRow) throws Exception {
		return B2bCustomerAdvanceSearchSupport.queryB2BCustomers(customer_type, customer_state, customer_status,
				customer_certificate_id, customer_id, old_customer_id, icc_id, customer_name, short_name,
				subscriber_number, account_id, major_account_number, address_type, address_id, contract_number,
				imsi_number, account_manager, cust_mana_group, segment, category, kob_number, cvr_number,
				contact_phone_number, ipAddress, cpeNumber, eanNumber, PBSNumber, billingAddress, invoiceNumber,
				emailAddress, ticketID, orderID, opCode, oldB2BAccountId, circuitB2BNumber, opennetCustId, startRow,
				endRow);
	}

	@Override
	public int countB2BCustomers(String customer_type, String customer_state, String customer_status,
			String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
			String customer_name, String short_name, String subscriber_number, String account_id,
			String major_account_number, String address_type, String address_id, String contract_number,
			String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
			String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
			String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
			String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
			String opennetCustId) throws Exception {
		return B2bCustomerAdvanceSearchSupport.countB2BCustomers(customer_type, customer_state, customer_status,
				customer_certificate_id, customer_id, old_customer_id, icc_id, customer_name, short_name,
				subscriber_number, account_id, major_account_number, address_type, address_id, contract_number,
				imsi_number, account_manager, cust_mana_group, segment, category, kob_number, cvr_number,
				contact_phone_number, ipAddress, cpeNumber, eanNumber, PBSNumber, billingAddress, invoiceNumber,
				emailAddress, ticketID, orderID, opCode, oldB2BAccountId, circuitB2BNumber, opennetCustId);
	}

}
