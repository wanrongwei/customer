package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class CustComplexInfo implements Serializable{

	public CustomerInfo customerInfo;
	
	public CustAddress[] custAddresses;
	
	public CustContactMedium[] custContactMediums;

	public CustomerInfo getCustomerInfo() {
		return customerInfo;
	}

	public void setCustomerInfo(CustomerInfo customerInfo) {
		this.customerInfo = customerInfo;
	}

	public CustAddress[] getCustAddresses() {
		return custAddresses;
	}

	public void setCustAddresses(CustAddress[] custAddresses) {
		this.custAddresses = custAddresses;
	}

	public CustContactMedium[] getCustContactMediums() {
		return custContactMediums;
	}

	public void setCustContactMediums(CustContactMedium[] custContactMediums) {
		this.custContactMediums = custContactMediums;
	}
	
	
	
}
