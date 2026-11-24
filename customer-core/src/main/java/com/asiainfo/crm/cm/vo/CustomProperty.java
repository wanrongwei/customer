package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import java.util.HashMap;

import lombok.Data;

@Data
public class CustomProperty {
    private HashMap<String, String> property = new HashMap<String, String>();

    public static CustomProperty getInstance() {
        CustomProperty re = new CustomProperty();
        return re;
    }

    public void set(String aName, String aValue) {
        if (aName != null) {
            this.property.put(aName, aValue);
        }
    }
}
