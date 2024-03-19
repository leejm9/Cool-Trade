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
import com.cooltrade.report.model.service.ReportService;
import com.cooltrade.report.model.vo.Report;

/**
 * Servlet implementation class ManagerReportPageController
 */
@WebServlet("/report.in")
public class ManagerReportPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerReportPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int listCount; 	 
		int currentPage; 
		int pageLimit;   
		int boardLimit;  
		
		int maxPage;	 
		int startPage;	 
		int endPage;	 
//		if (search == null || search.isEmpty()) {
//		    listCount = new MemberService().countBoardList();
//		} else {
//		    listCount = new MemberService().countSearchBoard(search);
//		}
		listCount = new ReportService().countReportList();
		
		int cpage = 1; 
	    String cpageParam = request.getParameter("cpage");
	    if (cpageParam != null) {
	        cpage = Integer.parseInt(cpageParam);
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
		
//		ArrayList<Member> list = new ArrayList<Member>();
//		if(search == null) {
//			list = new MemberService().selectBoardList(pi);
//		}else {
//			list = new MemberService().selectSearchBoard(pi,search);
//		}
		
		ArrayList<Report> list = new ReportService().selectReportList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/manager/managerReportList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
