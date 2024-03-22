package com.cooltrade.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.report.model.service.ReportService;
import com.cooltrade.report.model.vo.Report;

/**
 * Servlet implementation class ReportDetailPageController
 */
@WebServlet("/report.detail")
public class ReportDetailPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportDetailPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int reportedProductNo = new ReportService().getReportedProductNo(rno); // 피신고자 찾기위해 신고번호를통해서 신고된 게시물 번호알아내기
		
		String reportedUser = new MemberService().getReportedUserName(reportedProductNo); // 조인통해서 피신고자 이름찾기
		
		Report r = new ReportService().selectReportDetail(rno);
		request.setAttribute("reportedUser", reportedUser);
		request.setAttribute("r", r);
		request.getRequestDispatcher("views/manager/managerReportDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
