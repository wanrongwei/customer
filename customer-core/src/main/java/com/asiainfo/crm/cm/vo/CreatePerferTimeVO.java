package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

import java.util.List;

@Data
public class CreatePerferTimeVO {
     @JsonAlias("CUST_ID")
     private String custId;
     @JsonAlias("PREFER_CHANNEL_ID")
     private String preferChannelId;
     @JsonAlias("CUST_PERFER_INFO_VOLIST")
     private List<CmCustPerferTimeVO> custPerferInfoVOList;
}
