package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CreateCustAddressVO {
     @JsonAlias("ADDRESS_TYPE")
     private long addressType;
     @JsonAlias("ADDRESS_ID")
     private long addressId;
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("ADDRESS_NAME")
     private String addressName;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("EFF_DATE")
     private String effDate;
     @JsonAlias("EXP_DATE")
     private String expDate;
     @JsonAlias("CONTACT_PERSON")
     private String contactPerson;
}
