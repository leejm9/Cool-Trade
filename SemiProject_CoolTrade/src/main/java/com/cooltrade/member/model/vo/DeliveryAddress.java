package com.cooltrade.member.model.vo;

public class DeliveryAddress {
  private Integer deliveryAddressNo;
  private Integer userNo;
  private String address;
  private String detail;
  private String postcode;
  private String title;
  private String name;
  private String phone;
  private String mainYn;

  public Integer getDeliveryAddressNo() {
    return deliveryAddressNo;
  }

  public void setDeliveryAddressNo(Integer deliveryAddressNo) {
    this.deliveryAddressNo = deliveryAddressNo;
  }

  public Integer getUserNo() {
    return userNo;
  }

  public void setUserNo(Integer userNo) {
    this.userNo = userNo;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getDetail() {
    return detail;
  }

  public void setDetail(String detail) {
    this.detail = detail;
  }

  public String getPostcode() {
    return postcode;
  }

  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getMainYn() {
    return mainYn;
  }

  public void setMainYn(String mainYn) {
    this.mainYn = mainYn;
  }

}
