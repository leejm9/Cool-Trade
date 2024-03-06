package com.cooltrade.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/searchId.do")
public class AjaxSearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AjaxSearchIdController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		Member member = new MemberService().searchId( name, email);
		if (member != null) {
			//response.getWriter().print("success");
			response.setContentType("application/json; charset=utf-8");

	    HashMap<String, Object> map = new HashMap<String, Object>();
	    map.put("userId", member.getUserId());
	    map.put("enrollDate",new SimpleDateFormat("yyyy-MM-dd").format(member.getEnrollDate()));
	    new Gson().toJson(map, response.getWriter());
		} else {
			response.getWriter().print("fail");
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
