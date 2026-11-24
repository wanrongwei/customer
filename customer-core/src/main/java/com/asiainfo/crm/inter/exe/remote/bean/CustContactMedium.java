package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class CustContactMedium implements Serializable {
	public long addressId ;

	public String state ;

	public String remarks ;

	public String faxNumber ;

	public String addressCode ;

	public long custId ;

	public String addressDetail ;

	public Timestamp protectExpDate ;

	public long createOpId ;

	public String contactPerson ;

	public long doneCode ;

	public Timestamp protectEffDate ;

	public Timestamp expireDate ;

	public Timestamp effectiveDate ;

	public long opId ;

	public long priority ;

	public long custContRelaId ;

	public String contNumber ;

	public long orgId ;

	public String regionId ;

	public long createOrgId ;

	/**
	 * SELECT * FROM party.`cm_cust_cont_med_type_21` t WHERE t.`USE_TYPE` = 0 AND t.`UP_CONT_MED_TYPE_ID` IN (2 ,3) ;
	 */
	public long contMedTypeId ;

	/**
	 * 0:不可打扰
	 * 1：可打扰
	 */
	public long isNoDisturbing ;

	public Timestamp doneDate ;

	public String ext5 ;

	public String ext6 ;

	public String postalCode ;

	public Timestamp createDate ;

	public String ext1 ;

	public String ext2 ;

	public String emailAddress ;

	public String ext3 ;

	public String ext4 ;

	public long getAddressId() {
		return addressId;
	}

	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}

	public long getCustId() {
		return custId;
	}

	public void setCustId(long custId) {
		this.custId = custId;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public Timestamp getProtectExpDate() {
		return protectExpDate;
	}

	public void setProtectExpDate(Timestamp protectExpDate) {
		this.protectExpDate = protectExpDate;
	}

	public long getCreateOpId() {
		return createOpId;
	}

	public void setCreateOpId(long createOpId) {
		this.createOpId = createOpId;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public long getDoneCode() {
		return doneCode;
	}

	public void setDoneCode(long doneCode) {
		this.doneCode = doneCode;
	}

	public Timestamp getProtectEffDate() {
		return protectEffDate;
	}

	public void setProtectEffDate(Timestamp protectEffDate) {
		this.protectEffDate = protectEffDate;
	}

	public Timestamp getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Timestamp expireDate) {
		this.expireDate = expireDate;
	}

	public Timestamp getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Timestamp effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public long getOpId() {
		return opId;
	}

	public void setOpId(long opId) {
		this.opId = opId;
	}

	public long getPriority() {
		return priority;
	}

	public void setPriority(long priority) {
		this.priority = priority;
	}

	public long getCustContRelaId() {
		return custContRelaId;
	}

	public void setCustContRelaId(long custContRelaId) {
		this.custContRelaId = custContRelaId;
	}

	public String getContNumber() {
		return contNumber;
	}

	public void setContNumber(String contNumber) {
		this.contNumber = contNumber;
	}

	public long getOrgId() {
		return orgId;
	}

	public void setOrgId(long orgId) {
		this.orgId = orgId;
	}

	public String getRegionId() {
		return regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public long getCreateOrgId() {
		return createOrgId;
	}

	public void setCreateOrgId(long createOrgId) {
		this.createOrgId = createOrgId;
	}

	public long getContMedTypeId() {
		return contMedTypeId;
	}

	public void setContMedTypeId(long contMedTypeId) {
		this.contMedTypeId = contMedTypeId;
	}

	public long getIsNoDisturbing() {
		return isNoDisturbing;
	}

	public void setIsNoDisturbing(long isNoDisturbing) {
		this.isNoDisturbing = isNoDisturbing;
	}

	public Timestamp getDoneDate() {
		return doneDate;
	}

	public void setDoneDate(Timestamp doneDate) {
		this.doneDate = doneDate;
	}

	public String getExt5() {
		return ext5;
	}

	public void setExt5(String ext5) {
		this.ext5 = ext5;
	}

	public String getExt6() {
		return ext6;
	}

	public void setExt6(String ext6) {
		this.ext6 = ext6;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getExt1() {
		return ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	public String getExt2() {
		return ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getExt3() {
		return ext3;
	}

	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}

	public String getExt4() {
		return ext4;
	}

	public void setExt4(String ext4) {
		this.ext4 = ext4;
	}
	
	
}
