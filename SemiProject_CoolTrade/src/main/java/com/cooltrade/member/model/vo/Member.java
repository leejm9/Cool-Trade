package com.cooltrade.member.model.vo;

import java.sql.Date;

public class Member {
	private String memNo;
	private String mId;
	private String mPw;
	private String mName;
	private String nickName;
	private String phone;
	private String email;
	private Date enrollDate;
	private double ondo;
	private String mLevel;
	private String mStatus;
	private int caution;
	
	private int count;
	
	
	public Member() {}
	
	public Member(int count) {
		super();
		this.count = count;
	}
	
	
	public Member(String mId, String mPw, String mName, String phone, String email) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.phone = phone;
		this.email = email;
	}

	public Member(String memNo, String mId, String mPw, String mName, String nickName, String phone, String email,
			Date enrollDate, double ondo, String mLevel, String mStatus, int caution) {
		super();
		this.memNo = memNo;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.mLevel = mLevel;
		this.mStatus = mStatus;
		this.caution = caution;
	}

	public Member(String memNo, String mId, String mPw, String mName, String nickName, String phone, String email,
			Date enrollDate, double ondo, String mLevel, String mStatus, int caution, int count) {
		super();
		this.memNo = memNo;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.nickName = nickName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.ondo = ondo;
		this.mLevel = mLevel;
		this.mStatus = mStatus;
		this.caution = caution;
		this.count = count;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}
	
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
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

	public String getmLevel() {
		return mLevel;
	}

	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
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
		return "Member [memNo=" + memNo + ", mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", nickName="
				+ nickName + ", phone=" + phone + ", email=" + email + ", enrollDate=" + enrollDate + ", ondo=" + ondo
				+ ", mLevel=" + mLevel + ", mStatus=" + mStatus + ", caution=" + caution + ", count=" + count + "]";
	}



	
	
}
