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
@WebServlet("/deletemember.do")
public class AjaxDeleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AjaxDeleteMemberController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  HttpSession session = request.getSession();
	  Member m = (Member)session.getAttribute("loginUser");
    if(m == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    String userId = m.getUserId();
    MemberService memberService = new MemberService();
    Member member = memberService.idMember(userId);
    if(!member.getUserPwd().equals(request.getParameter("userPw"))) {
      response.getWriter().print("pwFail");
      return;
    }
    int userNo = member.getUserNo();
		int success = memberService.deleteMember(userNo);
		if (success > 0) {
			response.getWriter().print("success");
			session.invalidate();
		} else {
			response.getWriter().print("fail");
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
