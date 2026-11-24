package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class AccountInfo implements Serializable{
	private long acctId ; 
	private String acctName ;
	private String accountStatus ;
	private String acctState ;
	private String payName ;
	
	public long getAcctId() {
		return acctId;
	}
	public void setAcctId(long acctId) {
		this.acctId = acctId;
	}
	public String getAcctName() {
		return acctName;
	}
	public void setAcctName(String acctName) {
		this.acctName = acctName;
	}
	public String getAccountStatus() {
		return accountStatus;
	}
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}
	public String getAcctState() {
		return acctState;
	}
	public void setAcctState(String acctState) {
		this.acctState = acctState;
	}
	public String getPayName() {
		return payName;
	}
	public void setPayName(String payName) {
		this.payName = payName;
	}	
}
