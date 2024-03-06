package com.cooltrade.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/verifycode.do")
public class AjaxVerifyCodeController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Default constructor.
   */
  public AjaxVerifyCodeController() {
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String verifyCode = request.getParameter("verifyCode");
    HttpSession session = request.getSession(true);
    String sessionVerifyCode = (String) session.getAttribute("verifyCode");
    if (verifyCode.equals(sessionVerifyCode)) {
      response.getWriter().print("success");
    } else {
      response.getWriter().print("fail");
    }
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}
