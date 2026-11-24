package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmCustPerferInfoVO {
     @JsonAlias("MEDIUM_DONE_CODE")
     private String mediumDoneCode;
     @JsonAlias("CHANNEL_DONE_CODE")
     private   String channelDoneCode;
     @JsonAlias("PREFER_CHANNEL_ID")
     private   String preferChannelId;
     @JsonAlias("CHANNEL_REGION_ID")
     private  String channelRegionId;
     @JsonAlias("UP_CONT_MED_TYPE_ID")
     private   String upContMedTypeId;
     @JsonAlias("PREFER_CHANNEL_NAME")
     private   String preferChannelName;
     @JsonAlias("CUST_ID")
     private  String custId ;
     @JsonAlias("CHANNEL_DONE_DATE")
     private  String channelDoneDate;
     @JsonAlias("MEDIUM_EXPIRE_DATE")
     private  String mediumExpireDate;
     @JsonAlias("CONT_MED_TYPE_NAME")
     private  String contMedTypeName;
     @JsonAlias("CHANNEL_EXPIRE_DATE")
     private String channelExpireDate;
     @JsonAlias("CHANNEL_CREATE_DATE")
     private   String channelCreateDate;
     @JsonAlias("MEDIUM_DONE_DATE")
     private  String mediumDoneDate;
     @JsonAlias("PRIORITY")
     private   String priority;
     @JsonAlias("MEDIUM_ORG_ID")
     private  String mediumOrgId;
     @JsonAlias("CHANNEL_ORG_ID")
     private  String channelOrgId;
     @JsonAlias("CHANNEL_STATE")
     private  String channelState;
     @JsonAlias("CUST_CONT_RELA_ID")
     private   String custContRelaId ;

     @JsonAlias("CONT_MED_TYPE_ID")
     private  String contMedTypeId;
     @JsonAlias("PERFER_TYPE")
     private  String perferType;
     @JsonAlias("MEDIUM_REGION_ID")
     private  String mediumRegionId;
     @JsonAlias("CHANNEL_OP_ID")
     private   String channelOpId;
     @JsonAlias("MEDIUM_CREATE_DATE")
     private  String mediumCreateDate;
     @JsonAlias("MEDIUM_STATE")
     private  String mediumState;
     @JsonAlias("MEDIUM_CREATE_ORG_ID")
     private  String mediumCreateOrgId;
     @JsonAlias("PRIOR")
     private   String prior;
     @JsonAlias("EMAIL_ADDRESS")
     private  String emailAddress;
}
