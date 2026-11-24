package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "客户查询实体")
public class QueryB2BCustomerVO {
	@Schema(description = "客户ID")
	 @JsonAlias("CUST_ID")
     private String custId;
	@Schema(description = "客户名称")
	 @JsonAlias("CUST_NAME")
     private String custName;
	 @JsonAlias("CUST_STATUS")
     private String custStatus;
	 @JsonAlias("CUST_CERT_CODE")
     private String custCertCode;
	 @JsonAlias("START_CREATE_DATE")
     private String startCreateDate;
	 @JsonAlias("END_CREATE_DATE")
     private String endCreateDate;
	 @JsonAlias("MANAGER_ID")
     private String managerId;
	 @JsonAlias("CVR_NUMBER")
     private String cvrNumber;
	 @JsonAlias("CONT_MOBILE")
     private String contMobile;
	 @JsonAlias("CUST_SERVICE_ID")
     private String custServiceId;
	 @JsonAlias("CUST_TYPE")
     private String custType;
	 @JsonAlias("MATCH_TYPE")
     private String matchType;
	 @JsonAlias("QRY_TYPE")
     private String qryType;
	 @JsonAlias("MEMBER_TYPE")
     private String memberType;
	 @JsonAlias("GROUP_CUST_SEGEMENT")
     private String groupCustSegement;
	 @JsonAlias("CITY_ID")
     private String cityId;
	 @JsonAlias("COUNTY_ID")
     private String countyId;
	 @JsonAlias("CUST_SERVICE_LEVEL")
     private String custServiceLevel;
	 @JsonAlias("CUST_CERT_ADDRESS")
     private String custCertAddress;
	 @JsonAlias("PROD_NAME")
     private String prodName;
	 @JsonAlias("EFFECTIVE_DATE")
     private String effectiveDate;
	 @JsonAlias("EXPIRIE_DATE")
     private String expirieDate;
	 @JsonAlias("MANAGER_CODE")
     private String managerCode;
	 @JsonAlias("COUNTY_CODE")
     private String countyCode;
	 @JsonAlias("MEMBER_BILL_ID")
     private String memberBillId;
	 @JsonAlias("ACCOUNT_ID")
     private String accountId;
	 @JsonAlias("BILL_ID")
     private String BillId;
	 @JsonAlias("PAGE")
     private int page;
	 @JsonAlias("SIZE")
     private int size;

	/** B2B export: first row in result set (1-based, inclusive). Use with {@link #exportEndRow}. Optional. */
	@Schema(description = "Export start row (1-based inclusive). Use with exportEndRow to export a row range; max range length 3000.")
	@JsonAlias("EXPORT_START_ROW")
	private int exportStartRow;

	/** B2B export: last row in result set (1-based, inclusive). */
	@Schema(description = "Export end row (1-based inclusive).")
	@JsonAlias("EXPORT_END_ROW")
	private int exportEndRow;

}
