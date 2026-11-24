package com.asiainfo.crm.cm.bf.impl;

import com.ai.appframe2.service.ServiceFactory;
import com.ai.oneframe.search.bo.BOB2BCustomerInfoBean;
import com.asiainfo.crm.cm.teaminvoke.out.service.interfaces.ICMCommonSV;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

/**
 * Delegates B2B advance-search to {@link ICMCommonSV} (sys_id 827/828).
 * ai-fixbug-jira: VERISPR-3496 — oneframe search assumes ticketID/orderID are at least 4 chars
 * (e.g. yyyy prefix); shorter input caused StringIndexOutOfBoundsException (begin 0, end 4, length 3).
 */
@Slf4j
@Component
public class B2bCustomerAdvanceSearchBFImpl {

    /** Matches implicit oneframe substring(0, 4) usage on ticket/order identifiers. */
    private static final int MIN_TICKET_OR_ORDER_ID_LEN = 4;

    private static boolean isTooShortTicketOrOrderId(String ticketID, String orderID) {
        if (StringUtils.isNotBlank(ticketID) && ticketID.trim().length() < MIN_TICKET_OR_ORDER_ID_LEN) {
            return true;
        }
        if (StringUtils.isNotBlank(orderID) && orderID.trim().length() < MIN_TICKET_OR_ORDER_ID_LEN) {
            return true;
        }
        return false;
    }

    public BOB2BCustomerInfoBean[] queryB2BCustomers(String customer_type, String customer_state,
            String customer_status, String customer_certificate_id, String customer_id, String old_customer_id,
            String icc_id, String customer_name, String short_name, String subscriber_number, String account_id,
            String major_account_number, String address_type, String address_id, String contract_number,
            String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
            String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
            String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
            String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
            String opennetCustId, int startRow, int endRow) throws Exception {
        if (isTooShortTicketOrOrderId(ticketID, orderID)) {
            log.debug(
                    "queryB2BCustomers: skip oneframe search — ticketID/orderID shorter than {} (VERISPR-3496)",
                    MIN_TICKET_OR_ORDER_ID_LEN);
            return new BOB2BCustomerInfoBean[0];
        }
        ICMCommonSV sv = (ICMCommonSV) ServiceFactory.getService(ICMCommonSV.class);
        return sv.queryB2BCustomers(customer_type, customer_state, customer_status, customer_certificate_id,
                customer_id, old_customer_id, icc_id, customer_name, short_name, subscriber_number, account_id,
                major_account_number, address_type, address_id, contract_number, imsi_number, account_manager,
                cust_mana_group, segment, category, kob_number, cvr_number, contact_phone_number, ipAddress, cpeNumber,
                eanNumber, PBSNumber, billingAddress, invoiceNumber, emailAddress, ticketID, orderID, opCode,
                oldB2BAccountId, circuitB2BNumber, opennetCustId, startRow, endRow);
    }

    public int countB2BCustomers(String customer_type, String customer_state, String customer_status,
            String customer_certificate_id, String customer_id, String old_customer_id, String icc_id,
            String customer_name, String short_name, String subscriber_number, String account_id,
            String major_account_number, String address_type, String address_id, String contract_number,
            String imsi_number, String account_manager, String cust_mana_group, String segment, String category,
            String kob_number, String cvr_number, String contact_phone_number, String ipAddress, String cpeNumber,
            String eanNumber, String PBSNumber, String billingAddress, String invoiceNumber, String emailAddress,
            String ticketID, String orderID, String opCode, String oldB2BAccountId, String circuitB2BNumber,
            String opennetCustId) throws Exception {
        if (isTooShortTicketOrOrderId(ticketID, orderID)) {
            log.debug(
                    "countB2BCustomers: skip oneframe search — ticketID/orderID shorter than {} (VERISPR-3496)",
                    MIN_TICKET_OR_ORDER_ID_LEN);
            return 0;
        }
        ICMCommonSV sv = (ICMCommonSV) ServiceFactory.getService(ICMCommonSV.class);
        return sv.countB2BCustomers(customer_type, customer_state, customer_status, customer_certificate_id,
                customer_id, old_customer_id, icc_id, customer_name, short_name, subscriber_number, account_id,
                major_account_number, address_type, address_id, contract_number, imsi_number, account_manager,
                cust_mana_group, segment, category, kob_number, cvr_number, contact_phone_number, ipAddress, cpeNumber,
                eanNumber, PBSNumber, billingAddress, invoiceNumber, emailAddress, ticketID, orderID, opCode,
                oldB2BAccountId, circuitB2BNumber, opennetCustId);
    }
}
