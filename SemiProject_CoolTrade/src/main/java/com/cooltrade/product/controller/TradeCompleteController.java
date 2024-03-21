package com.cooltrade.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.service.ProductService;

/**
 * Servlet implementation class TradeCompleteController
 */
@WebServlet("/complete.tr")
public class TradeCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradeCompleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("오냐?");
		request.setCharacterEncoding("UTF-8");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int sellerNo = Integer.parseInt(request.getParameter("sellerNo"));
		int buyerNo = Integer.parseInt(request.getParameter("buyerNo"));
		
		int result = new ProductService().insertTrade(pno, buyerNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상품을 구매했습니다!");
			request.getRequestDispatcher("views/common/home.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "구매할수 없는 상품입니다.");
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
