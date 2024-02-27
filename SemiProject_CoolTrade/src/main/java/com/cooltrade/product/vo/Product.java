package com.cooltrade.product.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String sellerNo;
	private String categoryNo;
	private String productName;
	private int price;
	private String productDesc;
	private String zone;
	private String productStatus;
	private Date uploadDate;
	private String uploadType;
	
	private int salesRate;
	private int tstockgoods;
	private int ReportedProduct;
	
	public Product() {}

	public Product(int pNo, String sellerNo, String categoryNo, String pName, int price, String pDesc, String zone,
			String pStatus, Date uploadDate, String uploadType, int salesRate) {
		super();
		this.productNo = productNo;
		this.sellerNo = sellerNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.productDesc = productDesc;
		this.zone = zone;
		this.productStatus = productStatus;
		this.uploadDate = uploadDate;
		this.uploadType = uploadType;
		this.salesRate = salesRate;
	}

	public int getproductNo() {
		return productNo;
	}

	public void setproductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getproductName() {
		return productName;
	}

	public void setproductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getproductDesc() {
		return productDesc;
	}

	public void setproductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}


	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}

	public int getSalesRate() {
		return salesRate;
	}

	public void setSalesRate(int salesRate) {
		this.salesRate = salesRate;
	}

	public int getTstockgoods() {
		return tstockgoods;
	}

	public void setTstockgoods(int tstockgoods) {
		this.tstockgoods = tstockgoods;
	}

	
	public int getReportedProduct() {
		return ReportedProduct;
	}

	public void setReportedProduct(int reportedProduct) {
		ReportedProduct = reportedProduct;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", sellerNo=" + sellerNo + ", categoryNo=" + categoryNo
				+ ", productName=" + productName + ", price=" + price + ", productDesc=" + productDesc + ", zone="
				+ zone + ", productStatus=" + productStatus + ", uploadDate=" + uploadDate + ", uploadType="
				+ uploadType + ", salesRate=" + salesRate + ", tstockgoods=" + tstockgoods + ", ReportedProduct="
				+ ReportedProduct + "]";
	}

	

	
	
	
}
