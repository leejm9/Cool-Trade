package com.cooltrade.product.model.vo;

public class Trade {

	private int tradeNo;
	private String productNo;
	private int buyerNo;
	private String tradeDate;
	private int price;
	private String deliveryStatus;
	
	public Trade() {}

	public Trade(int tradeNo, String productNo, int buyerNo, String tradeDate) {
		super();
		this.tradeNo = tradeNo;
		this.productNo = productNo;
		this.buyerNo = buyerNo;
		this.tradeDate = tradeDate;
	}

	public int getTradeNo() {
		return tradeNo;
	}

	public void setTradeNo(int tradeNo) {
		this.tradeNo = tradeNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
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

	@Override
	public String toString() {
		return "Trade [tradeNo=" + tradeNo + ", productNo=" + productNo + ", buyerNo=" + buyerNo + ", tradeDate="
				+ tradeDate + "]";
	}

}