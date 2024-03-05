package com.cooltrade.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String userNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int count;
	private String noticeStatus;
	
	public Notice() {}

	
	
	public Notice(int noticeNo, String userNo, String noticeTitle, String noticeContent, Date noticeDate, int count,
			String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.count = count;
		this.noticeStatus = noticeStatus;
	}
	
	

	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}



	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}



	public String getNoticeContent() {
		return noticeContent;
	}



	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}



	public Date getNoticeDate() {
		return noticeDate;
	}



	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getNoticeStatus() {
		return noticeStatus;
	}



	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", count=" + count
				+ ", noticeStatus=" + noticeStatus + "]";
	}

}
