package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class CustAddress implements Serializable {
	public long addressId;
	// CONT_MED_TYPE_ID
	/**
	 * SELECT * FROM party.`cm_cust_cont_med_type_21` t WHERE t.`USE_TYPE` = 0 AND t.`UP_CONT_MED_TYPE_ID` = 1 ;
	 */
	public long contMedTypeId ;
	private long priority;
	public Address address;

	
	public long getPriority() {
		return priority;
	}

	public void setPriority(long priority) {
		this.priority = priority;
	}

	public long getAddressId() {
		return addressId;
	}

	public void setAddressId(long addressId) {
		this.addressId = addressId;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public long getContMedTypeId() {
		return contMedTypeId;
	}

	public void setContMedTypeId(long contMedTypeId) {
		this.contMedTypeId = contMedTypeId;
	}
	

}
