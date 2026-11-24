package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;


@Data
public class IndustryVO{
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("REL_ID")
     private String relId;
     @JsonAlias("INDUSTRY_ID")
     private String industryId;
     @JsonAlias("INDUSTRY_ID1")
     private String industryId1;
     @JsonAlias("INDUSTRY_ID2")
     private String industryId2;
     @JsonAlias("INDUSTRY_ID3")
     private String industryId3;
     @JsonAlias("INDUSTRY_ID4")
     private String industryId4;
}
