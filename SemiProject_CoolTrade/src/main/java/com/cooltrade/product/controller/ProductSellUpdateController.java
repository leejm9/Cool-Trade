package com.cooltrade.product.controller;

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
 * Servlet implementation class ProductSellUpdateController
 */
@WebServlet("/updateSell.po")
public class ProductSellUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSellUpdateController() {
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
			/*
			// 쿨거래 체크박스의 값이 널일 경우는 1:일반거래/ 널이 아닐경우 2:일반거래
			int trade = 0;
			if(multiRequest.getParameter("coolTrade") == null) {
				trade = 1;
			} else {
				trade = 2;
			}
			*/
			// 로그인한 회원 번호
			int userNo = Integer.parseInt(multiRequest.getParameter("seller"));
			int pno = Integer.parseInt(multiRequest.getParameter("pno"));
			
			// String으로 넘어온 price, pieces int로 변환
			String priceStr = multiRequest.getParameter("price");
			String priceStrCommas = priceStr.replaceAll(",", "");
			int price = Integer.parseInt(priceStrCommas);
			
			String piecesStr = multiRequest.getParameter("pieces");
			String piecesStrCommas = piecesStr.replaceAll(",", "");
			int pieces = Integer.parseInt(piecesStrCommas);
			
			String category = multiRequest.getParameter("category");
			System.out.println("카테고리 : " + category);
			
			Product p = new Product();
			p.setProductNo(pno);
			p.setCategoryNo(category);
			p.setSellerNo(multiRequest.getParameter("seller"));
			p.setProductName(multiRequest.getParameter("title"));
			p.setPrice(price);
			p.setProductDesc(multiRequest.getParameter("content"));
			p.setZone(multiRequest.getParameter("zone"));
			p.setProductStatus(multiRequest.getParameter("status"));
			p.setTradeType(Integer.parseInt(multiRequest.getParameter("trade")));
			p.setDeliveryCharge(Integer.parseInt(multiRequest.getParameter("deliveryCharge")));
			p.setPieces(pieces);
			
			ArrayList<Images> list = new ArrayList<Images>();
			
			int count = new ProductService().getImgCount(pno);
			
			//int del = new ProductService().deleteProductSellImage(pno);
			
			for(int i=0; i<5; i++) {
				String key = "image" + (i + 1);
				System.out.println(key+": "+multiRequest.getFilesystemName(key));
				
				if(multiRequest.getOriginalFileName(key) == null) { // 기존의 첨부파일이 넘어온 경우!! delete 안함!
					System.out.println("기존의 이미지가 넘어왔다!");
					
						Images img = new Images();
						img.setRefPno(Integer.parseInt(multiRequest.getParameter("pno")));
						img.setOriginName(multiRequest.getOriginalFileName(key));
						img.setChangeName(multiRequest.getFilesystemName(key));
						img.setImgPath("resources/images_upfiles/");
						
						if((i+1) == 1) {
							img.setImgLevel(1);
						} else {
							img.setImgLevel(2);
						}
						
						list.add(img);
						System.out.println(key + "는: " + img);
				 } else { // 기존의 이미지가 안넘어왔어! delete 함!!
						System.out.println("삭제하고 인서트!!");
						
						Images img = new Images();
						img.setRefPno(Integer.parseInt(multiRequest.getParameter("pno")));
						img.setOriginName(multiRequest.getOriginalFileName(key));
						img.setChangeName(multiRequest.getFilesystemName(key));
						img.setImgPath("resources/images_upfiles/");
						
						if((i+1) == 1) {
							img.setImgLevel(1);
						} else {
							img.setImgLevel(2);
						}
						list.add(img);
						System.out.println(key + "는: " + img);
				  }
			}
			
			System.out.println(list);
			/*
			int result = new ProductService().updateProductSell(p, list, pno, userNo);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상품이 수정되었습니다.");
				response.getWriter().print(result);
			} else {
				System.out.println("업데이트실패");
			}*/
			
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
