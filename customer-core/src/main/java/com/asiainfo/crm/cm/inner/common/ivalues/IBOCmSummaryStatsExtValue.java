package com.asiainfo.crm.cm.inner.common.ivalues;
import com.ai.appframe2.common.DataContainerInterface;

public interface IBOCmSummaryStatsExtValue extends DataContainerInterface{

  public final static  String S_Id = "ID";
  public final static  String S_CustomerId = "CUSTOMER_ID";
  public final static  String S_RecordDate = "RECORD_DATE";
  public final static  String S_GroupType = "GROUP_TYPE";
  public final static  String S_DetailStats = "DETAIL_STATS";
  public final static  String S_GroupCode = "GROUP_CODE";

  public long getCustomerId();
  public void setCustomerId(long value);
  public String getGroupType();
  public void setGroupType(String value);
  public String getGroupCode();
  public void setGroupCode(String value);
  public long getId();
  public void setId(long value);
  public java.sql.Timestamp getRecordDate();
  public void setRecordDate(java.sql.Timestamp value);
  public void setDetailStats(String value);
  public String getDetailStats();

}