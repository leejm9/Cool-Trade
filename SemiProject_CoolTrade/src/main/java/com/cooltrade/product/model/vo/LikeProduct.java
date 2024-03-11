package com.cooltrade.product.model.vo;

public class LikeProduct {

	private int productNo;
	private int likeCount;
	private int userNo;
	private String productName;
	private String strPrice;
	private String uploadDate;
	private String titleImg;
	
	public LikeProduct() {}

	public LikeProduct(int productNo, int likeCount) {
		super();
		this.productNo = productNo;
		this.likeCount = likeCount;
	}

	public LikeProduct(int productNo, int likeCount, int userNo, String productName, String strPrice, String uploadDate,
			String titleImg) {
		super();
		this.productNo = productNo;
		this.likeCount = likeCount;
		this.userNo = userNo;
		this.productName = productName;
		this.strPrice = strPrice;
		this.uploadDate = uploadDate;
		this.titleImg = titleImg;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStrPrice() {
		return strPrice;
	}

	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "LikeProduct [productNo=" + productNo + ", likeCount=" + likeCount + "]";
	}
	
}
