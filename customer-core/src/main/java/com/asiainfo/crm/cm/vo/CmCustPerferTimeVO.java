package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import com.ai.appframe2.common.AIException;
import com.ai.appframe2.common.DataStructInterface;
import com.ai.appframe2.common.ObjectType;
import lombok.Data;

import java.util.HashMap;

@Data
public class CmCustPerferTimeVO  {
     @JsonAlias("CHANNEL_DONE_CODE")
     private   String channelDoneCode;
     @JsonAlias("TIME_BEGIN_UNIT")
     private   String timeBeginUnit;
     @JsonAlias("STATE")
     private   String state;
     @JsonAlias("REMARKS")
     private   String remarks;
     @JsonAlias("PREFER_CHANNEL_ID")
     private   String preferChannelId;
     @JsonAlias("PREFER_PERIOD_ID")
     private   String preferPeriodId;
     @JsonAlias("CHANNEL_REGION_ID")
     private   String channelRegionId;
     @JsonAlias("CUST_ID")
     private   String custId;
     @JsonAlias("CHANNEL_DONE_DATE")
     private   String channelDoneDate;
     @JsonAlias("DONE_CODE")
     private   String doneCode;
     @JsonAlias("TIME_TYPE")
     private   String timeType;
     @JsonAlias("CHANNEL_EFFECTIVE_DATE")
     private   String channelEffectiveDate;
     @JsonAlias("EXPIRE_DATE")
     private   String expireDate;
     @JsonAlias("EFFECTIVE_DATE")
     private   String effectiveDate ;
     @JsonAlias("OP_ID")
     private   String opId;
     @JsonAlias("CHANNEL_EXPIRE_DATE")
     private   String channelExpireDate;
     @JsonAlias("CHANNEL_CREATE_DATE")
     private   String channelCreateDate;
     @JsonAlias("CHANNEL_ORG_ID")
     private   String channelOrgId;
     @JsonAlias("CHANNEL_STATE")
     private   String channelState;
     @JsonAlias("CUST_CONT_RELA_ID")
     private String custContRelaId ;
     @JsonAlias("ORG_ID")
     private String orgId;
     @JsonAlias("REGION_ID")
     private String regionId ;
     @JsonAlias("PERFER_TYPE")
     private String perferType;
     @JsonAlias("CHANNEL_OP_ID")
     private String channelOpId;
     @JsonAlias("TIME_END_UNIT")
     private String timeEndUnit;
     @JsonAlias("DONE_DATE")
     private String doneDate;
     @JsonAlias("CREATE_DATE")
     private String createDate;
     @JsonAlias("PRIOR")
     private String prior;


}
