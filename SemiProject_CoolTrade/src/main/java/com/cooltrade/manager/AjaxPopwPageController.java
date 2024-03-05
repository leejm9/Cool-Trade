package com.cooltrade.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.common.PageInfo;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Search;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxPopwPageController
 */
@WebServlet("/popw.page")
public class AjaxPopwPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxPopwPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; 	 
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		
		int maxPage;	 
		int startPage;	 
		int endPage;	 
		
		listCount = new ProductService().countUserPopwList();
		
		currentPage = Integer.parseInt(request.getParameter("cbtn"));
		
		
		pageLimit = 2;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	
		ArrayList<Search> list = new ProductService().selectUserPopwList(pi);
		
		if(list != null) {
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(list,response.getWriter());
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
