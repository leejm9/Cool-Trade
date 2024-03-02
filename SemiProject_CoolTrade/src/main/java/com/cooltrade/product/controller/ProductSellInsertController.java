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
import com.cooltrade.member.model.service.MemberService;
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
		
			// 쿨거래 체크박스의 값이 널일 경우는 1:일반거래/ 널이 아닐경우 2:일반거래
			int trade = 0;
			if(multiRequest.getParameter("coolTrade") == null) {
				trade = 1;
			} else {
				trade = 2;
			}
			
			// String으로 넘어온 price, pieces int로 변환
			String priceStr = multiRequest.getParameter("price");
			String priceStrCommas = priceStr.replaceAll(",", "");
			int price = Integer.parseInt(priceStrCommas);
			
			String piecesStr = multiRequest.getParameter("pieces");
			String piecesStrCommas = piecesStr.replaceAll(",", "");
			int pieces = Integer.parseInt(piecesStrCommas);
			
			Product p = new Product(multiRequest.getParameter("category"),
									multiRequest.getParameter("seller"),
									multiRequest.getParameter("title"), 
									price, 
									multiRequest.getParameter("content"), 
									multiRequest.getParameter("zone"), 
									multiRequest.getParameter("status"), 
									trade, 
									Integer.parseInt(multiRequest.getParameter("deliveryCharge")), 
									pieces);
			
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
			
			int pno = p.getProductNo();
			request.setAttribute("pno", pno);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상품이 성공적으로 등록 되었습니다.");
				request.getRequestDispatcher("views/product/productSellSuccess.jsp").forward(request, response);
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
