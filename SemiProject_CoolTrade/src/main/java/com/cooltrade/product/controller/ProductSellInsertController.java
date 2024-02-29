package com.cooltrade.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.cooltrade.common.Images;
import com.cooltrade.common.MyFileRenamePolicy;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductSellInsertController
 */
@WebServlet("/sellinsert.po")
public class ProductSellInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSellInsertController() {
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
		
			Product p = new Product();
			p.setProductName(multiRequest.getParameter("title"));
			p.setCategoryNo(multiRequest.getParameter("category"));
			p.setProductStatus(multiRequest.getParameter("status"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("price")));
			p.setDeliveryCharge(Integer.parseInt(multiRequest.getParameter("deliveryCharge")));
			p.setProductDesc(multiRequest.getParameter("content"));
			p.setPieces(Integer.parseInt(multiRequest.getParameter("pieces")));
			p.setZone(multiRequest.getParameter("trade-zone"));
			p.setTradeType(Integer.parseInt(multiRequest.getParameter("coolTrade")));
			
			System.out.println(p);
			
			ArrayList<Images> list = new ArrayList<Images>();
			
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
				response.sendRedirect(request.getContextPath() + "/detail.po");
			} else {
				System.out.println("실패");
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
