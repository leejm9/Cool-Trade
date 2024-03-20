package com.cooltrade.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.service.DeliveryAddressService;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.BankAccount;
import com.cooltrade.member.model.vo.DeliveryAddress;
import com.cooltrade.member.model.vo.Member;

/**
 * Servlet implementation class MemberInfoEditController
 */
@WebServlet("/infoedit.me")
public class MemberInfoEditController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public MemberInfoEditController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    HttpSession session = request.getSession();
    Member m = (Member) session.getAttribute("loginUser");
    if (m == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }
    String userId = m.getUserId();
    int userNo = m.getUserNo();
    MemberService memberService = new MemberService();
    Member member = memberService.idMember(userId);
    BankAccount bankAccount = memberService.selectBankAccount(userNo);
    if (bankAccount == null) {
      bankAccount = new BankAccount();
      bankAccount.setAccount("");
    }
    request.setAttribute("member", member);
    request.setAttribute("bankAccount", bankAccount);
    DeliveryAddress deliveryAddress = new DeliveryAddressService().selectMainOne(userNo);
    String address = "";
    if (deliveryAddress != null) {
      address = "(" + deliveryAddress.getPostcode() + ") " + deliveryAddress.getAddress() + " "
          + deliveryAddress.getDetail();
    }
    request.setAttribute("address", address);
    
    int select = new MemberService().selectProfileImg(userNo);
    String titleImg = new MemberService().getProfileImg(select);
    
    request.setAttribute("titleImg", titleImg);
    
    request.getRequestDispatcher("views/member/memberinfoEdit.jsp").forward(request, response);

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
