package com.asiainfo.crm.cm.vo;

import java.util.Date;

import com.aie.api.tool.FlexibleDateDeserializer;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import lombok.Data;

@Data
public class CmCustMemberVO {
    @JsonAlias("DEPT_ID")
    private Long deptId;

    @JsonAlias("MEMBER_CUST_ID")
    private Long memberCustId;

    @JsonAlias("STATE")
    private String state;

    @JsonAlias("REMARKS")
    private String remarks;

    @JsonAlias("CUST_REGION_ID")
    private String custRegionId;

    @JsonAlias("MEMBER_NAME_QRY")
    private String memberNameQry;

    @JsonAlias("FIRST_NAME")
    private String firstName;

    @JsonAlias("CUST_ID")
    private Long custId;

    @JsonAlias("CREATE_OP_ID")
    private Long createOpId;

    @JsonAlias("MEMBER_NAME")
    private String memberName;

    @JsonAlias("MEMBER_TYPE")
    private String memberType;

    @JsonAlias("DONE_CODE")
    private Long doneCode;

    @JsonAlias("MEMBER_ROLE")
    private String memberRole;

    @JsonAlias("CUST_REL_ID")
    private Long custRelId;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EXPIRE_DATE")
    private Date expireDate;

    @JsonAlias("OP_ID")
    private Long opId;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EFFECTIVE_DATE")
    private Date effectiveDate;

    @JsonAlias("USER_ID")
    private String userId;

    @JsonAlias("LAST_NAME_QRY")
    private String lastNameQry;

    @JsonAlias("MEMBER_STATUS")
    private String memberStatus;

    @JsonAlias("LAST_NAME")
    private String lastName;

    @JsonAlias("ORG_ID")
    private Long orgId;

    @JsonAlias("REGION_ID")
    private String regionId;

    @JsonAlias("CREATE_ORG_ID")
    private Long createOrgId;

    @JsonAlias("MEMBER_POSITION")
    private String memberPosition;

    @JsonAlias("PROVIDE_ID")
    private String provideId;

    @JsonAlias("MIDDLE_NAME")
    private String middleName;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("DONE_DATE")
    private Date doneDate;

    @JsonAlias("MEMBER_DESC")
    private String memberDesc;

    @JsonAlias("FIRST_NAME_QRY")
    private String firstNameQry;

    @JsonAlias("BILL_ID")
    private String billId;

    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("CREATE_DATE")
    private Date createDate;

    @JsonAlias("MIDDLE_NAME_QRY")
    private String middleNameQry;

    @JsonAlias("BRAND")
    private String brand;
}
