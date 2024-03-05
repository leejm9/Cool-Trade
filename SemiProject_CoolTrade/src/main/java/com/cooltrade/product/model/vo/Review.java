package com.cooltrade.product.model.vo;

public class Review {

	private int reviewNo;
	private int productNo;
	private int userNo;
	private int imgNo;
	private String reviewDetail;
	private int score;
	private String reviewDate;
	private String reviewType;
	
	public Review() {}

	public Review(int reviewNo, int productNo, int userNo, int imgNo, String reviewDetail, int score,
			String reviewDate, String reviewType) {
		super();
		this.reviewNo = reviewNo;
		this.productNo = productNo;
		this.userNo = userNo;
		this.imgNo = imgNo;
		this.reviewDetail = reviewDetail;
		this.score = score;
		this.reviewDate = reviewDate;
		this.reviewType = reviewType;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getReviewDetail() {
		return reviewDetail;
	}

	public void setReviewDetail(String reviewDetail) {
		this.reviewDetail = reviewDetail;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", productNo=" + productNo + ", userNo=" + userNo + ", imgNo=" + imgNo
				+ ", reviewDetail=" + reviewDetail + ", score=" + score + ", reviewDate=" + reviewDate + "]";
	}
	
}
