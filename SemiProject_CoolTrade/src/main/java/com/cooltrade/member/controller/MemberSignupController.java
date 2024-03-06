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
@WebServlet("/signup.me")
public class MemberSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public MemberSignupController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");

		Member signupMember = new Member();
		signupMember.setUserId(userId);
		signupMember.setUserPwd(userPwd);
		signupMember.setUserName(name);
		signupMember.setPhone(phone);
		signupMember.setNickName(nickName);
		signupMember.setEmail(email);

		int signupSuccess = new MemberService().insertMember(signupMember);

		if (signupSuccess > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", signupMember);
			session.setAttribute("alertMsg", signupMember.getUserName() + "님 로그인 되었습니다.");
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
