package com.cooltrade.manager;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.product.model.dao.ProductDao;
import com.cooltrade.product.model.service.ProductService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ManagerInsertSearchController
 */
@WebServlet("/show.popw")
public class ManagerInsertSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerInsertSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String jsonString = sb.toString();

        // JSON 문자열을 객체로 변환
        Gson gson = new Gson();
        String[] list = gson.fromJson(jsonString, String[].class);
		
		
		int result1 = new ProductService().deletePopularSearch();
		int	result2 = new ProductService().insertPopularSearch(list);
		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result2,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
