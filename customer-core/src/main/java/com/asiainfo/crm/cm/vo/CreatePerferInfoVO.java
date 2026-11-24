package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

import java.util.List;

@Data
public class CreatePerferInfoVO {
     @JsonAlias("CUST_ID")
     private String custId;
     @JsonAlias("CUST_PERFER_INFO_VOLIST")
     private List<CmCustPerferInfoVO> custPerferInfoVOList;
}
