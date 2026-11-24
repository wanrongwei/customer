package com.asiainfo.crm.cm.teaminvoke.out.service.interfaces;

import com.ai.oneframe.search.bo.BOB2BCustomerInfoBean;
import com.asiainfo.crm.inter.exe.remote.bean.*;

public interface ICMCommonSV {

public CustomerBean queryGroupCustByMember(long custId, String opCode)throws Exception;
	
	public CustomerBean queryCustByEmail(String email , String opCode)throws Exception;
	
	public CustomerBean queryCustByServiceNum(String serviceNum , String opCode)throws Exception;
	
	public CustPerferInfomation[] getCmCustPerferInfomation(long custId, int perferType , String opCode) throws Exception;
	
	public CustPerferInfo[] getBOCmPreferPeriods(long preferId , String opCode) throws Exception;
	
	public CmxIndivCustomer getCmxIndivCustomerByCustId(long custId , String opCode) throws Exception;
	
	public CustComplexInfo queryCustomerDtl(long custId , String opCode) throws Exception;
	
	public CustSimpleInfo queryCustSimpleInfo(String serviceNum , String opCode ) throws Exception;
	
	public long queryAccountIdByServiceNum(String serviceNum , String opCode ) throws Exception;
	
	public IndivCustInfo queryIndivCust(long custId , String opCode ) throws Exception ;
	
	public IndivCustInfo queryIndivCustForTT(long custId , String opCode ) throws Exception ;
	
	public GroupCustInfo queryGroupCust(long custId , String opCode ) throws Exception;
	
	public AccountInfo getAccountInfo(long acctId,String opCode) throws Exception;
	

	public String getPerferAgent(String phoneNumber,  long custId ,String opCode ) throws Exception ;
	
	public CustComplexInfo[] queryCustomerDtlByIds(long[] custIds , String opCode) throws Exception;
	
	public CustComplexInfo queryCustomerDtlByPhoneNumber(String phoneNumber , String opCode) throws Exception;
	
	public long[] getCustIdsByEmail(String email, int mediaType, String opCode) throws Exception;

	/**
	 * B2B advance customer search (replaces {@code com.ai.oneframe.search.service.interfaces.ICustomerSearchSV#queryB2BCustomers}).
	 */
	BOB2BCustomerInfoBean[] queryB2BCustomers(String customer_type, String customer_state, String customer_status,
			String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
			String customer_name, String short_name, String subscriber_number, String account_id,
			String major_account_number, String address_type, String address_id, String contract_number,
			String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
			String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
			String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
			String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
			String opennetCustId, int startRow, int endRow) throws Exception;

	int countB2BCustomers(String customer_type, String customer_state, String customer_status,
			String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
			String customer_name, String short_name, String subscriber_number, String account_id,
			String major_account_number, String address_type, String address_id, String contract_number,
			String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
			String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
			String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
			String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
			String opennetCustId) throws Exception;

}
