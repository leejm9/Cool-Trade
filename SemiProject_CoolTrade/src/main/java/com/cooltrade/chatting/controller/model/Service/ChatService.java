package com.cooltrade.chatting.controller.model.Service;

import static com.cooltrade.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.cooltrade.chatting.controller.model.Dao.ChatDao;
import com.cooltrade.chatting.controller.model.vo.Chat;
import com.cooltrade.chatting.controller.model.vo.ChatRoom;

public class ChatService {
	public int countChatRoom(String userId, String pno) {
		Connection conn = getConnection();
		
		int result = new ChatDao().countChatRoom(conn,userId,pno);
		close(conn);
		return result;
	}
	public int createChatRoom(String userId, String pno) {
		Connection conn = getConnection();
		
		int result = new ChatDao().createChatRoom(conn,userId,pno);
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int getChatRoomNo(String userId, String pno) {
		Connection conn = getConnection();
		
		int result = new ChatDao().getChatRoomNo(conn,userId,pno);
		close(conn);
		return result;
	}
	
	public ArrayList<Chat> getMessage(int chatRoomNo){
		Connection conn = getConnection();
		
		ArrayList<Chat> list = new ChatDao().getMessage(conn,chatRoomNo);
		close(conn);
		return list;
	}
	public int insertMessage(String userId, String message, int chatRoomNo) {
		Connection conn = getConnection();
		
		int result = new ChatDao().insertMessage(conn,userId,message,chatRoomNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public ArrayList<ChatRoom> getChatRoomList(){
		Connection conn = getConnection();
		
		ArrayList<ChatRoom> list = new ChatDao().getChatRoomList(conn);
		close(conn);
		return list;
	}
	public String[] getChatRoomInfo(int chatRoomNo) {
		Connection conn = getConnection();
		
		String[] user = new ChatDao().getChatRoomInfo(conn,chatRoomNo);
		
		close(conn);
		return user;
	}
	
	public int updateReadCheck(String loginUser,int chatRoomNo) {
		Connection conn = getConnection();
		
		int result = new ChatDao().updateReadCheck(conn,loginUser,chatRoomNo);
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
