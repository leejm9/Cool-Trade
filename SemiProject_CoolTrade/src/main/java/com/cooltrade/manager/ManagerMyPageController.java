package com.cooltrade.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class ManagerMyPageController
 */
@WebServlet("/manager.in")
public class ManagerMyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = new MemberService().countMember();                  // 오늘 가입한 회원수
		Product salesRate = new ProductService().countSalesRate();     // 누적 판매량
		Product reportedProduct = new ProductService().countReportedProduct(); // 오늘 신고된 게시물수
		Product stockGoods = new ProductService().todayStockGoods();   // 오늘 입고된 상품 수
		request.setAttribute("m", m);
		request.setAttribute("salesRate", salesRate);
		request.setAttribute("reportedProduct", reportedProduct);
		request.setAttribute("stockGoods", stockGoods);
		request.getRequestDispatcher("views/manager/managerDashBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
