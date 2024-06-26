package com.cooltrade.product.model.vo;

public class ReviewType {

	private int reviewNo;
	private String reviewType;
	private int count;
	private String reviewTypeDetail;
	
	public ReviewType() {}

	public ReviewType(int reviewNo, String reviewType, int count, String reviewTypeDetail) {
		super();
		this.reviewNo = reviewNo;
		this.reviewType = reviewType;
		this.count = count;
		this.reviewTypeDetail = reviewTypeDetail;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getReviewTypeDetail() {
		return reviewTypeDetail;
	}

	public void setReviewTypeDetail(String reviewTypeDetail) {
		this.reviewTypeDetail = reviewTypeDetail;
	}

	@Override
	public String toString() {
		return "ReviewType [reviewNo=" + reviewNo + ", reviewType=" + reviewType + "]";
	}

}
