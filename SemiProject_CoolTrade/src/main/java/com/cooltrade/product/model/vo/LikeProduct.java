package com.cooltrade.product.model.vo;

public class LikeProduct {

	private int productNo;
	private int likeCount;
	
	public LikeProduct() {}

	public LikeProduct(int productNo, int likeCount) {
		super();
		this.productNo = productNo;
		this.likeCount = likeCount;
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

	@Override
	public String toString() {
		return "LikeProduct [productNo=" + productNo + ", likeCount=" + likeCount + "]";
	}
	
}
