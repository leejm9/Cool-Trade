package com.cooltrade.product.model.vo;

import java.sql.Date;

public class Product {
	
	private int productNo;
	private int sellerNo;
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

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
	public Product(int productNo, int sellerNo, String categoryNo, String productName, int price,
			String productDesc, String zone, String productStatus, Date uploadDate, String uploadType, int salesRate,
			int tstockgoods, int reportedProduct) {
=======
	public Product(int pNo, String sellerNo, String categoryNo, String pName, int price, String pDesc, String zone,
			String pStatus, Date uploadDate, String uploadType, int salesRate) {
>>>>>>> jm:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
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
		this.tstockgoods = tstockgoods;
		ReportedProduct = reportedProduct;
	}

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
=======
	public int getproductNo() {
		return productNo;
	}

	public void setproductNo(int productNo) {
>>>>>>> jm:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
		this.productNo = productNo;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
=======
	public String getproductName() {
		return productName;
	}

	public void setproductName(String productName) {
>>>>>>> jm:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
=======
	public String getproductDesc() {
		return productDesc;
	}

	public void setproductDesc(String productDesc) {
>>>>>>> jm:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
		this.productDesc = productDesc;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
=======

>>>>>>> jm:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
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
