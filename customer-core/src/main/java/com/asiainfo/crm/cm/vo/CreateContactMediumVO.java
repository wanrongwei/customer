package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import java.util.List;

import lombok.Data;

@Data
public class CreateContactMediumVO {
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("CONTACT_MEDIUMS")
     private List<ContactMediumVO> contactMediums;
}
