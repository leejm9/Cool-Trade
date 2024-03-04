package com.cooltrade.report.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private String productNo;
	private int reporter;
	private String reportTypeNo;
	private String reportContent;
	private Date reportDate;
	
	private String seller;
	private String productTitle; 
	
	public Report() {}

	public Report(int reportNo, String productNo, int reporter, String reportTypeNo, String reportContent,
			Date reportDate) {
		super();
		this.reportNo = reportNo;
		this.productNo = productNo;
		this.reporter = reporter;
		this.reportTypeNo = reportTypeNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
	}
	
	
	
	
	

	public Report(String reportTypeNo, Date reportDate, String seller, String productTitle) {
		super();
		this.reportTypeNo = reportTypeNo;
		this.reportDate = reportDate;
		this.seller = seller;
		this.productTitle = productTitle;
	}

	public Report(String productNo, int reporter, String reportTypeNo, String productTitle) {
		super();
		this.productNo = productNo;
		this.reporter = reporter;
		this.reportTypeNo = reportTypeNo;
		this.productTitle = productTitle;
	}

	public Report(int reportNo, String productNo, int reporter, String reportTypeNo, String reportContent,
			Date reportDate, String productTitle) {
		super();
		this.reportNo = reportNo;
		this.productNo = productNo;
		this.reporter = reporter;
		this.reportTypeNo = reportTypeNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.productTitle = productTitle;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getReporter() {
		return reporter;
	}

	public void setReporter(int reporter) {
		this.reporter = reporter;
	}

	public String getReportTypeNo() {
		return reportTypeNo;
	}

	public void setReportTypeNo(String reportTypeNo) {
		this.reportTypeNo = reportTypeNo;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	
	
	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", productNo=" + productNo + ", reporter=" + reporter
				+ ", reportTypeNo=" + reportTypeNo + ", reportContent=" + reportContent + ", reportDate=" + reportDate
				+ ", seller=" + seller + ", productTitle=" + productTitle + "]";
	}

	
	
}
