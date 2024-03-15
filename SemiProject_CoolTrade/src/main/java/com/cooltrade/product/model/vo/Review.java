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
	private String nickName;
	private String productName;
	private String titleImg;
	private String reviewTypeDetail;
	private int avgScore;
	private String timeDiff;
	
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

	public Review(int reviewNo, int productNo, int userNo, int imgNo, String reviewDetail, int score, String reviewDate,
			String reviewType, String nickName, String productName, String titleImg, String reviewTypeDetail, int avgScore,
			String timeDiff) {
		super();
		this.reviewNo = reviewNo;
		this.productNo = productNo;
		this.userNo = userNo;
		this.imgNo = imgNo;
		this.reviewDetail = reviewDetail;
		this.score = score;
		this.reviewDate = reviewDate;
		this.reviewType = reviewType;
		this.nickName = nickName;
		this.productName = productName;
		this.titleImg = titleImg;
		this.reviewTypeDetail = reviewTypeDetail;
		this.avgScore = avgScore;
		this.timeDiff = timeDiff;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getReviewTypeDetail() {
		return reviewTypeDetail;
	}

	public void setReviewTypeDetail(String reviewTypeDetail) {
		this.reviewTypeDetail = reviewTypeDetail;
	}

	public int getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	public String getTimeDiff() {
		return timeDiff;
	}

	public void setTimeDiff(String timeDiff) {
		this.timeDiff = timeDiff;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", productNo=" + productNo + ", userNo=" + userNo + ", imgNo=" + imgNo
				+ ", reviewDetail=" + reviewDetail + ", score=" + score + ", reviewDate=" + reviewDate + "]";
	}
	
}
