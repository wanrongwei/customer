package com.asiainfo.crm.cm.vo;

import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class SaveCustOrganizeVO {
    @JsonAlias("NEW_DATA")
    private CmCustOrganizeVO newData;// 新数据
    @JsonAlias("OLD_DATA")
    private CmCustOrganizeVO oldData;// 老数据
}
