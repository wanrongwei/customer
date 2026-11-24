package com.asiainfo.crm.cm.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class BillingPaymentVo {
    private Map cmPayChannel;
    private Map cmAcctContact;
    private List<Map> cmAcctBillFormat;

}
