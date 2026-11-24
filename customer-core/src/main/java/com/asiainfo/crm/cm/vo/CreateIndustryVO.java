package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import java.util.List;

import lombok.Data;

@Data
public class CreateIndustryVO {
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("INDUSTRYS")
     private List<IndustryVO> industrys;
}
