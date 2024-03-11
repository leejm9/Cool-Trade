package com.cooltrade.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.vo.LikeProduct;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class MemberLikeListController
 */
@WebServlet("/likelist.me")
public class MemberLikeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLikeListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("uno"));

		int likePoCount = new MemberService().likeProductCount(userNo);
		request.setAttribute("likePoCount", likePoCount);

		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;

		int maxPage;
		int startPage;
		int endPage;

		listCount = new MemberService().likeListCountPo(userNo);
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		boardLimit = 8;
		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<LikeProduct> list = new MemberService().likeListPo(pi, userNo);

		//System.out.println(pi);

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);

		request.getRequestDispatcher("views/myPage/likeList.jsp").forward(request, response);

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
