package com.asiainfo.crm.cm.vo;

import java.util.Date;

import com.aie.api.tool.FlexibleDateDeserializer;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import lombok.Data;

@Data
public class CmCustOrganizeVO {
    @JsonAlias("DEPT_ID")
    private long deptId;
    @JsonAlias("STATE")
    private String state;
    @JsonAlias("REMARKS")
    private String remarks;
    @JsonAlias("DEPT_TYPE")
    private int deptType;
    @JsonAlias("DEPT_NAME")
    private String deptName;
    @JsonAlias("HAS_LEAF")
    private int hasLeaf;
    @JsonAlias("IS_CONTACT_POINT")
    private long isContactPoint;
    @JsonAlias("IS_REVISABLE")
    private long isRevisable;
    @JsonAlias("CUST_ID")
    private long custId;
    @JsonAlias("CREATE_OP_ID")
    private long createOpId;
    @JsonAlias("PARENT_DEPT_ID")
    private long parentDeptId;
    @JsonAlias("IS_CPE_PROVISIONING_NEEDED")
    private String isCpeProvisioningNeeded;
    @JsonAlias("DONE_CODE")
    private long doneCode;
    @JsonAlias("WIFI_NAME")
    private String wifiName;
    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EXPIRE_DATE")
    private Date expireDate;
    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("EFFECTIVE_DATE")
    private Date effectiveDate;
    @JsonAlias("OP_ID")
    private long opId;
    @JsonAlias("REL_CUST_ID")
    private long relCustId;
    @JsonAlias("DEPT_LEVEL")
    private int deptLevel;
    @JsonAlias("IS_HAVE_CONTACT_POINT")
    private long isHaveContactPoint;
    @JsonAlias("PRINCIPAL")
    private String principal;
    @JsonAlias("ORG_ID")
    private long orgId;
    @JsonAlias("CREATE_ORG_ID")
    private long createOrgId;
    @JsonAlias("REGION_ID")
    private String regionId;
    @JsonAlias("WIFI_PASSWORD")
    private String wifiPassword;
    @JsonAlias("DEPT_FUNC")
    private String deptFunc;
    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("DONE_DATE")
    private Date doneDate;
    @JsonAlias("PRINCIPAL_TEL")
    private String principalTel;
    @JsonDeserialize(using = FlexibleDateDeserializer.class)
    @JsonAlias("CREATE_DATE")
    private Date createDate;
}
