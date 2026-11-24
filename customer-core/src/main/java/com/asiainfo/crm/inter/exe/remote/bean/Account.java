package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class Account implements Serializable{

	private static final long serialVersionUID = 6031730375138623374L;

	private long acctId ; 
	private String acctName ;
	private String acctState ;
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
	public String getAcctState() {
		return acctState;
	}
	public void setAcctState(String acctState) {
		this.acctState = acctState;
	}
	
	
	
}
