package com.asiainfo.crm.cm.inner.common.bo;

import com.ai.appframe2.bo.DataContainer;
import com.ai.appframe2.common.*;
import com.asiainfo.crm.cm.inner.common.ivalues.IBOCmSummaryStatsExtValue;

import java.sql.Timestamp;

public class BOCmSummaryStatsExtBean extends DataContainer implements DataContainerInterface, IBOCmSummaryStatsExtValue {

  private static String m_boName = "com.asiainfo.crm.cm.inner.common.bo.BOCmSummaryStatsExt";

  public final static  String S_Id = "ID";
  public final static  String S_CustomerId = "CUSTOMER_ID";
  public final static  String S_RecordDate = "RECORD_DATE";
  public final static  String S_GroupType = "GROUP_TYPE";
  public final static  String S_DetailStats = "DETAIL_STATS";
  public final static  String S_GroupCode = "GROUP_CODE";

  public static ObjectType S_TYPE = null;
  static {
    try {
      S_TYPE = ServiceManager.getObjectTypeFactory().getInstance(m_boName);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }

  public BOCmSummaryStatsExtBean() throws AIException {
    super(S_TYPE);
  }

  public static ObjectType getObjectTypeStatic() throws AIException {
    return S_TYPE;
  }

  public void setObjectType(ObjectType value) throws AIException {
    // 此种数据容器不能重置业务对象类型
    throw new AIException("Cannot reset ObjectType");
  }
  public void initId(long value) {
    this.initProperty(S_Id, Long.valueOf(value));
  }
  public void setId(long value) {
    this.set(S_Id, Long.valueOf(value));
  }
  public void setIdNull() {
    this.set(S_Id, null);
  }

  public long getId() {
    return DataType.getAsLong(this.get(S_Id));
  }
  public long getIdInitialValue() {
    return DataType.getAsLong(this.getOldObj(S_Id));
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

  public void initGroupType(String value) {
    this.initProperty(S_GroupType, value);
  }
  public void setGroupType(String value) {
    this.set(S_GroupType, value);
  }
  public void setGroupTypeNull() {
    this.set(S_GroupType, null);
  }

  public String getGroupType() {
    return DataType.getAsString(this.get(S_GroupType));
  }
  public String getGroupTypeInitialValue() {
    return DataType.getAsString(this.getOldObj(S_GroupType));
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

  public void initGroupCode(String value) {
    this.initProperty(S_GroupCode, value);
  }
  public void setGroupCode(String value) {
    this.set(S_GroupCode, value);
  }
  public void setGroupCodeNull() {
    this.set(S_GroupCode, null);
  }

  public String getGroupCode() {
    return DataType.getAsString(this.get(S_GroupCode));
  }
  public String getGroupCodeInitialValue() {
    return DataType.getAsString(this.getOldObj(S_GroupCode));
  }

}