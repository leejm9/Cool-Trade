package com.cooltrade.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.cooltrade.common.MyFileRenamePolicy;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MemberReviewFormController
 */
@WebServlet("/reviewForm.me")
public class MemberReviewFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 용량 제한
			int maxSize = 10*1024*1024;
			
			// 저장시킬 폴더 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images_upfiles/");
			
			// 전달 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			int stars = Integer.parseInt(multiRequest.getParameter("stars"));
			
			System.out.println("별점2 : "+stars);
			/*
			for(int i=1; i<=5; i++) {
				String key = "image" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					Images img = new Images();
					img.setOriginName(multiRequest.getOriginalFileName(key));
					img.setChangeName(multiRequest.getFilesystemName(key));
					img.setImgPath("resources/images_upfiles/");
					
					if(i == 1) {
						img.setImgLevel(1);
					} else {
						img.setImgLevel(2);
					}
					
					list.add(img);
					
				} 
				
			}
			
			int result = new ProductService().insertProductSell(p, list);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상품이 성공적으로 등록 되었습니다.");
				request.getRequestDispatcher("views/product/productSellSuccess.jsp").forward(request, response);
			} else {
				System.out.println("실패");
			}
			*/
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
