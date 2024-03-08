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
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.Review;
import com.cooltrade.product.model.vo.ReviewType;
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
		
			int uno =  Integer.parseInt(multiRequest.getParameter("uno"));
			int pno = Integer.parseInt(multiRequest.getParameter("pno"));
			int cpage = Integer.parseInt(multiRequest.getParameter("cpage"));
			
			int score = Integer.parseInt(multiRequest.getParameter("rating"));
			String content = multiRequest.getParameter("reviewContent");
			// String[] reviewType = multiRequest.getParameterValues("reviewType");
			
			
			/*
			for(int i=0; i<reviewType.length; i++) {
				if(reviewType[i] != null) {
					System.out.println("디브 : " + reviewType[i]);
				}
			}
			*/
			
			Review r = new Review();
			r.setProductNo(pno);
			r.setUserNo(uno);
			r.setReviewDetail(content);
			r.setScore(score);
			
			ArrayList<ReviewType> list = new ArrayList<ReviewType>();
			
			for(int i=1; i<=6; i++) {
				String key = "R" + i;
				if(multiRequest.getParameter(key) != null) {
					ReviewType reType = new ReviewType();
					reType.setReviewType(key);
					
					list.add(reType);
				}
			}
			
			//String image = multiRequest.getParameter("reviewImage");
			//System.out.println(image);
			Images img = new Images();
			
			for(int i=1; i<2; i++) {
				String imgKey = "reviewImage";
				
				if(multiRequest.getOriginalFileName(imgKey) != null) {
					img.setOriginName(multiRequest.getOriginalFileName(imgKey));
					img.setChangeName(multiRequest.getFilesystemName(imgKey));
					img.setImgPath("resources/images_upfiles/");
					
				}
			}
			
			int result = new MemberService().insertReview(r, list, img, uno, pno);
			request.setAttribute("uno", uno);
			request.setAttribute("pno", pno);
			request.setAttribute("cpage", cpage);
			request.setAttribute("result", result);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "후기를 전달했어요");
				response.sendRedirect(request.getContextPath() + "/buylist.me?uno="+uno+"&cpage="+cpage);
			} 
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
