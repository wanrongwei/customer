package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;
import java.util.Date;

public class IndivCustInfo implements Serializable {
	
	private long custId ;
	private String firstName ;
	private String middleName ;
	private String lastName ;
	private String custName ;
	private String idNumber ;
	private String segmentId ;
	private String segmentName ;
	private Date birthDate ; 
	/**
	 * 生理状态
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_PHYSIOLOGICAL_STATE' ;
	 */
	private int physiologyStatus ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_GENDER' ;
	 */
	private int gender ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_STATUS_1' ;
	 */
	private int custStatus ;
	private boolean isEmployee ;
	private long groupCustId ;
	
	private CustAddress[] custAddress ;
	private CustContactMedium[] contactMedium ;
	
	private Account[] accounts ;
	
	public Account[] getAccounts() {
		return accounts;
	}
	public void setAccounts(Account[] accounts) {
		this.accounts = accounts;
	}
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getSegmentId() {
		return segmentId;
	}
	public void setSegmentId(String segmentId) {
		this.segmentId = segmentId;
	}
	public String getSegmentName() {
		return segmentName;
	}
	public void setSegmentName(String segmentName) {
		this.segmentName = segmentName;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public int getPhysiologyStatus() {
		return physiologyStatus;
	}
	public void setPhysiologyStatus(int physiologyStatus) {
		this.physiologyStatus = physiologyStatus;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getCustStatus() {
		return custStatus;
	}
	public void setCustStatus(int custStatus) {
		this.custStatus = custStatus;
	}
	public boolean isEmployee() {
		return isEmployee;
	}
	public void setEmployee(boolean isEmployee) {
		this.isEmployee = isEmployee;
	}
	public long getGroupCustId() {
		return groupCustId;
	}
	public void setGroupCustId(long groupCustId) {
		this.groupCustId = groupCustId;
	}
	public CustAddress[] getCustAddress() {
		return custAddress;
	}
	public void setCustAddress(CustAddress[] custAddress) {
		this.custAddress = custAddress;
	}
	public CustContactMedium[] getContactMedium() {
		return contactMedium;
	}
	public void setContactMedium(CustContactMedium[] contactMedium) {
		this.contactMedium = contactMedium;
	}
	
	
}
