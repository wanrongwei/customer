package com.asiainfo.crm.cm.vo;
import com.fasterxml.jackson.annotation.JsonAlias;

import lombok.Data;

@Data
public class CreateSFFAddressVO {
     @JsonAlias("IS_FOREIGN")
     private String isForeign;
     @JsonAlias("ZIPCODE")
     private String zipcode;
     @JsonAlias("MUNICIPALITY")
     private String municipality;
     @JsonAlias("DISTRICT_ID")
     private String districtId;// EXT9
     @JsonAlias("STREET_NAME")
     private String streetName;// EXT7
     @JsonAlias("HOUSE_NUMBER")
     private String houseNumber;// EXT6
     @JsonAlias("HOUSE_LETTER")
     private String houseLetter;// EXT5
     @JsonAlias("FLOOR")
     private String floor;// EXT4
     @JsonAlias("APARTMENT")
     private String apartment;// EXT3
     @JsonAlias("DOOR_NUMBER")
     private String doorNumber;// EXT2
     @JsonAlias("MAIN_DOOR")
     private String mainDoor;// EXT1
     @JsonAlias("COUNTY")
     private String county;// EXT8
     @JsonAlias("PO_BOX")
     private String poBox;// EXT10
     @JsonAlias("CO_NAME")
     private String coName;// EXT11
     @JsonAlias("ADDRESS_TYPE")
     private String addressType;
     @JsonAlias("COUNTRY")
     private String country;
     @JsonAlias("CITY")
     private String city;// EXT20
     @JsonAlias("STREET_NAME2")
     private String streetName2;// EXT12
     @JsonAlias("STREET_NAME3")
     private String streetName3;// EXT13
}
