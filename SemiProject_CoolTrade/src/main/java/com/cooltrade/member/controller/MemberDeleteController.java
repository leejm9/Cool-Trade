package com.cooltrade.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.service.MemberService;

/**
 * Servlet implementation class MemberBuyListController
 */
@WebServlet("/userdelete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
	
		int result = new MemberService().deleteMember(userId, userPwd);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			
			
			session.setAttribute("alertMsg", "성공적으로 회원탈퇴됐습니다");
			// session.invalidate(); 세션 영역 자체가 다 날아감
			
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			
			
		}else {
			session.setAttribute("alertMsg", "회원탈퇴실패");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		
		
	}
		
	}
	    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
