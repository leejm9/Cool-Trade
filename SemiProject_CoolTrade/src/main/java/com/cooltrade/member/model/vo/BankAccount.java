package com.cooltrade.member.model.vo;

public class BankAccount {
  private Integer bankaccountNo;
  private Integer userNo;
  private String bank;
  private String account;

  public Integer getBankaccountNo() {
    return bankaccountNo;
  }

  public void setBankaccountNo(Integer bankaccountNo) {
    this.bankaccountNo = bankaccountNo;
  }

  public Integer getUserNo() {
    return userNo;
  }

  public void setUserNo(Integer userNo) {
    this.userNo = userNo;
  }

  public String getBank() {
    return bank;
  }

  public void setBank(String bank) {
    this.bank = bank;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

}
