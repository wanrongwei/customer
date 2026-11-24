package com.asiainfo.crm.cm.vo;

import java.sql.Timestamp;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmB2BCustomerVO{
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("PARTY_ID")
     private long partyId;
     @JsonAlias("PARENT_CUST_ID")
     private long parentCustId;
     @JsonAlias("CUST_SERVICE_ID")
     private String custServiceId;// Old Customer ID，老客户ID
     @JsonAlias("CUST_NAME")
     private String custName;// Company Name，集团客户名称
     @JsonAlias("SHORT_NAME")
     private String shortName;// Short Name，简称
     @JsonAlias("CUST_STATUS")
     private int custStatus;// Status，状态
     @JsonAlias("CUST_ZIPCODE")
     private String custZipcode;// Postcode，邮政编码
     @JsonAlias("CUST_ADDRESS")
     private String custAddress;
     @JsonAlias("CUST_CERT_TYPE")
     private int custCertType;
     @JsonAlias("CUST_CERT_CODE")
     private String custCertCode;// KOB Number，KOB编码
     @JsonAlias("CUST_CERT_ADDRESS")
     private String custCertAddress;
     @JsonAlias("CUST_CERT_EFF_DATE")
     private String custCertEffDate;
     @JsonAlias("CUST_CERT_EXPIRE")
     private String custCertExpire;
     @JsonAlias("CUST_LANGUAGE")
     private String custLanguage;
     @JsonAlias("CUST_PASSWORD")
     private String custPassword;// Customer Password，客户密码
     @JsonAlias("CUST_SERVICE_LEVEL")
     private int custServiceLevel;// Category，服务等级
     @JsonAlias("CREDIT_LEVEL")
     private String creditLevel;// Credit Level，信用等级
     @JsonAlias("CREDIT_VALUE")
     private long creditValue;// Credit Limit，信用额度
     @JsonAlias("IS_REVISABLE")
     private int isRevisable;// Update Flag，信誉度允许可被修改
     @JsonAlias("STAFF_AMOUNT_TYPE")
     private String staffAmountType;// Employee Number Range，员工数量类型
     @JsonAlias("STAFF_AMOUNT")
     private long staffAmount;// Employee Quantity，员工数量
     @JsonAlias("HQ_NUMBER")
     private String hqNumber;
     @JsonAlias("GROUP_FAX")
     private String groupFax;
     @JsonAlias("GROUP_WEB")
     private String groupWeb;// Website，集团网址
     @JsonAlias("LEGAL_CUST_ID")
     private long legalCustId;
     @JsonAlias("LEGAL_CUST_NAME")
     private String legalCustName;
     @JsonAlias("VOCATION")
     private int vocation;
     @JsonAlias("SUB_VOCATION")
     private int subVocation;
     @JsonAlias("GROUP_TYPE")
     private int groupType;// Company Type，集团类型
     @JsonAlias("REG_AMOUNT")
     private long regAmount;// Registered Capital，注册资金
     @JsonAlias("NATIONALITY")
     private String nationality;
     @JsonAlias("PROVINCE_ID")
     private String provinceId;
     @JsonAlias("CITY_ID")
     private String cityId;
     @JsonAlias("COUNTY_ID")
     private String countyId;
     @JsonAlias("TOWN_ID")
     private long townId;
     @JsonAlias("VILLEGE_ID")
     private long villegeId;
     @JsonAlias("DEVELOP_TYPE")
     private int developType;// Missing KOB number Reason，外国集团类型
     @JsonAlias("EC_CODE")
     private String ecCode;
     @JsonAlias("ACCOUNT_CYCLE")
     private int accountCycle;
     @JsonAlias("GROUP_SUB_TYPE")
     private int groupSubType;// Subsegment，集团客户子类型
     @JsonAlias("ESTABLISHED")
     private int established;
     @JsonAlias("REMARKS")
     private String remarks;// Remarks，备注
     @JsonAlias("PERFER_LANGUAGE")
     private String perferLanguage;// Preferred Language，偏好语言
     @JsonAlias("STATE")
     private String state;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("CMX_GROUP_CUSTOMER")
     private CmxGroupCustomerVO cmxGroupCustomer;
     @JsonAlias("CM_GROUP_ACCOUNTING")
     private CmGroupAccountingVO cmGroupAccounting;
     @JsonAlias("CM_GROUP_MANAGER")
     private CmGroupManagerVO cmGroupManager;
     @JsonAlias("CM_IDENTIFICATION")
     private CmIdentificationVO cmIdentification;

     @JsonAlias("GROUP_SEGMENT_ID")
     private String groupSegmentId;
     @JsonAlias("CUST_SEGMENT")
     private String custSegment;
     @JsonAlias("ALLOW_INHERITABLE")
     private String allowInheritable;
     @JsonAlias("ALLOW_REVISABLE")
     private String allowRevisable;
     @JsonAlias("ALLOW_CREDIT_CALCULATED")
     private String allowCreditCalculated;
     @JsonAlias("ALLOW_APPROVABLE")
     private String allowApprovable;
     @JsonAlias("LAST_SEGEMENT_ID")
     private String lastSegementId;
     @JsonAlias("LAST_ZIP_CODE")
     private String lastZipCode;

     @JsonAlias("CUST_TYPE")
     private int custType;
     // @JsonDeserialize(using = FlexibleDateDeserializer.class)
     @JsonAlias("CREATE_DATE")
     private Timestamp createDate;
     // @JsonDeserialize(using = FlexibleDateDeserializer.class)
     @JsonAlias("DONE_DATE")
     private Timestamp doneDate;
     // @JsonDeserialize(using = FlexibleDateDeserializer.class)
     @JsonAlias("EXPIRE_DATE")
     private Timestamp expireDate;
}
