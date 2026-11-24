package com.asiainfo.crm.cm.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmIdentificationVO {
     @JsonAlias("IDEN_ID")
     private long idenId;
     @JsonAlias("PARTY_ID")
     private long partyId;
     @JsonAlias("IDEN_TYPE")
     private long idenType;
     @JsonAlias("IDEN_SUB_TYPE")
     private long idenSubType;
     @JsonAlias("IDEN_NR")
     private String idenNr;// Apple Dept ID
     @JsonAlias("IDEN_ADDRESS")
     private String idenAddress;
     @JsonAlias("ISSUER_AUTHORITY")
     private String issuerAuthority;
     @JsonAlias("IDEN_EFF_DATE")
     private Timestamp idenEffDate;
     @JsonAlias("IDEN_EXP_DATE")
     private Timestamp idenExpDate;
     @JsonAlias("STATUS")
     private String status;
     @JsonAlias("STATUS_DATE")
     private Timestamp statusDate;
     @JsonAlias("STATE")
     private String state;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("REMARKS")
     private String remarks;
}
