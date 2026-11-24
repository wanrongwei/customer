package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class ModifyCustAddressVO {
     @JsonAlias("CONT_RELA_ID")
     private long contRelaId;
     @JsonAlias("ADDRESS")
     private String address;
     @JsonAlias("IS_PROTECTED")
     private int isProtected;
     @JsonAlias("EFF_DATE")
     private String effDate;
     @JsonAlias("EXP_DATE")
     private String expDate;
     @JsonAlias("ADDRESS_TYPE")
     private String addressType;
     @JsonAlias("ADDRESS_ID")
     private String addressId;
     @JsonAlias("CONTACT_PERSON")
     private String contactPerson;
     @JsonAlias("OLD_CONTACT_PERSON")
     private String oldContactPerson;
     @JsonAlias("CUST_ID")
     private long custId;
}
