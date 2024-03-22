package com.cooltrade.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cooltrade.member.model.vo.BankAccount;
import com.cooltrade.member.model.vo.DeliveryAddress;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Images;
import com.cooltrade.product.model.vo.LikeProduct;
import com.cooltrade.product.model.vo.Product;
import com.cooltrade.product.model.vo.RecentProducts;

/**
 * Servlet implementation class DetilProductViewController
 */
@WebServlet("/detail.po")
public class DetailProductViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailProductViewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno"));

		int likeCount = new ProductService().selectLikeCount(pno);

		// 1. 조회수 증가
		int result = new ProductService().increaseCount(pno);

		// 2. 조회수 증가하면 성공
		if (result > 0) {
			Product p = new ProductService().selectProductDetail(pno);
			// System.out.println(p);
			ArrayList<Images> imglist = new ProductService().selectImages(pno);
			request.setAttribute("p", p);
			request.setAttribute("imglist", imglist);
			String uploadType = p.getUploadType();
			// System.out.println("업로드타입: "+uploadType);
			request.setAttribute("likeCount", likeCount);

			RecentProducts recent = new RecentProducts();
			if (imglist.isEmpty()) {
				recent.setProductNo(p.getProductNo());
				recent.setProductName(p.getProductName());
				recent.setPrice(p.getPrice());
				recent.setImgPath("resources/images/");
				recent.setChangeName("noImage.png");
			} else {
				recent = new RecentProducts(p.getProductNo(), p.getProductName(), p.getPrice(), p.getStrPrice(),
						imglist.get(0).getRefPno(), imglist.get(0).getImgPath(), imglist.get(0).getChangeName());
			}
			HttpSession session = request.getSession();

			ArrayList<RecentProducts> rlist = (ArrayList<RecentProducts>) session.getAttribute("rlist");

			if (rlist == null) {
				rlist = new ArrayList<RecentProducts>();
			}
			for (int i = 0; i < rlist.size(); i++) {
				if (rlist.get(i).getProductNo() == p.getProductNo()) {
					rlist.remove(i);
				}
			}
			rlist.add(0, recent);

			if (rlist.size() > 20) {
				rlist.remove(20);
			}

			ArrayList<DeliveryAddress> addressList = new ArrayList<DeliveryAddress>();
			Member m = (Member) session.getAttribute("loginUser");
			if (m != null) {
				addressList = new ProductService().getAddressList(m.getUserNo());
				request.setAttribute("addressList", addressList);
			}

			session.setAttribute("rlist", rlist);
			
			System.out.println(p);
			
			BankAccount bankList = new BankAccount();
			int uno = p.getSellerNum();
			if (uno > 0) {
				bankList = new ProductService().getBankList(uno);
				request.setAttribute("bankList", bankList);
			}
			if (p.getUploadType().equals("N")) {
				request.setAttribute("errorMsg", "존재하지 않거나 삭제된 게시물 입니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			} else if (p.getUploadType().equals("C") || p.getUploadType().equals("P")) {

				int countRed = new ProductService().reduceCount(pno);
				request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);

			} else {
				request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
