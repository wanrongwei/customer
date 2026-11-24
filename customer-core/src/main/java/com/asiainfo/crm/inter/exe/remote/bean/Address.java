package com.asiainfo.crm.inter.exe.remote.bean;

import java.io.Serializable;

public class Address implements Serializable {
    String country;
    String addressType;
    String districtId;
    String zipcode;
    String city;
    String county;
    String streetName;
    String apartment;
    String floor;
    String houseLetter;
    String houseNumber;
    String mainDoor;
    String doorNumber;
    String addrDesc;
    String blackState;
    String deliveryState;
    String municipality;
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddressType() {
		return addressType;
	}
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}
	public String getDistrictId() {
		return districtId;
	}
	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getApartment() {
		return apartment;
	}
	public void setApartment(String apartment) {
		this.apartment = apartment;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getHouseLetter() {
		return houseLetter;
	}
	public void setHouseLetter(String houseLetter) {
		this.houseLetter = houseLetter;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public String getMainDoor() {
		return mainDoor;
	}
	public void setMainDoor(String mainDoor) {
		this.mainDoor = mainDoor;
	}
	public String getDoorNumber() {
		return doorNumber;
	}
	public void setDoorNumber(String doorNumber) {
		this.doorNumber = doorNumber;
	}
	public String getAddrDesc() {
		return addrDesc;
	}
	public void setAddrDesc(String addrDesc) {
		this.addrDesc = addrDesc;
	}
	public String getBlackState() {
		return blackState;
	}
	public void setBlackState(String blackState) {
		this.blackState = blackState;
	}
	public String getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}
	public String getMunicipality() {
		return municipality;
	}
	public void setMunicipality(String municipality) {
		this.municipality = municipality;
	}

}
