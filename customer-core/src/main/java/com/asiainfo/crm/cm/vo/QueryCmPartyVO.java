package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonAlias;
import lombok.Data;

@Data
public class QueryCmPartyVO {
    @JsonAlias("PARTY_TYPE")
    private int partyType;
    @JsonAlias("PARTY_NAME")
    private String partyName;
    @JsonAlias("FIRST_NAME")
    private String firstName;
    @JsonAlias("LAST_NAME")
    private String lastName;
    @JsonAlias("CERT_TYPE")
    private int certType;
    @JsonAlias("CERT_CODE")
    private String certCode;
    @JsonAlias("ADDRESS_ID")
    private String addressId;
    @JsonAlias("PARTY_ID")
    private long partyId;
}
