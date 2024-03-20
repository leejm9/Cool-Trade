package com.cooltrade.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.service.ProductService;

/**
 * Servlet implementation class AjaxLikeProductInsertController
 */
@WebServlet("/ajaxlike.po")
public class AjaxLikeProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxLikeProductInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int result = 0;
		int headerCo = 0;

		int uno = Integer.parseInt(request.getParameter("uno"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		boolean checkFlag = new ProductService().checkLike(uno, pno);


		if (!checkFlag) {
			result = new ProductService().likeInsert(uno, pno);

			if (result > 0) {
				headerCo = new MemberService().likePoCount(uno);
				request.getSession().removeAttribute("headerCo");
				request.getSession().setAttribute("headerCo", headerCo);
				System.out.println(headerCo);
				response.getWriter().print(result);
			}
		} else {
			String yn = new ProductService().checkYn(uno, pno);
			if (yn.equals("N")) {
				result = new ProductService().updateYesLike(uno, pno);
			} else if(yn.equals("Y")){
				result = new ProductService().updateNoLike(uno, pno);
				}
			if(result>0) {
				headerCo = new MemberService().likePoCount(uno);
				request.getSession().removeAttribute("headerCo");
				request.getSession().setAttribute("headerCo", headerCo);
				System.out.println(headerCo);
				response.getWriter().print(result);
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
