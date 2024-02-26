<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content">
        <div id="category_path">
            <div id="category_selection" class="flex" style="flex-direction:row; align-items:top;">
            <div id="home_img">
                    <img src="resources/images/home.png" alt="home img">
                    홈
                </div>
                <img src="resources/images/greater than.png" alt="greater than sign">
                <div id="product_category_path">
                    <div id="product_category_selected" class="dropdown-toggle"> 카테고리</div>
                </div>
            </div>
        </div>
        <div id="detail_pic_price" class="flex">
            <div id="small_thumbnail" >
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
                <div>
                    <img src="resources/images/sell.png" alt="이미지">
                </div>
            </div>
            <div id="main_img">
                <img src="resources/images/home.png" alt="메인이미지">
            </div>
            <div id="product_info">
                <div id="title_price">
                    <div id="detail_title">
                        <h4>저희집을 팔아보려합니다~</h4>
                    </div>
                    <div id="detail_price" class="flex">
                        <div class="flex"><h1>124,000</h1><span>원</span></div>
                        <a href="#">네이버 가격비교</a>
                    </div>
                    <div id="like_view_report" class="flex">
                        <div id="like_view_time" class="flex">
                            <div class="need_line_after">❤️1238</div>
                            <div class="need_line_after">👁️‍🗨️36480</div>
                            <div >🕗 2시간 전</div>
                        </div>
                        <div id="go_report">🚨신고하기</div>
                    </div>
                    <div id="product_stats">
                        <div id="current_status" class="flex">
                            <div class="dot_before">
                                상품상태
                            </div>
                            <div id="stat_text">
                                새 상품
                            </div>
                        </div>
                        <div id="change_yn" class="flex">
                            <div class="dot_before">
                                교환여부
                            </div>
                            <div id="yn_change_letter">
                                교환불가
                            </div>
                        </div>
                        <div id="delivery_fee" class="flex">
                            <div class="dot_before">
                                배송비
                            </div>
                            <div id="fee_yn" style="color:#04b4fc">
                                배송비 별도
                            </div>
                        </div>
                        <div id="sell_location" class="flex">
                            <div class="dot_before">
                                거래지역
                            </div>
                            <div id="sell_location_text">
                                전국
                            </div>
                        </div>
                    </div>
                </div>
                <div id="like_chat_buy" class="flex">
                    <button class="btn btn-lg btn-secondary">❤️찜<span>89</span></button>
                    <button class="btn btn-lg btn-warning">💬 채팅하기</button>
                    <button class="btn btn-lg btn-danger">바로사버리기</button>
                </div>
            </div>
        </div>
        <div id="related_products">
            <div>
                <h5>관련상품</h5>
            </div>
            <div id="related_product_pic_title">
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
        <div id="detail_seller" class="flex" style="border-top: 1px solid black; margin-bottom: 100px; border-bottom: 1px solid rgb(204, 204, 204);">
            <div id="detail_info" style="padding-right: 30px; width: 650px;">
                <div style="border-bottom: 1px solid rgb(204, 204, 204); padding: 50px 0 20px 0;">상품정보</div>
                <div style="margin: 40px 0 40px 0;">대충 상품 내용 여기다가 적어놓으면됨 알겠지</div>
            </div>
            <div id="seller_info" style="border-left: 1px solid rgb(204, 204, 204); padding-left: 20px; width: 350px;">
                <div style="border-bottom: 1px solid rgb(204, 204, 204); padding: 50px 0 20px 0;">상점정보</div>
                <div style="margin: 20px 0 20px 0; align-items: center;" class="flex">
                    <div id="store_info" style="margin-right: 15px;"><img src="https://cdn-icons-png.flaticon.com/256/2815/2815428.png" alt=""></div>
                    <div>
                        <h5>동네지나가는아저씨</h5>
                        <div class="flex" style="justify-content: space-evenly;">
                            <p>팔로워</p>
                            <span>12039명</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="random_products">
            <div>
                <h5>추천상품</h5>
            </div>
            <div id="random_product_pic_title">
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
</body>
</html>