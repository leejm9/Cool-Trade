package com.cooltrade.product.model.vo;

public class RecentProducts {

	private int productNo;
	private String productName;
	private int price;
	private String imgPath;
	private String changeName;
	
	public RecentProducts() {}

	public RecentProducts(int productNo, String productName, int price, String imgPath, String changeName) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.imgPath = imgPath;
		this.changeName = changeName;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "RecentProducts [productNo=" + productNo + ", productName=" + productName + ", price=" + price
				+ ", imgPath=" + imgPath + ", changeName=" + changeName + "]";
	}

	
}
