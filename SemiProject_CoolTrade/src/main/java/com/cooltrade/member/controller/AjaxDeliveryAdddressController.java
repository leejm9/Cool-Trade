package com.cooltrade.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.service.DeliveryAddressService;
import com.cooltrade.member.model.vo.DeliveryAddress;
import com.cooltrade.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet(value = { //
    "/deliveryaddress/list.do", // 배송지목록조회
    "/deliveryaddress/add.do", // 배송지등록
    "/deliveryaddress/del.do", // 배송지삭제
    "/deliveryaddress/mod.do",// 배송지수정
})
public class AjaxDeliveryAdddressController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * Default constructor.
   */
  public AjaxDeliveryAdddressController() {
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(true);
    Member sessionMember = (Member) session.getAttribute("loginUser");
    if (sessionMember == null) {
      response.sendRedirect(request.getContextPath());
      return;
    }

    String servletPath = request.getServletPath();
    switch (servletPath) {
    case "/deliveryaddress/list.do":// 배송지목록조회
      list(sessionMember, request, response);
      break;
    case "/deliveryaddress/add.do":// 배송지등록
      add(sessionMember, request, response);
      break;
    case "/deliveryaddress/del.do":// 배송지삭제
      del(sessionMember, request, response);
      break;
    case "/deliveryaddress/mod.do":// 배송지수정
      mod(sessionMember, request, response);
      break;
    }
  }

  private void mod(Member sessionMember, HttpServletRequest request, HttpServletResponse response) throws IOException {
    int userNo = sessionMember.getUserNo();
    int deliveryAddressNo = Integer.valueOf(request.getParameter("deliveryAddressNo"));
    if (new DeliveryAddressService().updateMain(deliveryAddressNo, userNo) > 0) {
      response.getWriter().print("success");
    } else {
      response.getWriter().print("fail");
    }
  }

  private void del(Member sessionMember, HttpServletRequest request, HttpServletResponse response) throws IOException {
    int userNo = sessionMember.getUserNo();
    int deliveryAddressNo = Integer.valueOf(request.getParameter("deliveryAddressNo"));
    if (new DeliveryAddressService().delete(deliveryAddressNo, userNo) == 1) {
      response.getWriter().print("success");
    } else {
      response.getWriter().print("fail");
    }
  }

  private void add(Member sessionMember, HttpServletRequest request, HttpServletResponse response) throws IOException {
    int userNo = sessionMember.getUserNo();
    DeliveryAddress deliveryAddress = new DeliveryAddress();
    deliveryAddress.setUserNo(userNo);
    deliveryAddress.setAddress(request.getParameter("address"));
    deliveryAddress.setDetail(request.getParameter("detail"));
    deliveryAddress.setPostcode(request.getParameter("postcode"));
    deliveryAddress.setTitle(request.getParameter("title"));
    deliveryAddress.setName(request.getParameter("name"));
    deliveryAddress.setPhone(request.getParameter("phone"));
    deliveryAddress.setMainYn(request.getParameter("main_yn"));
    if("Y".equals(deliveryAddress.getMainYn())) {
      new DeliveryAddressService().updateMain(-1, userNo);
    }
    if (new DeliveryAddressService().insert(deliveryAddress) == 1) {
      response.getWriter().print("success");
    } else {
      response.getWriter().print("fail");
    }
  }

  private void list(Member sessionMember, HttpServletRequest request, HttpServletResponse response) throws IOException {
    int userNo = sessionMember.getUserNo();
    ArrayList<DeliveryAddress> deliveryAddressList = new DeliveryAddressService().selectList(userNo);
    
    response.setContentType("application/json; charset=utf-8");
    response.getWriter().print(new Gson().toJson(deliveryAddressList));
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
