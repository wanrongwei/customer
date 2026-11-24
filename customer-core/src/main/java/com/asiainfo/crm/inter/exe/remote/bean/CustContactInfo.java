package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class CustContactInfo implements Serializable {
	
	public long custContId ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_GROUP_CUST_CONT_TYPE' ;
	 */
	public int contType ;
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_GROUP_CUST_CONT_PRIORY_LEVEL' ;
	 */
	public int prioryLevel ;
	public String firstName ;
	public String lastName ;
	public int contactPermissions;
	public ContactContMedium[] contactContMedium ;
	public long getCustContId() {
		return custContId;
	}
	public void setCustContId(long custContId) {
		this.custContId = custContId;
	}
	public int getContType() {
		return contType;
	}
	public void setContType(int contType) {
		this.contType = contType;
	}
	public int getPrioryLevel() {
		return prioryLevel;
	}
	public void setPrioryLevel(int prioryLevel) {
		this.prioryLevel = prioryLevel;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getContactPermissions() {
		return contactPermissions;
	}
	public void setContactPermissions(int contactPermissions) {
		this.contactPermissions = contactPermissions;
	}
	public ContactContMedium[] getContactContMedium() {
		return contactContMedium;
	}
	public void setContactContMedium(ContactContMedium[] contactContMedium) {
		this.contactContMedium = contactContMedium;
	}
	
	
}
