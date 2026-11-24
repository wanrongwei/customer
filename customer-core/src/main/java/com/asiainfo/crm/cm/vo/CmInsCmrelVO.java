package com.asiainfo.crm.cm.vo;

import java.util.Date;

import com.aie.api.tool.FlexibleDateDeserializer;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import lombok.Data;

@Data
public class CmInsCmrelVO {
    @JsonAlias("STATE")
    private long state;

    @JsonAlias("RELA_TYPE")
    private long relaType;

    @JsonAlias("REMARKS")
    private String remarks;

    @JsonAlias("EFFECTIVE_DATE_TYPE")
    private long effectiveDateType;

    @JsonAlias("USER_REGION_CODE")
    private String userRegionCode;

    @JsonAlias("CUST_ID")
    private long custId;

    @JsonAlias("PROD_CATALOG_ID")
    private long prodCatalogId;

    @JsonAlias("DONE_CODE")
    private long doneCode;

    @JsonAlias("ACTION")
    private String action;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EXPIRE_DATE")
    private Date expireDate;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EFFECTIVE_DATE")
    private Date effectiveDate;

    @JsonAlias("OP_ID")
    private long opId;

    @JsonAlias("USER_ID")
    private long userId;

    @JsonAlias("IS_ASSIGNED")
    private int isAssigned; // 布尔值建议用Boolean

    @JsonAlias("USER_TYPE")
    private long userType;

    @JsonAlias("ORG_ID")
    private long orgId;

    @JsonAlias("USER")
    private String user;

    @JsonAlias("CMREL_ID")
    private long cmrelId;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("DONE_DATE")
    private Date doneDate;

    @JsonAlias("OFFER_ID")
    private long offerId;

    @JsonAlias("EXPIRE_DATE_TYPE")
    private long expireDateType;

    @JsonAlias("BILL_ID")
    private String billId;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("CREATE_DATE")
    private Date createDate;

    @JsonAlias("EXT1")
    private String ext1;

    @JsonAlias("EXT2")
    private String ext2;

    @JsonAlias("EXT3")
    private String ext3;
}
