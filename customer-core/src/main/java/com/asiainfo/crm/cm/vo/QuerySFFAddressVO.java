package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class QuerySFFAddressVO {
     @JsonAlias("COUNTRY")
     private String country;
     @JsonAlias("ADDRESS_TYPE")
     private String addressType;
     @JsonAlias("DISTRICT_ID")
     private String districtId;
     @JsonAlias("ZIPCODE")
     private String zipcode;
     @JsonAlias("CITY")
     private String city;
     @JsonAlias("COUNTY")
     private String county;
     @JsonAlias("STREET_NAME")
     private String streetName;
     @JsonAlias("APARTMENT")
     private String apartment;
     @JsonAlias("FLOOR")
     private String floor;
     @JsonAlias("HOUSE_LETTER")
     private String houseLetter;
     @JsonAlias("HOUSE_NUMBER")
     private String houseNumber;
     @JsonAlias("MAIN_DOOR")
     private String mainDoor;
     @JsonAlias("DOOR_NUMBER")
     private String doorNumber;
     @JsonAlias("ADDR_DESC")
     private String addrDesc;
     @JsonAlias("BLACK_STATE")
     private String blackState;
     @JsonAlias("DELIVERY_STATE")
     private String deliveryState;
     @JsonAlias("MUNICIPALITY")
     private String municipality;
     @JsonAlias("CO_NAME")
     private String coName;
     @JsonAlias("PO_BOX")
     private String poBox;
     @JsonAlias("ADDRESS_ID")
     private String addressId;
     @JsonAlias("STREET_NAME2")
     private String streetName2;
     @JsonAlias("STREET_NAME3")
     private String streetName3;
}
