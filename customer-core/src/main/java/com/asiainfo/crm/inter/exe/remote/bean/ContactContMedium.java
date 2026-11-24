package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class ContactContMedium implements Serializable {

	/**
	 * SELECT * FROM party.`cm_cust_cont_med_type_21` t WHERE t.`USE_TYPE` = 1
	 */
	public long contMedTypeId ;
	public String emailAddress ;
	public String contNumber ;
	public int priority ;
	/**
	 * 0:不可打扰
	 * 1：可打扰
	 */
	public int isNoDisturbing ;
	public long getContMedTypeId() {
		return contMedTypeId;
	}
	public void setContMedTypeId(long contMedTypeId) {
		this.contMedTypeId = contMedTypeId;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getContNumber() {
		return contNumber;
	}
	public void setContNumber(String contNumber) {
		this.contNumber = contNumber;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getIsNoDisturbing() {
		return isNoDisturbing;
	}
	public void setIsNoDisturbing(int isNoDisturbing) {
		this.isNoDisturbing = isNoDisturbing;
	}
	
}
