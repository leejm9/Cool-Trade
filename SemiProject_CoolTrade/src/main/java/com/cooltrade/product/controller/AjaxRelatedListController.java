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
 * Servlet implementation class AjaxRelatedListController
 */
@WebServlet("/ajax.related")
public class AjaxRelatedListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxRelatedListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		Product p = new ProductService().selectProductDetail(pno);
		String cpCategory = p.getCategoryNo();
		String productName = p.getProductName();
		String[] keywords = productName.split(" ");
		ArrayList<String> extractedKeywords = new ArrayList<String>();
		for(String s : keywords) {
			if(s.length() > 2) {
				extractedKeywords.add(s);
			}
		}
		ArrayList<Product> plist = new ProductService().searchKeywords(extractedKeywords, cpCategory);
		
		ArrayList<Images> imglist = new ProductService().getTitleImg(plist);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("plist", plist);
		map.put("imglist", imglist);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
