package com.cooltrade.chatting.controller.model.vo;

public class ChatRoom {
	private int chatRoomNo;
	private String chatRoomTitle;
	private String chatRoomStatus;
	private String userId;
	private String sellerId;
	private String buyerNickname;
	private String sellerNickname;
	private String buyerTitleImg;
	private String sellerTitleImg;
	
	public ChatRoom() {}

	public ChatRoom(int chatRoomNo, String chatRoomTitle, String chatRoomStatus, String userId, String sellerId) {
		super();
		this.chatRoomNo = chatRoomNo;
		this.chatRoomTitle = chatRoomTitle;
		this.chatRoomStatus = chatRoomStatus;
		this.userId = userId;
		this.sellerId = sellerId;
	}

	public ChatRoom(int chatRoomNo, String chatRoomTitle, String chatRoomStatus, String userId, String sellerId,
					String buyerNickname, String sellerNickname, String buyerTitleImg, String sellerTitleImg) {
		super();
		this.chatRoomNo = chatRoomNo;
		this.chatRoomTitle = chatRoomTitle;
		this.chatRoomStatus = chatRoomStatus;
		this.userId = userId;
		this.sellerId = sellerId;
		this.buyerNickname = buyerNickname;
		this.sellerNickname = sellerNickname;
		this.buyerTitleImg = buyerTitleImg;
		this.sellerTitleImg = sellerTitleImg;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getChatRoomTitle() {
		return chatRoomTitle;
	}

	public void setChatRoomTitle(String chatRoomTitle) {
		this.chatRoomTitle = chatRoomTitle;
	}

	public String getChatRoomStatus() {
		return chatRoomStatus;
	}

	public void setChatRoomStatus(String chatRoomStatus) {
		this.chatRoomStatus = chatRoomStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBuyerNickname() {
		return buyerNickname;
	}

	public void setBuyerNickname(String buyerNickname) {
		this.buyerNickname = buyerNickname;
	}

	public String getSellerNickname() {
		return sellerNickname;
	}

	public void setSellerNickname(String sellerNickname) {
		this.sellerNickname = sellerNickname;
	}

	public String getBuyerTitleImg() {
		return buyerTitleImg;
	}

	public void setBuyerTitleImg(String buyerTitleImg) {
		this.buyerTitleImg = buyerTitleImg;
	}

	public String getSellerTitleImg() {
		return sellerTitleImg;
	}

	public void setSellerTitleImg(String sellerTitleImg) {
		this.sellerTitleImg = sellerTitleImg;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", chatRoomTitle=" + chatRoomTitle + ", chatRoomStatus="
				+ chatRoomStatus + ", userId=" + userId + ", sellerId=" + sellerId + "]";
	}
	
	
}
