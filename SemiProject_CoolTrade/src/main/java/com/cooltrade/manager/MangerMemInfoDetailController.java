package com.cooltrade.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;

/**
 * Servlet implementation class MangerMemInfoDetailController
 */
@WebServlet("/memInfo.detail")
public class MangerMemInfoDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MangerMemInfoDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uno = Integer.parseInt(request.getParameter("uno"));
		
		Member m = new MemberService().selectMember(uno);
		
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("views/manager/managerMemberDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
