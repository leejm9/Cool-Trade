package com.cooltrade.member.model.vo;

import java.sql.Date;

public class Member {
	private String userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String phone;
	private String email;
	private Date enrollDate;
	private double ondo;
	private String userLevel;
	private String userStatus;
	private int caution;
	
	private int count;
	
	
	public Member() {}
	
	public Member(int count) {
		super();
		this.count = count;
	}
	
	

	public Member(String userNo, String userId, String userName, Date enrollDate, double ondo, int caution) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.caution = caution;
	}

	public Member(String userNo, String userId, String userPwd, String userName, String nickName, String phone,
			String email, Date enrollDate, double ondo, String userLevel, String userStatus, int caution, int count) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.userLevel = userLevel;
		this.userStatus = userStatus;
		this.caution = caution;
		this.count = count;
	}
	
	
	

	public Member(String userNo, String userId, String userName, Date enrollDate, double ondo, String userLevel,
			int caution) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.userLevel = userLevel;
		this.caution = caution;
	}

	public Member(String userNo, String userId, String userPwd, String userName, String nickName, String phone,
			String email, Date enrollDate, double ondo, String userLevel, String userStatus, int caution) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.userLevel = userLevel;
		this.userStatus = userStatus;
		this.caution = caution;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public double getOndo() {
		return ondo;
	}

	public void setOndo(double ondo) {
		this.ondo = ondo;
	}

	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public int getCaution() {
		return caution;
	}

	public void setCaution(int caution) {
		this.caution = caution;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", nickName=" + nickName + ", phone=" + phone + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", ondo=" + ondo + ", userLevel=" + userLevel + ", userStatus=" + userStatus + ", caution=" + caution
				+ ", count=" + count + "]";
	}
	
	
	
	
	
}