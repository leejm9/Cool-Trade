package com.cooltrade.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class ManagerDeleteBoardController
 */
@WebServlet("/delete.board")
public class ManagerDeleteBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerDeleteBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("진짜 pno");
		System.out.println(pno);
		int result = new ProductService().deleteBoard(pno);
		
		if(result >0) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(result);
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
