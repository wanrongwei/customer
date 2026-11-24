package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;

@Data
public class CmBillCycle {
    @JsonAlias("CYCLE_TYPE")
    private int cycleType;
    @JsonAlias("BILL_DAY")
    private int billDay;
    @JsonAlias("ACCT_ID")
    private Long acctId;
    @JsonAlias("REGION_ID")
    private String regionId;
    @JsonAlias("CYCLE_ID")
    private Long cycleId;
    @JsonAlias("CYCLE_UNIT")
    private int cycleUnit;
    @JsonAlias("BILL_DUE_DATE")
    private int billDueDate;
    @JsonAlias("CYCLE_TYPE_t_name")
    private String cycleTypeTName;
    @JsonAlias("BILL_DAY_t_name")
    private String billDayTName;
    @JsonAlias("REMARKS")
    private String remarks;
}
