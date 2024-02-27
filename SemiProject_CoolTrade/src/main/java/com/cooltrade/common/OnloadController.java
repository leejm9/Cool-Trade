package com.cooltrade.common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class OnloadController
 */
@WebServlet("/onload.page")
public class OnloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OnloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 현재 총 게시글 개수
		int productCount = new ProductService().selectProductCount();
		
		// 현재 페이지
		int currentPage = 1;
		
		// 페이지 하단에 보여질 페이징바의 최대개수
		int pageLimit = 5;
		
		// 한페이지내에 보여질 계시글 최대 개수
		int productLimit = 10;
		
		// 가장 마지막 페이지
		int maxPage = (int)Math.ceil((double)productCount/productLimit);
		
		// 페이징바 시작수 
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		// 페이징바의 끝수
		int endPage = startPage + pageLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(productCount, currentPage, pageLimit, productLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> plist = new ProductService().selectRandomProduct(pi);
		
		ArrayList<Category> clist = new ProductService().selectCategoryList();
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("plist", plist);
		request.getSession().setAttribute("clist", clist);
		request.getRequestDispatcher("views/common/main.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
