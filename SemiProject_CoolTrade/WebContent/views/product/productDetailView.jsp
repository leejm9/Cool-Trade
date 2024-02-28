<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	Product p = (Product)request.getAttribute("p");
 	double ondo = p.getOndo();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>
	<div id="content-ds">
        <div id="category_path-ds">
            <div id="category_selection-ds" class="flex-ds" style="flex-direction:row; align-items:top;">
            <div id="home_img-ds">
                    <img src="resources/images/home.png" alt="home img">
                    홈
                </div>
                <img src="resources/images/greater than.png" alt="greater than sign">
                <div id="product_category_path-ds">
                    <div id="product_category_selected-ds"><%=p.getCategoryNo()%></div>
                </div>
            </div>
        </div>
        <div id="detail_pic_price-ds" class="flex-ds">
            <div id="small_thumbnail-ds" >
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/forest1.PNG" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/undraw_profile_1.svg" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/말풍선.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/돋보기.png" alt="이미지">
                </div>
            </div>
            <div id="main_img-ds">
                <img src="resources/images/home.png" alt="메인이미지">
            </div>
            <div id="product_info-ds">
                <div id="title_price-ds">
                    <div id="detail_title-ds">
                        <h4><%=p.getProductName()%></h4>
                    </div>
                    <div id="detail_price-ds" class="flex-ds">
                        <div class="flex-ds"><h1><%=p.getPrice()%></h1><span>원</span></div>
                        <a href="#">네이버 가격비교</a>
                    </div>
                    <div id="like_view_report-ds" class="flex-ds">
                        <div id="like_view_time-ds" class="flex-ds">
                            <div class="need_line_after-ds">❤️1238</div>
                            <div class="need_line_after-ds">👁️‍🗨️36480</div>
                            <div >🕗 <%=p.getUploadDate()%></div>
                        </div>
                        <div id="go_report-ds">🚨신고하기</div>
                    </div>
                    <div id="product_stats-ds">
                        <div id="current_status-ds" class="flex-ds">
                            <div class="dot_before-ds">
                                상품상태
                            </div>
                            <div id="stat_text-ds">
                                <%=p.getProductStatus()%>
                            </div>
                        </div>
                        <div id="change_yn-ds" class="flex-ds">
                            <div class="dot_before-ds">
                                교환여부
                            </div>
                            <div id="yn_change_letter-ds">
                                교환불가
                            </div>
                        </div>
                        <div id="delivery_fee-ds" class="flex-ds">
                            <div class="dot_before-ds">
                                배송비
                            </div>
                            <div id="fee_yn-ds" style="color:#04b4fc">
                                배송비 별도
                            </div>
                        </div>
                        <div id="sell_location-ds" class="flex-ds">
                            <div class="dot_before-ds">
                                거래지역
                            </div>
                            <div id="sell_location_text-ds">
                                <%=p.getZone()%>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="like_chat_buy-ds" class="flex-ds">
                    <button class="btn btn-lg btn-secondary">❤️찜<span>89</span></button>
                    <button class="btn btn-lg btn-warning">💬 채팅하기</button>
                    <button class="btn btn-lg btn-danger">바로사버리기</button>
                </div>
            </div>
        </div>
        <div id="related_products-ds">
            <div>
                <h5>관련상품</h5>
            </div>
            <div id="related_product_pic_title-ds">
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
            </div>
        </div>
        <div id="detail_seller-ds" class="flex-ds" style="border-top: 1px solid black; margin-bottom: 100px; border-bottom: 1px solid rgb(204, 204, 204);">
            <div id="detail_info-ds" style="padding-right: 30px; width: 650px;">
                <div style="border-bottom: 1px solid rgb(204, 204, 204); padding: 50px 0 20px 0;">상품정보</div>
                <div style="margin: 40px 0 40px 0;"><%=p.getProductDesc()%></div>
            </div>
            <div id="seller_info-ds" style="border-left: 1px solid rgb(204, 204, 204); padding-left: 20px; width: 350px;">
                <div style="border-bottom: 1px solid rgb(204, 204, 204); padding: 50px 0 20px 0;">상점정보</div>
                <div style="margin: 20px 0 20px 0; align-items: center;" class="flex-ds">
                    <div id="store_info-ds" style="margin-right: 15px;"><img src="https://cdn-icons-png.flaticon.com/256/2815/2815428.png" alt=""></div>
                    <div>
                        <h5><%=p.getSellerNo()%></h5>
                        <div class="flex-ds" style="justify-content: center; flex-direction: column;">
                            <div id="temperature-ds">
		                        <div id="temperature-div-ds">
		                            <div>매너온도</div>
		                            <div><%=ondo%> ℃</div>
		                        </div>
		                        <div id="progress-bar-div-ds">
		                            <div class="progress-ds">
		                                <progress class="progress-ds" id="progress-ds" value="<%= ondo %>" min="0" max="42.0"></progress>
		                            </div>
		                        </div>
		                        <div id="temperature-content-ds">
		                            <ul>
		                            	<% if(ondo >= 0 && ondo <= 10) { %>
		                                	<li>매너 최고! 쿨거래 회원</li>
		                                <% } else if(ondo > 10 && ondo < 40) { %>
		                                	<li>거래 우수 회원!</li>
		                                <% } else {%>
		                                	<li>내가 비매너라니..</li>
		                                <% } %>
		                                <li>10℃부터 쿨거래 이용이 가능해요</li>
		                            </ul>
		                        </div>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="random_products-ds">
            <div>
                <h5>추천상품</h5>
            </div>
            <div id="random_product_pic_title-ds">
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
                <div>
                    <a href="#" style="text-align: center;">
                        <img src="https://blog.kakaocdn.net/dn/qkaQd/btqUEzBgXQV/6ko3nLW5aglhGt1UCiHtnk/img.jpg" alt="몰라">
                        <p>치킨팝니다</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>