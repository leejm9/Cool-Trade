package com.cooltrade.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Product;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxListOrderController
 */
@WebServlet("/listOrder.po")
public class AjaxListOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxListOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int order = Integer.parseInt(request.getParameter("order"));
		String search = request.getParameter("search");
		String cno = request.getParameter("cno");
		ArrayList<Product> plist = new ArrayList<Product>();
		ArrayList<Images> imgList = new ArrayList<Images>();

		if(cno == null || "null".equals(cno)) {
			switch(order) {
			case 1:
				plist = new ProductService().arrangeByDateS(search);
				imgList = new ProductService().getTitleImg(plist);
				break;
			case 2:
				plist = new ProductService().arrangePriceLowS(search);
				imgList = new ProductService().getTitleImg(plist);
				break;
			case 3:
				plist = new ProductService().arrangePriceHighS(search);
				imgList = new ProductService().getTitleImg(plist);
				break;
			}
		}else {
			switch(order) {
			case 1:
				plist = new ProductService().arrangeByDateC(cno);
				imgList = new ProductService().getTitleImg(plist);
				break;
			case 2:
				plist = new ProductService().arrangePriceLowC(cno);
				imgList = new ProductService().getTitleImg(plist);
				break;
			case 3:
				plist = new ProductService().arrangePriceHighC(cno);
				imgList = new ProductService().getTitleImg(plist);
				break;
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("plist", plist);
		map.put("imgList", imgList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
