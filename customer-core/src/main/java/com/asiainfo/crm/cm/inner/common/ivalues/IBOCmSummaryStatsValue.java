package com.asiainfo.crm.cm.inner.common.ivalues;
import com.ai.appframe2.common.DataContainerInterface;

public interface IBOCmSummaryStatsValue extends DataContainerInterface{

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


  public long getCustomerId();
  public java.sql.Timestamp getRecordDate();
  public long getTotalUsers();
  public long getVoiceUsers();
  public long getDataUsers();
  public long getVpnUsers();
  public String getCatagoryData();
  public String getStateData();
  public long getTotalAccounts();
  public long getActiveAccounts();
  public long getTotalBills();
  public long getPaidBills();
  public long getUnpaidBills();
  public long getOverdueBills();
  public long getTotalBillAmount();
  public long getUnpaidAmount();
  public String getAccountData();
  public long getComplaintCount();
  public long getOverdueOrder();
  public String getUserModifyData();
  public String getRawData();
  public String getDetailStats();
  public String getExtendedInfo();


  public void setCustomerId(long value);
  public void setRecordDate(java.sql.Timestamp value);
  public void setTotalUsers(long value);
  public void setVoiceUsers(long value);
  public void setDataUsers(long value);
  public void setVpnUsers(long value);
  public void setCatagoryData(String value);
  public void setStateData(String value);
  public void setTotalAccounts(long value);
  public void setActiveAccounts(long value);
  public void setTotalBills(long value);
  public void setPaidBills(long value);
  public void setUnpaidBills(long value);
  public void setOverdueBills(long value);
  public void setTotalBillAmount(long value);
  public void setUnpaidAmount(long value);
  public void setAccountData(String value);
  public void setComplaintCount(long value);
  public void setOverdueOrder(long value);
  public void setUserModifyData(String value);
  public void setRawData(String value);
  public void setDetailStats(String value);
  public void setExtendedInfo(String value);
}