package com.asiainfo.crm.cm.teaminvoke.out.service.support;

import com.ai.oneframe.inter.ivalues.B2BCustInfoBean;
import com.ai.oneframe.inter.ivalues.CustomerSearchCondBean;
import com.ai.oneframe.search.bo.BOB2BCustomerInfoBean;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * B2B advance search aligned with {@code com.ai.oneframe.search.service.impl.CustomerSearchSVImpl}:
 * builds {@link CustomerSearchCondBean} and delegates to {@link Crm4B2BCustomerSearchDelegate}
 * (logic formerly in {@code CRM4OneframeRemoteFSVImpl}, inlined to avoid UIP-interface).
 */
public final class B2bCustomerAdvanceSearchSupport {

    private B2bCustomerAdvanceSearchSupport() {
    }

    private static long parseLong(String s, long defaultVal) {
        if (StringUtils.isBlank(s)) {
            return defaultVal;
        }
        try {
            return Long.parseLong(s.trim());
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }

    private static int parseInt(String s, int defaultVal) {
        if (StringUtils.isBlank(s)) {
            return defaultVal;
        }
        try {
            return Integer.parseInt(s.trim());
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }

    /**
     * Same field mapping as COMPOSITE {@code IndivCustBFImpl#countB2CCustomers} / REST
     * {@link com.asiainfo.crm.controller.customer.vo.QueryB2BCustomerConditonVo}, for B2B cond bean.
     */
    static CustomerSearchCondBean assembleCond(String customer_type, String customer_state, String customer_status,
            String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
            String customer_name, String short_name, String subscriber_number, String account_id,
            String major_account_number, String address_type, String address_id, String contract_number,
            String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
            String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
            String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
            String ticketID, String orderID, String oldB2BAccountId, String circuitB2BNumber,
            String opennetCustId) {
        CustomerSearchCondBean searchCond = new CustomerSearchCondBean();
        searchCond.setCustType(customer_type);
        searchCond.setCustState(customer_state);
        searchCond.setCustStatus(parseInt(customer_status, -2));
        searchCond.setCustomerCertificateID(customer_certificate_id);
        searchCond.setCustId(parseLong(customer_id, -1L));
        searchCond.setOldCustId(old_customer_id);
        searchCond.setIccId(icc_id);
        searchCond.setCustomerName(customer_name);
        searchCond.setShortName(short_name);
        searchCond.setSubscriberNumber(subscriber_number);
        searchCond.setAccountId(parseLong(account_id, -1L));
        searchCond.setMajorAccountNumber(major_account_number);
        if ("-1".equals(StringUtils.trimToEmpty(address_type))) {
            searchCond.setAddressType("");
        } else {
            searchCond.setAddressType(address_type);
        }
        searchCond.setAddressId(parseLong(address_id, -1L));
        searchCond.setContractNumber(contract_number);
        searchCond.setImsiNumber(imsi_number);
        searchCond.setAccountManager(parseLong(account_manager, -1L));
        searchCond.setCustMamaGroup(parseLong(cust_mana_group, -1L));
        searchCond.setSegment(parseLong(segment, -1L));
        searchCond.setCategory(parseLong(category, -1L));
        searchCond.setKobNumber(kob_number);
        searchCond.setCvrNumber(cvr_number);
        searchCond.setContactPhoneNumber(contact_phone_number);
        searchCond.setIpAddress(ipAddress);
        searchCond.setCpeNumber(cpeNumber);
        searchCond.setEanNumber(eanNumber);
        searchCond.setPBSNumber(PBSNumber);
        searchCond.setBillingAddress(billingAddress);
        searchCond.setInvoiceNumber(invoiceNumber);
        searchCond.setEmailAddress(emailAddress);
        searchCond.setTicketID(ticketID);
        searchCond.setOrderID(orderID);
        searchCond.setOldB2BAccountId(oldB2BAccountId);
        searchCond.setCircuitB2BNumber(circuitB2BNumber);
        searchCond.setOpennetCustId(opennetCustId);
        return searchCond;
    }

    public static BOB2BCustomerInfoBean[] queryB2BCustomers(String customer_type, String customer_state,
            String customer_status, String customer_certificate_id, String customer_id, String old_customer_id,
            String icc_id, String customer_name, String short_name, String subscriber_number, String account_id,
            String major_account_number, String address_type, String address_id, String contract_number,
            String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
            String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
            String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
            String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
            String opennetCustId, int startIndex, int endIndex) throws Exception {
        CustomerSearchCondBean bean = assembleCond(customer_type, customer_state, customer_status,
                customer_certificate_id, customer_id, old_customer_id, icc_id, customer_name, short_name,
                subscriber_number, account_id, major_account_number, address_type, address_id, contract_number,
                imsi_number, account_manager, cust_mana_group, segment, category, kob_number, cvr_number,
                contact_phone_number, ipAddress, cpeNumber, eanNumber, PBSNumber, billingAddress, invoiceNumber,
                emailAddress, ticketID, orderID, oldB2BAccountId, circuitB2BNumber, opennetCustId);
        List<B2BCustInfoBean> list = Crm4B2BCustomerSearchDelegate.queryCustomerOfB2BByCond(bean, startIndex, endIndex);
        if (list == null || list.isEmpty()) {
            return new BOB2BCustomerInfoBean[0];
        }
        List<BOB2BCustomerInfoBean> out = new ArrayList<>(list.size());
        for (B2BCustInfoBean row : list) {
            BOB2BCustomerInfoBean bo = new BOB2BCustomerInfoBean();
            BeanUtils.copyProperties(row, bo);
            out.add(bo);
        }
        return out.toArray(new BOB2BCustomerInfoBean[0]);
    }

    public static int countB2BCustomers(String customer_type, String customer_state, String customer_status,
            String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
            String customer_name, String short_name, String subscriber_number, String account_id,
            String major_account_number, String address_type, String address_id, String contract_number,
            String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
            String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
            String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
            String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
            String opennetCustId) throws Exception {
        CustomerSearchCondBean bean = assembleCond(customer_type, customer_state, customer_status,
                customer_certificate_id, customer_id, old_customer_id, icc_id, customer_name, short_name,
                subscriber_number, account_id, major_account_number, address_type, address_id, contract_number,
                imsi_number, account_manager, cust_mana_group, segment, category, kob_number, cvr_number,
                contact_phone_number, ipAddress, cpeNumber, eanNumber, PBSNumber, billingAddress, invoiceNumber,
                emailAddress, ticketID, orderID, oldB2BAccountId, circuitB2BNumber, opennetCustId);
        return Crm4B2BCustomerSearchDelegate.getCustomerCountOfB2BByCond(bean);
    }
}
