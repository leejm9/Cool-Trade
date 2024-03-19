package com.cooltrade.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class AjaxMemberLikeProductCheckDeleteController
 */
@WebServlet("/ajaxCheckDelete.me")
public class AjaxMemberLikeProductCheckDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMemberLikeProductCheckDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int uno = Integer.parseInt(request.getParameter("uno"));
		//String pno = request.getParameter("pno");
		//System.out.println(pno);
		String[] pno = request.getParameterValues("pno");
		//System.out.println(Arrays.toString(pno));
		
		int result = new MemberService().checkDeleteLikePo(uno, pno);
		
		if(result > 0) {
			response.getWriter().print(result);
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
