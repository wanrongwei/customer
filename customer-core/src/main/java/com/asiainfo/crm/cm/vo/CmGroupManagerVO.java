package com.asiainfo.crm.cm.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmGroupManagerVO {
     @JsonAlias("REL_ID")
     private long relId;
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("MANAGER_ID")
     private long managerId;
     @JsonAlias("OPER_TYPE")
     private long operType;
     @JsonAlias("REL_TYPE")
     private long relType;// Service Type，关系类型
     @JsonAlias("STATE")
     private String state;
     @JsonAlias("CREATE_DATE")
     private Timestamp createDate;
     @JsonAlias("DONE_DATE")
     private Timestamp doneDate;
     @JsonAlias("EFFECTIVE_DATE")
     private Timestamp effectiveDate;
     @JsonAlias("EXPIRE_DATE")
     private Timestamp expireDate;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("REMARKS")
     private String remarks;
}
