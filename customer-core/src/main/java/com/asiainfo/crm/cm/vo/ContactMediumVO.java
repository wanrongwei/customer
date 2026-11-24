package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class ContactMediumVO {
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("CUST_CONT_RELA_ID")
     private long custContRelaId;
     @JsonAlias("CONT_MED_TYPE_ID")
     private long contMedTypeId;
     @JsonAlias("UP_CONT_MED_TYPE_ID")
     private long upContMedTypeId;
     @JsonAlias("ADDRESS_CODE")
     private String addressCode;
     @JsonAlias("CONT_NUMBER")
     private String contNumber;
     @JsonAlias("CONT_MED_TYPE_NAME")
     private String contMedTypeName;
     @JsonAlias("EMAIL_ADDRESS")
     private String emailAddress;
     @JsonAlias("PRIORITY")
     private long priority;
     @JsonAlias("IS_NO_DISTURBING")
     private String isNoDisturbing;
     @JsonAlias("EFFECTIVE_DATE")
     private String effectiveDate;
     @JsonAlias("REMARKS")
     private String remarks;
     @JsonAlias("REGION_ID")
     private String regionId;
}
