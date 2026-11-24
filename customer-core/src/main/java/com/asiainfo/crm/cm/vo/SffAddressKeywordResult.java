package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Data;

/**
 * One row for {@code GET /common/sff/address/queryByKeyword}: display line + full SFF address payload.
 */
@Data
@JsonInclude(Include.ALWAYS)
public class SffAddressKeywordResult {

    private String text;
    private SffAddressFullVO address;
}
