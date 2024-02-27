<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java
package com.cooltrade.product.vo;
=======
package com.cooltrade.product.model.vo;
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java

import java.sql.Date;

public class Product {
	private String pNo;
	private String sellerNo;
	private String categoryNo;
	private String pName;
	private int price;
	private String pDesc;
	private String zone;
	private String pStatus;
	private Date uploadDate;
	private String uploadType;
	
	private int salesRate;
	private int tstockgoods;
	private int ReportedProduct;
	
	public Product() {}

	public Product(String pNo, String sellerNo, String categoryNo, String pName, int price, String pDesc, String zone,
			String pStatus, Date uploadDate, String uploadType, int salesRate) {
		super();
		this.pNo = pNo;
		this.sellerNo = sellerNo;
		this.categoryNo = categoryNo;
		this.pName = pName;
		this.price = price;
		this.pDesc = pDesc;
		this.zone = zone;
		this.pStatus = pStatus;
		this.uploadDate = uploadDate;
		this.uploadType = uploadType;
		this.salesRate = salesRate;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
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

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
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
		return "Product [pNo=" + pNo + ", sellerNo=" + sellerNo + ", categoryNo=" + categoryNo + ", pName=" + pName
				+ ", price=" + price + ", pDesc=" + pDesc + ", zone=" + zone + ", pStatus=" + pStatus + ", uploadDate="
				+ uploadDate + ", uploadType=" + uploadType + ", salesRate=" + salesRate + ", tstockgoods="
				+ tstockgoods + ", ReportedProduct=" + ReportedProduct + "]";
	}
<<<<<<< HEAD:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/vo/Product.java

	
	
=======
>>>>>>> origin/cr:SemiProject_CoolTrade/src/main/java/com/cooltrade/product/model/vo/Product.java
	
}
