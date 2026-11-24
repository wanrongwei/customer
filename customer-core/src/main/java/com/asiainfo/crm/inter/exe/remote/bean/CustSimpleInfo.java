package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class CustSimpleInfo implements Serializable {
	
	public long custId;
	
	public String custName ; 
	/**
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_TYPE' ;
	 */
	public int custType ;
	/**
	 * 个人
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_STATUS_1' ;
	 * 集团
	 * SELECT * FROM base.`bs_static_data` t WHERE t.`CODE_TYPE` = 'CM_CUST_STATUS_3' ;
	 */
	public int custStatus ;

	public long getCustId() {
		return custId;
	}

	public void setCustId(long custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public int getCustType() {
		return custType;
	}

	public void setCustType(int custType) {
		this.custType = custType;
	}

	public int getCustStatus() {
		return custStatus;
	}

	public void setCustStatus(int custStatus) {
		this.custStatus = custStatus;
	}
	
	

}
