package com.cooltrade.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.vo.Review;
import com.cooltrade.product.model.vo.ReviewType;
import com.cooltrade.product.model.vo.Trade;

/**
 * Servlet implementation class MemberReviewListController
 */
@WebServlet("/review.me")
public class MemberReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uno = Integer.parseInt(request.getParameter("uno"));
		// 받은후기 카운트
		int reviewCount = new MemberService().reviewCount(uno);
		request.setAttribute("reviewCount", reviewCount);
		
		// 받은 리뷰타입 카운트
		ArrayList<ReviewType> reviewTypeCount = new MemberService().reviewTypeCount(uno);
		request.setAttribute("reviewTypeCount", reviewTypeCount);
		
		// 리뷰내용
		ArrayList<Review> reviewList = new MemberService().reviewList(uno);
		request.setAttribute("reviewList", reviewList);
		
		// 별점 평균
		Review avg = new MemberService().starAvg(uno);
		request.setAttribute("avg", avg);
		
		request.getRequestDispatcher("views/myPage/reviewList.jsp").forward(request, response);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
