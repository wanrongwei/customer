package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class GroupCustInfo implements Serializable {

	private long custId ;
	private String companyName ;
	private String segmentId ;
	private String segmentName ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_STATUS_3' ;
	 */
	private int custStatus ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_CERT_TYPE_3' ;
	 */
	private int idType ;
	private String idNumber ;

	private CustAddress[] custAddress ;
	private CustContactMedium[] contactMedium ;
	private CustContactInfo[] custContact ;
	private CustManagerInfo custManager ;
	
	private Account[] accounts ;
	
	
	public Account[] getAccounts() {
		return accounts;
	}
	public void setAccounts(Account[] accounts) {
		this.accounts = accounts;
	}
	public CustManagerInfo getCustManager() {
		return custManager;
	}
	public void setCustManager(CustManagerInfo custManager) {
		this.custManager = custManager;
	}
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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
	public int getCustStatus() {
		return custStatus;
	}
	public void setCustStatus(int custStatus) {
		this.custStatus = custStatus;
	}
	public int getIdType() {
		return idType;
	}
	public void setIdType(int idType) {
		this.idType = idType;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
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
	public CustContactInfo[] getCustContact() {
		return custContact;
	}
	public void setCustContact(CustContactInfo[] custContact) {
		this.custContact = custContact;
	}
	
	
}
