package com.cooltrade.product.model.vo;

public class Product {
	
	private int productNo;
	private String sellerNo;
	private String categoryNo;
	private String productName;
	private int price;
	private String productDesc;
	private String zone;
	private int count;
	private String productStatus;
	private String uploadDate;
	private String uploadType;
	private double ondo;
	private String timeDiff;
	private int salesRate;
	private int tstockgoods;
	private int reportedProduct;
	private int tradeType;
	private String monthSales;
	private int count;
	private int deliveryCharge;
	private int pieces;
	private String sellStatus;
	
	public Product() {}
	
	public Product(int price, String monthSales) {
		super();
		this.price = price;
		this.monthSales = monthSales;
	}

	public Product(String categoryNo, int count) {
		super();
		this.categoryNo = categoryNo;
		this.count = count;
	}

<<<<<<< HEAD


<<<<<<< HEAD

	public Product(int productNo, String sellerNo, String categoryNo, String productName, int price, String productDesc,
			String zone, int count, String productStatus, String uploadDate, String uploadType, double ondo,
			String timeDiff, int salesRate, int tstockgoods, int reportedProduct, int tradeType, String monthSales) {
=======
	public Product(int productNo, String sellerNo, String categoryNo, String productName, int price, String productDesc,
			String zone, String productStatus, String uploadDate, String uploadType, double ondo, String timeDiff,
			int salesRate, int tstockgoods, int reportedProduct, int tradeType, String monthSales, int count,
			int deliveryCharge, int pieces, String sellStatus) {
>>>>>>> cr
		super();
		this.productNo = productNo;
		this.sellerNo = sellerNo;
		this.categoryNo = categoryNo;
		this.productName = productName;
		this.price = price;
		this.productDesc = productDesc;
		this.zone = zone;
		this.count = count;
		this.productStatus = productStatus;
		this.uploadDate = uploadDate;
		this.uploadType = uploadType;
		this.ondo = ondo;
		this.timeDiff = timeDiff;
		this.salesRate = salesRate;
		this.tstockgoods = tstockgoods;
		this.reportedProduct = reportedProduct;
		this.tradeType = tradeType;
		this.monthSales = monthSales;
<<<<<<< HEAD
=======
		this.count = count;
		this.deliveryCharge = deliveryCharge;
		this.pieces = pieces;
		this.sellStatus = sellStatus;
	}

=======
>>>>>>> jm
	public Product(int productNo, String sellerNo, String categoryNo, String productName, int price, String productDesc,
			String zone, String productStatus, String uploadDate, String uploadType, int salesRate, int tstockgoods,
			int reportedProduct) {
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
		this.reportedProduct = reportedProduct;
	}

	public Product(String categoryNo,String sellerNo, String productName, int price, String productDesc, String zone,
			String productStatus, int tradeType, int deliveryCharge, int pieces) {
		super();
		this.categoryNo = categoryNo;
		this.sellerNo = sellerNo;
		this.productName = productName;
		this.price = price;
		this.productDesc = productDesc;
		this.zone = zone;
		this.productStatus = productStatus;
		this.tradeType = tradeType;
		this.deliveryCharge = deliveryCharge;
		this.pieces = pieces;
>>>>>>> cr
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
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




	public String getProductName() {
		return productName;
	}




	public void setProductName(String productName) {
		this.productName = productName;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public String getProductDesc() {
		return productDesc;
	}




	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}




	public String getZone() {
		return zone;
	}




	public void setZone(String zone) {
		this.zone = zone;
	}



<<<<<<< HEAD
=======
	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}

	public double getOndo() {
		return ondo;
	}

	public void setOndo(double d) {
		this.ondo = d;
	}

	public String getTimeDiff() {
		return timeDiff;
	}

	public void setTimeDiff(String timeDiff) {
		this.timeDiff = timeDiff;
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

	public int getreportedProduct() {
		return reportedProduct;
	}

	public void setreportedProduct(int reportedProduct) {
		reportedProduct = reportedProduct;
	}

	public int getTradeType() {
		return tradeType;
	}

	public void setTradeType(int tradeType) {
		this.tradeType = tradeType;
	}

	
	public String getMonthSales() {
		return monthSales;
	}

	public void setMonthSales(String monthSales) {
		this.monthSales = monthSales;
	}
>>>>>>> cr

	public int getCount() {
		return count;
	}




	public void setCount(int count) {
		this.count = count;
	}

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getPieces() {
		return pieces;
	}

	public void setPieces(int pieces) {
		this.pieces = pieces;
	}

	public int getReportedProduct() {
		return reportedProduct;
	}

	public void setReportedProduct(int reportedProduct) {
		this.reportedProduct = reportedProduct;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}


	public String getProductStatus() {
		return productStatus;
	}




	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}




	public String getUploadDate() {
		return uploadDate;
	}




	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}




	public String getUploadType() {
		return uploadType;
	}




	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}




	public double getOndo() {
		return ondo;
	}




	public void setOndo(double ondo) {
		this.ondo = ondo;
	}




	public String getTimeDiff() {
		return timeDiff;
	}




	public void setTimeDiff(String timeDiff) {
		this.timeDiff = timeDiff;
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




	public int getTradeType() {
		return tradeType;
	}




	public void setTradeType(int tradeType) {
		this.tradeType = tradeType;
	}




	public String getMonthSales() {
		return monthSales;
	}




	public void setMonthSales(String monthSales) {
		this.monthSales = monthSales;
	}




	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", sellerNo=" + sellerNo + ", categoryNo=" + categoryNo
				+ ", productName=" + productName + ", price=" + price + ", productDesc=" + productDesc + ", zone="
<<<<<<< HEAD
				+ zone + ", count=" + count + ", productStatus=" + productStatus + ", uploadDate=" + uploadDate
				+ ", uploadType=" + uploadType + ", ondo=" + ondo + ", timeDiff=" + timeDiff + ", salesRate="
				+ salesRate + ", tstockgoods=" + tstockgoods + ", ReportedProduct=" + ReportedProduct + ", tradeType="
				+ tradeType + ", monthSales=" + monthSales + "]";
	}




	
=======
				+ zone + ", productStatus=" + productStatus + ", uploadDate=" + uploadDate + ", uploadType="
				+ uploadType + ", ondo=" + ondo + ", timeDiff=" + timeDiff + ", salesRate=" + salesRate
				+ ", tstockgoods=" + tstockgoods + ", reportedProduct=" + reportedProduct + ", tradeType=" + tradeType
				+ ", monthSales=" + monthSales + ", count=" + count + ", deliveryCharge=" + deliveryCharge + ", pieces="
				+ pieces + ", sellStatus=" + sellStatus + "]";
	}

>>>>>>> cr
}
