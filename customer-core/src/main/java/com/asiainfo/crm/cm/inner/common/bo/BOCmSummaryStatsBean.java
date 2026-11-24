package com.asiainfo.crm.cm.inner.common.bo;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.*;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsValue;

import java.sql.Timestamp;

public class BOCmSummaryStatsBean extends DataContainer implements DataContainerInterface, IBOCmSummaryStatsValue {

  private static String m_boName = "com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStats";

  public final static  String S_CustomerId = "CUSTOMER_ID";
  public final static  String S_RecordDate = "RECORD_DATE";
  public final static  String S_TotalUsers = "TOTAL_USERS";
  public final static  String S_VoiceUsers = "VOICE_USERS";
  public final static  String S_DataUsers = "DATA_USERS";
  public final static  String S_VpnUsers = "VPN_USERS";
  public final static  String S_CatagoryData = "CATAGORY_DATA";
  public final static  String S_StateData = "STATE_DATA";
  public final static  String S_TotalAccounts = "TOTAL_ACCOUNTS";
  public final static  String S_ActiveAccounts = "ACTIVE_ACCOUNTS";
  public final static  String S_TotalBills = "TOTAL_BILLS";
  public final static  String S_PaidBills = "PAID_BILLS";
  public final static  String S_UnpaidBills = "UNPAID_BILLS";
  public final static  String S_OverdueBills = "OVERDUE_BILLS";
  public final static  String S_TotalBillAmount = "TOTAL_BILL_AMOUNT";
  public final static  String S_UnpaidAmount = "UNPAID_AMOUNT";
  public final static  String S_AccountData = "ACCOUNT_DATA";
  public final static  String S_ComplaintCount = "COMPLAINT_COUNT";
  public final static  String S_OverdueOrder = "OVERDUE_ORDER";
  public final static  String S_UserModifyData = "USER_MODIFY_DATA";
  public final static  String S_RawData = "RAW_DATA";
  public final static  String S_DetailStats = "DETAIL_STATS";
  public final static  String S_ExtendedInfo = "EXTENDED_INFO";

  public static ObjectType S_TYPE = null;
  static {
    try {
      S_TYPE = ServiceManager.getObjectTypeFactory().getInstance(m_boName);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public BOCmSummaryStatsBean() throws AIException {
    super(S_TYPE);
  }

  public static ObjectType getObjectTypeStatic() throws AIException {
    return S_TYPE;
  }

  public void setObjectType(ObjectType value) throws AIException {
    // 此种数据容器不能重置业务对象类型
    throw new AIException("Cannot reset ObjectType");
  }


  public void initCustomerId(long value) {
    this.initProperty(S_CustomerId, Long.valueOf(value));
  }
  public void setCustomerId(long value) {
    this.set(S_CustomerId, Long.valueOf(value));
  }
  public void setCustomerIdNull() {
    this.set(S_CustomerId, null);
  }

  public long getCustomerId() {
    return DataType.getAsLong(this.get(S_CustomerId));
  }
  public long getCustomerIdInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_CustomerId));
  }

  public void initRecordDate(Timestamp value) {
    this.initProperty(S_RecordDate, value);
  }
  public void setRecordDate(Timestamp value) {
    this.set(S_RecordDate, value);
  }
  public void setRecordDateNull() {
    this.set(S_RecordDate, null);
  }

  public Timestamp getRecordDate() {
    return DataType.getAsDateTime(this.get(S_RecordDate));
  }
  public Timestamp getRecordDateInitialValue() {
    return DataType.getAsDateTime(this.getOldObj(S_RecordDate));
  }

  public void initTotalUsers(long value) {
    this.initProperty(S_TotalUsers, Long.valueOf(value));
  }
  public void setTotalUsers(long value) {
    this.set(S_TotalUsers, Long.valueOf(value));
  }
  public void setTotalUsersNull() {
    this.set(S_TotalUsers, null);
  }

  public long getTotalUsers() {
    return DataType.getAsLong(this.get(S_TotalUsers));
  }
  public long getTotalUsersInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_TotalUsers));
  }

  public void initVoiceUsers(long value) {
    this.initProperty(S_VoiceUsers, Long.valueOf(value));
  }
  public void setVoiceUsers(long value) {
    this.set(S_VoiceUsers, Long.valueOf(value));
  }
  public void setVoiceUsersNull() {
    this.set(S_VoiceUsers, null);
  }

  public long getVoiceUsers() {
    return DataType.getAsLong(this.get(S_VoiceUsers));
  }
  public long getVoiceUsersInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_VoiceUsers));
  }

  public void initDataUsers(long value) {
    this.initProperty(S_DataUsers, Long.valueOf(value));
  }
  public void setDataUsers(long value) {
    this.set(S_DataUsers, Long.valueOf(value));
  }
  public void setDataUsersNull() {
    this.set(S_DataUsers, null);
  }

  public long getDataUsers() {
    return DataType.getAsLong(this.get(S_DataUsers));
  }
  public long getDataUsersInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_DataUsers));
  }

  public void initVpnUsers(long value) {
    this.initProperty(S_VpnUsers, Long.valueOf(value));
  }
  public void setVpnUsers(long value) {
    this.set(S_VpnUsers, Long.valueOf(value));
  }
  public void setVpnUsersNull() {
    this.set(S_VpnUsers, null);
  }

  public long getVpnUsers() {
    return DataType.getAsLong(this.get(S_VpnUsers));
  }
  public long getVpnUsersInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_VpnUsers));
  }

  public void initCatagoryData(String value) {
    this.initProperty(S_CatagoryData, value);
  }
  public void setCatagoryData(String value) {
    this.set(S_CatagoryData, value);
  }
  public void setCatagoryDataNull() {
    this.set(S_CatagoryData, null);
  }

  public String getCatagoryData() {
    return DataType.getAsString(this.get(S_CatagoryData));
  }
  public String getCatagoryDataInitialValue() {
    return DataType.getAsString(this.getOldObj(S_CatagoryData));
  }

  public void initStateData(String value) {
    this.initProperty(S_StateData, value);
  }
  public void setStateData(String value) {
    this.set(S_StateData, value);
  }
  public void setStateDataNull() {
    this.set(S_StateData, null);
  }

  public String getStateData() {
    return DataType.getAsString(this.get(S_StateData));
  }
  public String getStateDataInitialValue() {
    return DataType.getAsString(this.getOldObj(S_StateData));
  }

  public void initTotalAccounts(long value) {
    this.initProperty(S_TotalAccounts, Long.valueOf(value));
  }
  public void setTotalAccounts(long value) {
    this.set(S_TotalAccounts, Long.valueOf(value));
  }
  public void setTotalAccountsNull() {
    this.set(S_TotalAccounts, null);
  }

  public long getTotalAccounts() {
    return DataType.getAsLong(this.get(S_TotalAccounts));
  }
  public long getTotalAccountsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_TotalAccounts));
  }

  public void initActiveAccounts(long value) {
    this.initProperty(S_ActiveAccounts, Long.valueOf(value));
  }
  public void setActiveAccounts(long value) {
    this.set(S_ActiveAccounts, Long.valueOf(value));
  }
  public void setActiveAccountsNull() {
    this.set(S_ActiveAccounts, null);
  }

  public long getActiveAccounts() {
    return DataType.getAsLong(this.get(S_ActiveAccounts));
  }
  public long getActiveAccountsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_ActiveAccounts));
  }

  public void initTotalBills(long value) {
    this.initProperty(S_TotalBills, Long.valueOf(value));
  }
  public void setTotalBills(long value) {
    this.set(S_TotalBills, Long.valueOf(value));
  }
  public void setTotalBillsNull() {
    this.set(S_TotalBills, null);
  }

  public long getTotalBills() {
    return DataType.getAsLong(this.get(S_TotalBills));
  }
  public long getTotalBillsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_TotalBills));
  }

  public void initPaidBills(long value) {
    this.initProperty(S_PaidBills, Long.valueOf(value));
  }
  public void setPaidBills(long value) {
    this.set(S_PaidBills, Long.valueOf(value));
  }
  public void setPaidBillsNull() {
    this.set(S_PaidBills, null);
  }

  public long getPaidBills() {
    return DataType.getAsLong(this.get(S_PaidBills));
  }
  public long getPaidBillsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_PaidBills));
  }

  public void initUnpaidBills(long value) {
    this.initProperty(S_UnpaidBills, Long.valueOf(value));
  }
  public void setUnpaidBills(long value) {
    this.set(S_UnpaidBills, Long.valueOf(value));
  }
  public void setUnpaidBillsNull() {
    this.set(S_UnpaidBills, null);
  }

  public long getUnpaidBills() {
    return DataType.getAsLong(this.get(S_UnpaidBills));
  }
  public long getUnpaidBillsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_UnpaidBills));
  }

  public void initOverdueBills(long value) {
    this.initProperty(S_OverdueBills, Long.valueOf(value));
  }
  public void setOverdueBills(long value) {
    this.set(S_OverdueBills, Long.valueOf(value));
  }
  public void setOverdueBillsNull() {
    this.set(S_OverdueBills, null);
  }

  public long getOverdueBills() {
    return DataType.getAsLong(this.get(S_OverdueBills));
  }
  public long getOverdueBillsInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_OverdueBills));
  }

  public void initTotalBillAmount(long value) {
    this.initProperty(S_TotalBillAmount, Long.valueOf(value));
  }
  public void setTotalBillAmount(long value) {
    this.set(S_TotalBillAmount, Long.valueOf(value));
  }
  public void setTotalBillAmountNull() {
    this.set(S_TotalBillAmount, null);
  }

  public long getTotalBillAmount() {
    return DataType.getAsLong(this.get(S_TotalBillAmount));
  }
  public long getTotalBillAmountInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_TotalBillAmount));
  }

  public void initUnpaidAmount(long value) {
    this.initProperty(S_UnpaidAmount, Long.valueOf(value));
  }
  public void setUnpaidAmount(long value) {
    this.set(S_UnpaidAmount, Long.valueOf(value));
  }
  public void setUnpaidAmountNull() {
    this.set(S_UnpaidAmount, null);
  }

  public long getUnpaidAmount() {
    return DataType.getAsLong(this.get(S_UnpaidAmount));
  }
  public long getUnpaidAmountInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_UnpaidAmount));
  }

  public void initAccountData(String value) {
    this.initProperty(S_AccountData, value);
  }
  public void setAccountData(String value) {
    this.set(S_AccountData, value);
  }
  public void setAccountDataNull() {
    this.set(S_AccountData, null);
  }

  public String getAccountData() {
    return DataType.getAsString(this.get(S_AccountData));
  }
  public String getAccountDataInitialValue() {
    return DataType.getAsString(this.getOldObj(S_AccountData));
  }

  public void initComplaintCount(long value) {
    this.initProperty(S_ComplaintCount, Long.valueOf(value));
  }
  public void setComplaintCount(long value) {
    this.set(S_ComplaintCount, Long.valueOf(value));
  }
  public void setComplaintCountNull() {
    this.set(S_ComplaintCount, null);
  }

  public long getComplaintCount() {
    return DataType.getAsLong(this.get(S_ComplaintCount));
  }
  public long getComplaintCountInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_ComplaintCount));
  }

  public void initOverdueOrder(long value) {
    this.initProperty(S_OverdueOrder, Long.valueOf(value));
  }
  public void setOverdueOrder(long value) {
    this.set(S_OverdueOrder, Long.valueOf(value));
  }
  public void setOverdueOrderNull() {
    this.set(S_OverdueOrder, null);
  }

  public long getOverdueOrder() {
    return DataType.getAsLong(this.get(S_OverdueOrder));
  }
  public long getOverdueOrderInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_OverdueOrder));
  }

  public void initUserModifyData(String value) {
    this.initProperty(S_UserModifyData, value);
  }
  public void setUserModifyData(String value) {
    this.set(S_UserModifyData, value);
  }
  public void setUserModifyDataNull() {
    this.set(S_UserModifyData, null);
  }

  public String getUserModifyData() {
    return DataType.getAsString(this.get(S_UserModifyData));
  }
  public String getUserModifyDataInitialValue() {
    return DataType.getAsString(this.getOldObj(S_UserModifyData));
  }

  public void initRawData(String value) {
    this.initProperty(S_RawData, value);
  }
  public void setRawData(String value) {
    this.set(S_RawData, value);
  }
  public void setRawDataNull() {
    this.set(S_RawData, null);
  }

  public String getRawData() {
    return DataType.getAsString(this.get(S_RawData));
  }
  public String getRawDataInitialValue() {
    return DataType.getAsString(this.getOldObj(S_RawData));
  }

  public void initDetailStats(String value) {
    this.initProperty(S_DetailStats, value);
  }
  public void setDetailStats(String value) {
    this.set(S_DetailStats, value);
  }
  public void setDetailStatsNull() {
    this.set(S_DetailStats, null);
  }

  public String getDetailStats() {
    return DataType.getAsString(this.get(S_DetailStats));
  }
  public String getDetailStatsInitialValue() {
    return DataType.getAsString(this.getOldObj(S_DetailStats));
  }

  public void initExtendedInfo(String value) {
    this.initProperty(S_ExtendedInfo, value);
  }
  public void setExtendedInfo(String value) {
    this.set(S_ExtendedInfo, value);
  }
  public void setExtendedInfoNull() {
    this.set(S_ExtendedInfo, null);
  }

  public String getExtendedInfo() {
    return DataType.getAsString(this.get(S_ExtendedInfo));
  }
  public String getExtendedInfoInitialValue() {
    return DataType.getAsString(this.getOldObj(S_ExtendedInfo));
  }

}