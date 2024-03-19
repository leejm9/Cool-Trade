package com.cooltrade.chatting.controller.model.vo;

import java.sql.Date;

public class Chat {
	private int messageNo;
	private String message;
	private String messageDate;
	private String readYn;
	private int chatRoomNo;
	private String sender;
	private String userId;
	private String sellerId;
	
	public Chat() {
		
	}

	public Chat(int messageNo, String message, String messageDate, String readYn, int chatRoomNo, String sender) {
		super();
		this.messageNo = messageNo;
		this.message = message;
		this.messageDate = messageDate;
		this.readYn = readYn;
		this.chatRoomNo = chatRoomNo;
		this.sender = sender;
	}
	
	public Chat(int messageNo, String message, String messageDate, String readYn, int chatRoomNo, String sender,
			String userId, String sellerId) {
		super();
		this.messageNo = messageNo;
		this.message = message;
		this.messageDate = messageDate;
		this.readYn = readYn;
		this.chatRoomNo = chatRoomNo;
		this.sender = sender;
		this.userId = userId;
		this.sellerId = sellerId;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getReadYn() {
		return readYn;
	}

	public void setReadYn(String readYn) {
		this.readYn = readYn;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
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

	@Override
	public String toString() {
		return "Chat [messageNo=" + messageNo + ", message=" + message + ", messageDate=" + messageDate + ", readYn="
				+ readYn + ", chatRoomNo=" + chatRoomNo + ", sender=" + sender + ", userId=" + userId + ", sellerId="
				+ sellerId + "]";
	}

	
}
