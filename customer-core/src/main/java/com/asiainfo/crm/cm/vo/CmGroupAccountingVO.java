package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CmGroupAccountingVO {
     @JsonAlias("CUST_ID")
     private long custId;
     @JsonAlias("LISTED_ON_STOCK_EXCHANGE")
     private String listedOnStockExchange;
     @JsonAlias("RATING_CODE")
     private String ratingCode;// Rating，评级编码
     @JsonAlias("FISCAL_YEAR")
     private String fiscalYear;// Fiscal Year，财政年份
     @JsonAlias("REVENUE")
     private String revenue;// Annual Revenue，收入
     @JsonAlias("LAST_YEAR_EMPLOYEES")
     private long lastYearEmployees;// Last Year Employee，上年员工数量
     @JsonAlias("ACCOUNT_REMARK")
     private String accountRemark;// Remarks，财政备注
     @JsonAlias("GROSS_PROFIT")
     private String grossProfit;
     @JsonAlias("EARNINGS")
     private String earnings;
     @JsonAlias("NET_PROFIT_YEARLY")
     private String netProfitYearly;
     @JsonAlias("STATUS_BALANCE")
     private String statusBalance;
     @JsonAlias("FIXED_SSETS")
     private String fixedSsets;
     @JsonAlias("LAND_AND_BUILDINGS")
     private String landAndBuildings;
     @JsonAlias("CURRENT_ASSETS")
     private String currentAssets;
     @JsonAlias("EQUITY")
     private String equity;
     @JsonAlias("PROVISIONS")
     private String provisions;
     @JsonAlias("SUBORDINATED_LOAN_CAPITAL")
     private String subordinatedLoanCapital;
     @JsonAlias("LONG_TERM_DEBT")
     private String longTermDebt;
     @JsonAlias("MORTGAGES")
     private String mortgages;
     @JsonAlias("SHORT_TERM_DEBT")
     private String shortTermDebt;
     @JsonAlias("COVERAGE")
     private String coverage;
     @JsonAlias("OPERATING_MARGIN")
     private String operatingMargin;
     @JsonAlias("RETURN_ON_ASSETS")
     private String returnOnAssets;
     @JsonAlias("DEGREE_OF_LIQUIDITY1")
     private String degreeOfLiquidity1;
     @JsonAlias("DEGREE_OF_LIQUIDITY2")
     private String degreeOfLiquidity2;
     @JsonAlias("SOLVENCY_RATIO")
     private String solvencyRatio;
     @JsonAlias("DEPRECIATION")
     private String depreciation;
     @JsonAlias("FINANCE_ITEMS")
     private String financeItems;
     @JsonAlias("OPERATING_PROFIT")
     private String operatingProfit;
     @JsonAlias("EXTRAORDINARY_ITEMS")
     private String extraordinaryItems;
     @JsonAlias("PROFIT_BEFORE_TAX")
     private String profitBeforeTax;
     @JsonAlias("CASH")
     private String cash;
     @JsonAlias("TRADE_CREDITORS")
     private String tradeCreditors;
     @JsonAlias("EMPLOYEES")
     private String employees;
     @JsonAlias("FINANCIAL_REVENUE")
     private String financialRevenue;
     @JsonAlias("FINANCIAL_EXPENDITURE")
     private String financialExpenditure;
     @JsonAlias("IMMAT_CONSTRUCTION_ACTIVITIES")
     private String immatConstructionActivities;
     @JsonAlias("MAT_CONSTRUCTION_ACTIVITIES")
     private String matConstructionActivities;
     @JsonAlias("PRIM_RES_PER_EMPLOYEE")
     private String primResPerEmployee;
     @JsonAlias("ORD_RES_PER_EMPLOYEE")
     private String ordResPerEmployee;
     @JsonAlias("NET_GAINS_PER_EMPLOYEE")
     private String netGainsPerEmployee;
     @JsonAlias("FIXED_ASSETS_PER_EMPLOYEE")
     private String fixedAssetsPerEmployee;
     @JsonAlias("CAPACITY_GRADE")
     private String capacityGrade;
     @JsonAlias("ZERO_TURNOVER")
     private String zeroTurnover;
     @JsonAlias("SAFETY_MARGIN")
     private String safetyMargin;
     @JsonAlias("ASSETS_TURNOVER_RATE")
     private String assetsTurnoverRate;
     @JsonAlias("CREDIT_PERIOD_CREDIT")
     private String creditPeriodCredit;
     @JsonAlias("FIXED_ASSETS_TURNOVER_RATE")
     private String fixedAssetsTurnoverRate;
     @JsonAlias("CAPITAL_GRADE")
     private String capitalGrade;
     @JsonAlias("SALARY_GRADE")
     private String salaryGrade;
     @JsonAlias("STAFF_COSTS")
     private String staffCosts;
     @JsonAlias("STATE")
     private String state;
     @JsonAlias("REGION_ID")
     private String regionId;
     @JsonAlias("CREDIT_MAX_CURRENCY")
     private String creditMaxCurrency;
     @JsonAlias("CREDIT_MAX_AMOUNT")
     private String creditMaxAmount;
     @JsonAlias("RISC_GROUP")
     private String riscGroup;
     @JsonAlias("PUBLICATION_DATE")
     private String publicationDate;
     @JsonAlias("EXT1")
     private String ext1;
     @JsonAlias("EXT2")
     private String ext2;
     @JsonAlias("EXT3")
     private String ext3;
     @JsonAlias("EXT4")
     private String ext4;
     @JsonAlias("EXT5")
     private String ext5;
}
