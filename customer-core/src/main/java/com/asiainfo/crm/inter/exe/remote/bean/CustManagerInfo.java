package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class CustManagerInfo implements Serializable {
	public long managerId ;
	public String staffName ;
	/**
	 * 
	 */
	public int managerType ;
	public String contEmail ;
	public String mobileNumber ;
	public long getManagerId() {
		return managerId;
	}
	public void setManagerId(long managerId) {
		this.managerId = managerId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public int getManagerType() {
		return managerType;
	}
	public void setManagerType(int managerType) {
		this.managerType = managerType;
	}
	public String getContEmail() {
		return contEmail;
	}
	public void setContEmail(String contEmail) {
		this.contEmail = contEmail;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	
	
}
