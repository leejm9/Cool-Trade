package com.cooltrade.product.model.vo;

public class Trade {

	private int tradeNo;
	private int productNo;
	private int buyerNo;
	private String tradeDate;
	private int price;
	private String deliveryStatus;
	private String titleImg;
	private String productName;
	private String uploadType;
	private int sellerNo;
	private String nickname;
	private String strPrice;
	
	public Trade() {}

	public Trade(int tradeNo, int productNo, int buyerNo, String tradeDate) {
		super();
		this.tradeNo = tradeNo;
		this.productNo = productNo;
		this.buyerNo = buyerNo;
		this.tradeDate = tradeDate;
	}

	public Trade(int tradeNo, int productNo, int buyerNo, String tradeDate, int price, String deliveryStatus) {
		super();
		this.tradeNo = tradeNo;
		this.productNo = productNo;
		this.buyerNo = buyerNo;
		this.tradeDate = tradeDate;
		this.price = price;
		this.deliveryStatus = deliveryStatus;
	}

	public Trade(int tradeNo, int productNo, int buyerNo, String tradeDate, int price, String deliveryStatus,
			String titleImg, String productName, String uploadType) {
		super();
		this.tradeNo = tradeNo;
		this.productNo = productNo;
		this.buyerNo = buyerNo;
		this.tradeDate = tradeDate;
		this.price = price;
		this.deliveryStatus = deliveryStatus;
		this.titleImg = titleImg;
		this.productName = productName;
		this.uploadType = uploadType;
	}

	public Trade(int tradeNo, int productNo, int buyerNo, String tradeDate, int price, String deliveryStatus,
			String titleImg, String productName, String uploadType, int sellerNo, String nickname, String strPrice) {
		super();
		this.tradeNo = tradeNo;
		this.productNo = productNo;
		this.buyerNo = buyerNo;
		this.tradeDate = tradeDate;
		this.price = price;
		this.deliveryStatus = deliveryStatus;
		this.titleImg = titleImg;
		this.productName = productName;
		this.uploadType = uploadType;
		this.sellerNo = sellerNo;
		this.nickname = nickname;
		this.strPrice = strPrice;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}

	public String getTradeDate() {
		return tradeDate;
	}

	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getUploadType() {
		return uploadType;
	}

	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getStrPrice() {
		return strPrice;
	}

	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
	}

	@Override
	public String toString() {
		return "Trade [tradeNo=" + tradeNo + ", productNo=" + productNo + ", buyerNo=" + buyerNo + ", tradeDate="
				+ tradeDate + "]";
	}

}