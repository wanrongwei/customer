package com.asiainfo.crm.cm.vo;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CustRelVO {
	 @JsonAlias("CUST_ID")
     private long custId;
	 @JsonAlias("CUST_TYPE")
     private long custType;
	 @JsonAlias("REL_CUST_ID")
     private long relCustId;
	 @JsonAlias("REL_TYPE")
     private long relType;
	 @JsonAlias("REL_ID")
	 private long relId;
	 @JsonAlias("REGION_ID")
	 private String regionId;
	 @JsonAlias("CREATE_DATE")
	 private Timestamp createDate;
	 @JsonAlias("STATE")
	 private String state;

}
