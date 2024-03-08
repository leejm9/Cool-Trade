package com.cooltrade.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.chatting.controller.model.Service.ChatService;
import com.cooltrade.chatting.controller.model.vo.Chat;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;

/**
 * Servlet implementation class ChatRoomConroller
 */
@WebServlet("/chatroom.in")
public class ChatRoomConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatRoomConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pno = request.getParameter("pno");
		
		int check = new ChatService().countChatRoom(userId,pno);
		int result = 0;
		int chatRoomNo = 0;
		
		ArrayList<Chat> message = new ArrayList<Chat>();
		if(check == 0) {
			result = new ChatService().createChatRoom(userId,pno);
		}else {
			chatRoomNo = new ChatService().getChatRoomNo(userId,pno); // 채팅방 번호 가져와서
		}
		message = new ChatService().getMessage(chatRoomNo); // 그방의 전 채팅 메세지 가져온다음 뿌려주자
		request.setAttribute("message", message);
		request.setAttribute("chatRoomNo", chatRoomNo);
		request.getRequestDispatcher("views/chat/chatWindow.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
