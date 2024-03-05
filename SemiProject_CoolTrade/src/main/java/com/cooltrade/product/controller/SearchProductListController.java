package com.cooltrade.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Category;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class SearchProductListController
 */
@WebServlet("/search.po")
public class SearchProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchProductListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("search");
		String cno = request.getParameter("cno");
		if(cno != null && search == null) {
			ArrayList<Category> catList = new ProductService().selectCategoryList();
			ArrayList<Product> searchList = new ProductService().searchByCategory(cno);
			ArrayList<Images> imgList = new ProductService().getTitleImg(searchList);
			String CategoryName = new ProductService().getCategoryName(cno);
			int pCount = new ProductService().countProductByCat(cno);
			
			request.setAttribute("catList", catList);
			request.setAttribute("searchList", searchList);
			request.setAttribute("imgList", imgList);
			request.setAttribute("search", CategoryName);
			request.setAttribute("pCount", pCount);
			request.setAttribute("cno", cno);
			request.getRequestDispatcher("views/product/searchListView.jsp").forward(request, response);
			
			
		}else if(search != null && cno == null) {

			ArrayList<Category> catList = new ProductService().searchCatList(search);
			ArrayList<Product> searchList = new ProductService().searchProductList(search);
			ArrayList<Images> imgList = new ProductService().getTitleImg(searchList);
		
			int result = new ProductService().insertPopularWord(search);
			int pCount = new ProductService().countProduct(search);
			if(result >0) {
				request.setAttribute("search", search);
				request.setAttribute("pCount", pCount);
				request.setAttribute("catList", catList);
				request.setAttribute("searchList", searchList);
				request.setAttribute("imgList", imgList);

				request.getRequestDispatcher("views/product/searchListView.jsp").forward(request, response);
			}
		}
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
