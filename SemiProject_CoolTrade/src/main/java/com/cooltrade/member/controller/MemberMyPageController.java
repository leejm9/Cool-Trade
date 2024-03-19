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
 * Servlet implementation class MyPageController
 */
@WebServlet("/mypage.me")
public class MemberMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿨거래 카운트
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		
		int count = new MemberService().selectTradeTypeCount(m);
		
		request.setAttribute("count", count);
		
		// 받은후기 카운트
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		int reviewCount = new MemberService().reviewCount(uno);
		request.setAttribute("reviewCount", reviewCount);
		
		// 찜한상품 카운트
		int likePoCount = new MemberService().likeProductCount(uno);
		request.setAttribute("likePoCount", likePoCount);
		
		// 프로필사진
		int select = new MemberService().selectProfileImg(uno);
		String titleImg = new MemberService().getProfileImg(select);
		request.setAttribute("titleImg", titleImg);

		request.getRequestDispatcher("views/myPage/myPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
