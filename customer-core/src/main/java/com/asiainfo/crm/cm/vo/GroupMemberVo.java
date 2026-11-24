package com.asiainfo.crm.cm.vo;


import lombok.Data;

import java.util.Map;

@Data
public class GroupMemberVo {
    private Map indivCustomerBean;
    private Map cmxIndivCustomerBean;
    private Map groupMemberBean;
    private Map cmxGroupMemberBean;

    private Map oldIndivCustomerBean;
    private Map oldCmxIndivCustomerBean;
    private Map oldGroupMemberBean;
    private Map oldCmxGroupMemberBean;
}
