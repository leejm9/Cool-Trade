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
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class MemberSellListSearchController
 */
@WebServlet("/sellListSearch.me")
public class MemberSellListSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSellListSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//System.out.println("오나?");
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		String word = request.getParameter("search");
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new MemberService().sellListSearchCount(userNo, word); // 회원이 등록한 판매 상품 개수
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 5;
		boardLimit = 5;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> list = new MemberService().sellListSearch(pi, userNo, word);
		
		//System.out.println(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("word", word);
		
		//System.out.println(list);
		
		
		request.getRequestDispatcher("views/myPage/sellList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
