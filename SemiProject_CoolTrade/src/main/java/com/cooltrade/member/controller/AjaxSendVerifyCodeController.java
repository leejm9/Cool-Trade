package com.cooltrade.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.common.CommonUtil;
import com.cooltrade.common.MailUtil;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/sendverifycode.do")
public class AjaxSendVerifyCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AjaxSendVerifyCodeController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String to = request.getParameter("email");
	  HttpSession session = request.getSession(true);
    String verifyCode = CommonUtil.getRandomNumeric(6);
    session.setAttribute("verifyCode", verifyCode);
    try {
      MailUtil.send(to, "[쿨거래] 인증번호", "인증 번호는 "+ verifyCode + " 입니다.");
      response.getWriter().print("success");
    } catch (Exception e) {
      response.getWriter().print("fail");
      e.printStackTrace();
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
