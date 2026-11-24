package com.asiainfo.crm.cm.vo;

import com.asiainfo.crm.cm.common.util.ws.address;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Data;

/**
 * Full SFF {@link address} shape for JSON (camelCase), aligned with {@code POST /common/sff/address/page} rows.
 */
@Data
@JsonInclude(Include.ALWAYS)
public class SffAddressFullVO {

    private String country;
    private String addressType;
    private String districtId;
    private String zipcode;
    private String city;
    private String county;
    private String streetName;
    private String apartment;
    private String floor;
    private String houseLetter;
    private String houseNumber;
    private String mainDoor;
    private String doorNumber;
    private String addrDesc;
    private String blackState;
    private String deliveryState;
    private String municipality;
    private String coName;
    private String poBox;
    private String addressId;
    private String streetName2;
    private String streetName3;
    private String isForeign;

    public static SffAddressFullVO fromAddress(address a) {
        if (a == null) {
            return null;
        }
        SffAddressFullVO vo = new SffAddressFullVO();
        vo.setCountry(a.getCountry());
        vo.setAddressType(a.getAddressType());
        vo.setDistrictId(a.getDistrictId());
        vo.setZipcode(a.getZipcode());
        vo.setCity(a.getCity());
        vo.setCounty(a.getCounty());
        vo.setStreetName(a.getStreetName());
        vo.setApartment(a.getApartment());
        vo.setFloor(a.getFloor());
        vo.setHouseLetter(a.getHouseLetter());
        vo.setHouseNumber(a.getHouseNumber());
        vo.setMainDoor(a.getMainDoor());
        vo.setDoorNumber(a.getDoorNumber());
        vo.setAddrDesc(a.getAddrDesc());
        vo.setBlackState(a.getBlackState());
        vo.setDeliveryState(a.getDeliveryState());
        vo.setMunicipality(a.getMunicipality());
        vo.setCoName(a.getCoName());
        vo.setPoBox(a.getPoBox());
        vo.setAddressId(a.getAddressId());
        vo.setStreetName2(a.getStreetName2());
        vo.setStreetName3(a.getStreetName3());
        vo.setIsForeign(a.getIsForeign());
        return vo;
    }
}
