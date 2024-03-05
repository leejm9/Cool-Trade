package com.cooltrade.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxMemberSellList
 */
@WebServlet("/ajaxselllist.me")
public class AjaxMemberSellListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	public AjaxMemberSellListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pNo = Integer.parseInt(request.getParameter("pno"));
		String sellStatus = request.getParameter("sellstatus");
		
		int result = new MemberService().updateSellStatus(pNo, sellStatus);
		
		response.getWriter().print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
