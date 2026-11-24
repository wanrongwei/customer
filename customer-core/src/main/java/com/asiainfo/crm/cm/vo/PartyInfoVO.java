package com.asiainfo.crm.cm.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PartyInfoVO {
    private long partyId;
    private String firstName;
    private String lastName;
    private long addressId;
    private String birthday;
    private String addressDetail;
    private int gender;
    private String certCode;
}
