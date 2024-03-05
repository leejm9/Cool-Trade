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

/**
 * Servlet implementation class ManagerBlackListController
 */
@WebServlet("/blacklist.in")
public class ManagerBlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public ManagerBlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bsearch = request.getParameter("bsearch");
		
	    int cpage = 1; 
	    if (request.getParameter("cpage") != null) {
	        cpage = Integer.parseInt(request.getParameter("cpage"));
	    }
	    System.out.println(cpage);
		int listCount = 0 ; 	 
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		
		int maxPage;	 
		int startPage;	 
		int endPage;	
		
		currentPage = cpage;
		if(bsearch != null) {
			listCount = new MemberService().countBListSearch(bsearch);
		}else {
			listCount = new MemberService().selectBlackListCount();
		}
		
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
		if(bsearch == null) {
			list = new MemberService().selectBlackList(pi);
		}else {
			list = new MemberService().selectBListSearch(pi,bsearch);
		}

		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/manager/managerBlackList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
