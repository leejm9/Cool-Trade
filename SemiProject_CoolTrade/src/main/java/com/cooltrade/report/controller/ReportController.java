package com.cooltrade.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.report.model.service.ReportService;

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/report.prod")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		String prodName = request.getParameter("prodName");
		String reporter = request.getParameter("reporter");
		String a = request.getParameter("reportCate");
		int reportCate = Integer.parseInt(a);
		
		String reportContent = request.getParameter("reportContent");
		
		int result = new ReportService().insertReport(pno,reporter,reportCate,reportContent);
		
		if(result >0) {
			request.setAttribute("alertMsg", "성공적으로 신고되었습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.po?pno=" + pno);
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
