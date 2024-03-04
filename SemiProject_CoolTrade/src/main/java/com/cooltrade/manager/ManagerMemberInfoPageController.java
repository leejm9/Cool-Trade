package com.cooltrade.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.common.PageInfo;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class ManagerMemberInfoPageController
 */
@WebServlet("/member.in")
public class ManagerMemberInfoPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberInfoPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int value = 1;
		String dropDownValue = request.getParameter("dropDownValue");
		if(dropDownValue != null && !dropDownValue.isEmpty()) {
		    value = Integer.parseInt(dropDownValue);
		}
		
		String search = request.getParameter("search");
		int cpage = 1; 
	    if (request.getParameter("cpage") != null) {
	        cpage = Integer.parseInt(request.getParameter("cpage"));
	    }
		
		int listCount = 0; 	 
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		
		int maxPage;	 
		int startPage;	 
		int endPage;	 
		
		if(search == null) {
			System.out.println("!!!");
			switch (value) {
			case 1: listCount = new MemberService().selectListCount(); break;
			case 2: listCount = new MemberService().countOndoList(); break;
			case 3: listCount = new MemberService().countCbtnList(); break;
			}
		}else {
			System.out.println("!!!2");
			listCount = new MemberService().countSearchList(search); 
		}
			
		currentPage = cpage;
		
		pageLimit = 5;
		
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		if(search == null) {
			switch (value) {
			case 1: list = new MemberService().selectList(pi); break;
			case 2: list = new MemberService().selectOndoList(pi); break;
			case 3: list = new MemberService().selectCbtnList(pi); break;
			}
		}else {
			list = new MemberService().selectSearchList(pi,search);
		}
		
		
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/manager/managerMemberInfoPage.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
