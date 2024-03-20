package com.cooltrade.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.report.model.service.ReportService;

/**
 * Servlet implementation class ReportCheckController
 */
@WebServlet("/report.ch")
public class ReportCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		int userNo = new ProductService().getReportedUserNo(pno); // 신고당한 사람의 회원번호 가져오기
		
		int result = new ReportService().updateReport(userNo); // 회원번호가 userNo 인사람의 caution +1
		int check = new MemberService().checkUserCaution(userNo); // 신고 당한사람의 caution이 3인지 확인
		if(check >= 3) {
			int black = new MemberService().updateLevelToBlack(userNo); // check값이 3이상이면 블랙리스트 회원으로 바꾸기
		}
		
		if(result > 0) {
			int result2 = new ReportService().deleteReport(reportNo);
			if(result2 > 0) {
				response.getWriter().print(result2);
			}else {
				
			}
		}else {
			
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
