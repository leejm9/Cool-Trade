package com.cooltrade.chatting.controller.model.vo;

import java.sql.Date;

public class Chat {
	private int messageNo;
	private String message;
	private Date messageDate;
	private String readYn;
	private int chatRoomNo;
	private String sender;
	
	public Chat() {
		
	}

	public Chat(int messageNo, String message, Date messageDate, String readYn, int chatRoomNo, String sender) {
		super();
		this.messageNo = messageNo;
		this.message = message;
		this.messageDate = messageDate;
		this.readYn = readYn;
		this.chatRoomNo = chatRoomNo;
		this.sender = sender;
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

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
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

	@Override
	public String toString() {
		return "Chat [messageNo=" + messageNo + ", message=" + message + ", messageDate=" + messageDate + ", readYn="
				+ readYn + ", chatRoomNo=" + chatRoomNo + ", sender=" + sender + "]";
	}

}
