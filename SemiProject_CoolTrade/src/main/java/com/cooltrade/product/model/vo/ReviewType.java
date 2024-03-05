package com.cooltrade.product.model.vo;

public class ReviewType {

	private int reviewNo;
	private String reviewType;
	
	public ReviewType() {}

	public ReviewType(int reviewNo, String reviewType) {
		super();
		this.reviewNo = reviewNo;
		this.reviewType = reviewType;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	@Override
	public String toString() {
		return "ReviewType [reviewNo=" + reviewNo + ", reviewType=" + reviewType + "]";
	}

}
