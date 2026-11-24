package com.asiainfo.crm.cm.vo;

import lombok.Data;

import java.util.Map;

@Data
public class CmAccountInfoVo {
    private Map frmAccount;
    private Map frmBillCycle;
    private Map oldFrmAccount;
    private Map oldFrmBillCycle;
}
