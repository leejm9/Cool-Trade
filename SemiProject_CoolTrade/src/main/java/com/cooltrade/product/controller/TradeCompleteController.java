package com.cooltrade.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cooltrade.chatting.controller.model.Service.ChatService;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;
import com.cooltrade.product.model.service.ProductService;
import com.cooltrade.product.model.vo.Product;

/**
 * Servlet implementation class TradeCompleteController
 */
@WebServlet("/complete.tr")
public class TradeCompleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TradeCompleteController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//System.out.println("오냐?");
		request.setCharacterEncoding("UTF-8");

		int pno = Integer.parseInt(request.getParameter("pno"));
		int sellerNo = Integer.parseInt(request.getParameter("sellerNo"));
		int buyerNo = Integer.parseInt(request.getParameter("buyerNo"));

		Product p = new ProductService().selectProductDetail(pno);
		Member buyer = new MemberService().selectMember(buyerNo);
		Member seller = new MemberService().selectMember(sellerNo);
		int check = new ChatService().countChatRoom(buyer.getUserId(), seller.getUserId());
		int checkResult = 0;
		String message = "<b> 상품명 " + p.getProductName() + "에 대한 거래를 시작해 보세요.</b> <br>" + " - 구매자 : "
				+ buyer.getNickName() + "<br>"
				+ "입금 확인 후 거래를 완료하세요. <br> <button id='tradeComplete'>거래완료</button> <button id='tradeCancel'>거래취소</button> <input type='hidden' id='pno' value='"
				+ pno + "'>";
		int result = new ProductService().insertTrade(pno, buyerNo);

		if (result > 0) {
			if (check == 0) {
				checkResult = new ChatService().createChatRoom(buyer.getUserId(), seller.getUserId());
			}
			int chatRoomNo = new ChatService().getChatRoomNo(buyer.getUserId(), seller.getUserId());

			int chatCheckResult = new ChatService().insertMessage(buyer.getUserId(), message, chatRoomNo);
			if (chatCheckResult > 0) {
				int ondoCheck = new MemberService().decreaseOndo(buyer.getUserNo(), seller.getUserNo());
				if (ondoCheck > 0) {
					request.getSession().setAttribute("alertMsg", "상품을 구매했습니다!");
					request.getRequestDispatcher("views/common/home.jsp").forward(request, response);
				}
			}
		} else {
			request.getSession().setAttribute("alertMsg", "구매할수 없는 상품입니다.");
			request.setAttribute("errorMsg", "상품 구매에 실패했습니다!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
