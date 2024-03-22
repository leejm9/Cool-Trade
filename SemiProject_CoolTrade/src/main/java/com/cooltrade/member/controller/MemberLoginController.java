package com.cooltrade.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MemberLoginController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		String prevUrl = request.getParameter("prevUrl");
		
		if(loginUser == null) {
			
			request.setAttribute("errorMsg", "로그인 실패했습니다!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			HttpSession session =  request.getSession();
			int headerCo = new MemberService().likePoCount(loginUser.getUserNo());
			if(String.valueOf(headerCo) == null) {
				headerCo = 0;
			}
			session.removeAttribute("headerCo");
			session.setAttribute("headerCo", headerCo);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 로그인 되었습니다.");
			String subUrl = prevUrl.substring(prevUrl.indexOf("cooltrade/") + "cooltrade/".length());
			if(subUrl.equals("searchpwd.me") || subUrl.equals("searchid.me")) {
				response.sendRedirect(request.getContextPath());
			}else {
			response.sendRedirect(prevUrl);
			}
		}
		
		//request.getRequestDispatcher("views/common/header.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
