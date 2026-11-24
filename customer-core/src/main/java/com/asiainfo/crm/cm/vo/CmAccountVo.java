package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;

@Data
public class CmAccountVo {
    @JsonAlias("URGE_STOP_FLAG")
    private int urgeStopFlag;
    @JsonAlias("PAY_METHOD")
    private int payMethod;
    @JsonAlias("INSTALLMENT_FLAG")
    private int installmentFlag;
    @JsonAlias("CUST_ID")
    private long custId;
    @JsonAlias("ACCT_BEHALF_PHONE")
    private String acctBehalfPhone;
    @JsonAlias("CUST_NAME")
    private String custName;
    @JsonAlias("FIRST_NAME")
    private String firstName;
    @JsonAlias("LAST_NAME")
    private String lastName;
    @JsonAlias("CUST_CRED_CODE")
    private String custCredCode;
    @JsonAlias("TAX_ID")
    private String taxId;
    @JsonAlias("ACCT_TYPE")
    private int acctType;
    @JsonAlias("ACCT_STATUS")
    private int acctStatus;
    @JsonAlias("REGION_ID")
    private String regionId;
    @JsonAlias("EFFECTIVE_DATE")
    private String effectiveDate;
    @JsonAlias("EXPIRE_DATE")
    private String expireDate;
    @JsonAlias("ACCT_NAME")
    private String acctName;
    @JsonAlias("PAYMENT_ACCOUNT_NAME")
    private String paymentAccountName;
    @JsonAlias("BANK_CONTRACT")
    private String bankContract;
    @JsonAlias("PARTY_ID")
    private String partyId;
    @JsonAlias("OLD_PARTY_ID")
    private String oldPartyId;
    @JsonAlias("ACCT_PASSWORD")
    private String acctPassword;
    @JsonAlias("IS_CHOOSE_PAYER")
    private String isChoosePayer;
    @JsonAlias("ACCT_ID")
    private Long acctId;
 }
