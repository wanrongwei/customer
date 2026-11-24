package com.asiainfo.crm.so.view360.search.vo;

import java.io.Serializable;

public class AttrVo implements Serializable {
    private String attrCode;

    public String getAttrCode() {
        return attrCode;
    }

    public void setAttrCode(String attrCode) {
        this.attrCode = attrCode;
    }

    public String getAttrName() {
        return attrName;
    }

    public void setAttrName(String attrName) {
        this.attrName = attrName;
    }

    public int getAttrValue() {
        return attrValue;
    }

    public void setAttrValue(int attrValue) {
        this.attrValue = attrValue;
    }

    private String attrName;
    private int attrValue;
}
