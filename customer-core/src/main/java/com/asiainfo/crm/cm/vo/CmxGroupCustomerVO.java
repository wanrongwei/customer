package com.asiainfo.crm.cm.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmxGroupCustomerVO {
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("DIRECT_MARKETING_PROTECTION")
     private long directMarketingProtection;// Commercial Protection，营销免打扰标识
     @JsonAlias("PROTECT_EFF_DATE")
     private Timestamp protectEffDate;// Effective Date，免打扰生效时间
     @JsonAlias("PROTECT_EXPIRE_DATE")
     private Timestamp protectExpireDate;// Expire Date，免打扰失效时间
     @JsonAlias("IS_VPMN")
     private long isVpmn;
     @JsonAlias("BAD_PAYER")
     private String badPayer;
     @JsonAlias("ENT_TOTAL_EMPLOYEES")
     private long entTotalEmployees;
     @JsonAlias("COMPANY_STATUS")
     private long companyStatus;// Company Status，公司状态
     @JsonAlias("BI_COMPANY_NAME")
     private String biCompanyName;// Bi Company Name，商业名称
     @JsonAlias("ALIAS")
     private String alias;
     @JsonAlias("FORMER_NAME")
     private String formerName;// Former Name，曾用名
     @JsonAlias("TAX_ID")
     private String taxId;// CVR No.，增值税号
     @JsonAlias("TAX_FLAG")
     private long taxFlag;// Tax Flag，免税标记
     @JsonAlias("EXPENSE_TYPE")
     private long expenseType;
     @JsonAlias("HEAD_OFFICE")
     private String headOffice;// C/O Name，总部名称
     @JsonAlias("POST_PROVINCE")
     private String postProvince;
     @JsonAlias("CERTIFICATE_FILE_PATH")
     private String certificateFilePath;
     @JsonAlias("SERV_PROTOCOL_PATH")
     private String servProtocolPath;
     @JsonAlias("SERV_BEGIN_TIME")
     private Timestamp servBeginTime;
     @JsonAlias("SERV_END_TIME")
     private Timestamp servEndTime;
     @JsonAlias("SE_NUMBER")
     private long seNumber;
     @JsonAlias("LEGAL_FORM")
     private String legalForm;// Legal Form，法律形式
     @JsonAlias("REGISTRATION_NUMBER")
     private long registrationNumber;
     @JsonAlias("REGISTRATION_CODE")
     private String registrationCode;
     @JsonAlias("REGISTRATION_DATE")
     private Timestamp registrationDate;// Registration Date，注册日期
     @JsonAlias("WORKPLACE_CODE")
     private long workplaceCode;
     @JsonAlias("WORKPLACE_NUMBER")
     private long workplaceNumber;
     @JsonAlias("STOCK_EXCHANGE_FLAG")
     private String stockExchangeFlag;
     @JsonAlias("EXPORT_COUNTRY_CODE")
     private String exportCountryCode;
     @JsonAlias("EXPORT_TURNOVER_RATIO")
     private long exportTurnoverRatio;
     @JsonAlias("COMPANY_FORM_CODE")
     private String companyFormCode;
     @JsonAlias("SEND_PERSON_NAME")
     private String sendPersonName;
     @JsonAlias("PO_BOX")
     private String poBox;
     @JsonAlias("POSTAL_CITY")
     private String postalCity;
     @JsonAlias("CORPORATE_IDENTIFICATION_NUMBE")
     private String corporateIdentificationNumbe;// Legal Person ID，法人识别号
     @JsonAlias("CORPORATE_IDENTIFICATION_TEXT")
     private String corporateIdentificationText;
     @JsonAlias("CURRENCY_CODE")
     private String currencyCode;
     @JsonAlias("STATE")
     private String state;
     @JsonAlias("REMARKS")
     private String remarks;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("EXT1")
     private String ext1;// NP Stop，是否可以携号转网
     @JsonAlias("EXT2")
     private String ext2;
     @JsonAlias("EXT3")
     private String ext3;// Invoice Username，账单显示名称
     @JsonAlias("EXT4")
     private String ext4;
     @JsonAlias("EXT5")
     private String ext5;// Preferred Agent，偏好坐席工号
     @JsonAlias("EXT6")
     private String ext6;// Preferred Work Group，偏好技术组
     @JsonAlias("EXT7")
     private String ext7;// Preferred Department，偏好部门
     @JsonAlias("EXT8")
     private String ext8;
     @JsonAlias("EXT9")
     private String ext9;
     @JsonAlias("EXT10")
     private String ext10;
     @JsonAlias("EXT11")
     private String ext11;
     @JsonAlias("EXT12")
     private String ext12;
     @JsonAlias("EXT13")
     private String ext13;
     @JsonAlias("EXT14")
     private String ext14;
     @JsonAlias("EXT15")
     private String ext15;
     @JsonAlias("EXT16")
     private String ext16;
     @JsonAlias("EXT17")
     private String ext17;// Marketing Permission Remark，营销免打扰备注
     @JsonAlias("EXT18")
     private String ext18;
     @JsonAlias("EXT19")
     private long ext19;
     @JsonAlias("EXT20")
     private long ext20;
     @JsonAlias("EXT21")
     private long ext21;
     @JsonAlias("EXT22")
     private long ext22;// Stop Payment Fee，停止支付费用
     @JsonAlias("EXT23")
     private long ext23;
     @JsonAlias("EXT24")
     private long ext24;
     @JsonAlias("EXT25")
     private long ext25;
     @JsonAlias("EXT26")
     private long ext26;
     @JsonAlias("EXT27")
     private Timestamp ext27;
     @JsonAlias("EXT28")
     private Timestamp ext28;
     @JsonAlias("EXT29")
     private Timestamp ext29;
     @JsonAlias("EXT30")
     private Timestamp ext30;
     @JsonAlias("AKS_STATUS")
     private String aksStatus;
     @JsonAlias("AKS_REGISTRATION_DATE")
     private Timestamp aksRegistrationDate;
     @JsonAlias("UPDATE_FLAG")
     private long updateFlag;
     @JsonAlias("PREFERRED_PLATFORM")
     private String preferredPlatform;
}
