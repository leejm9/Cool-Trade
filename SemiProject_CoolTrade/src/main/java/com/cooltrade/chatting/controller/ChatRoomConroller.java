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
import com.cooltrade.chatting.controller.model.vo.ChatRoom;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.vo.Images;

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
		}
		chatRoomNo = new ChatService().getChatRoomNo(userId,pno); // 채팅방 번호 가져와서
		
		String[] user = new ChatService().getChatRoomInfo(chatRoomNo);
		request.setAttribute("userId", user[0]); // 만든사람의 로그인 아이디, 즉 구매자 << 이걸 보내는 이유는 chatWindow에서 session에 있는 로그인 유저 아이디는 계속 바뀌기때문에 쓰면안됨
		request.setAttribute("seller", user[1]);
		request.setAttribute("chatRoomNo", chatRoomNo);
		
		ChatRoom c = new ChatRoom();
		Images img = new ChatService().getBuyerInfo(user[0]);
		Images imgs = new ChatService().getSellerInfo(user[1]);
		c.setBuyerNickname(img.getBuyerNickname());
		c.setBuyerTitleImg(img.getBuyerTitleImg());
		c.setSellerNickname(imgs.getSellerNickname());
		c.setSellerTitleImg(imgs.getSellerTitleImg());
		
		request.setAttribute("c", c);
		
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
