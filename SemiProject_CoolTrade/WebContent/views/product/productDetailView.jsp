<%@page import="com.cooltrade.product.model.vo.Images"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	Product p = (Product)request.getAttribute("p");
 	ArrayList<Images> imglist = (ArrayList<Images>)request.getAttribute("imglist");
 	double ondo = p.getOndo();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getProductName()%> | 쿨거래</title>
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
                <%for(Images img : imglist) {%>
                <div>
                    <img src="<%=img.getImgPath()+img.getChangeName()%>" alt="이미지">
                </div>
                <%} %>
            </div>
            <div id="main_img-ds">
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
                            <div class="need_line_after-ds">❤️198237</div>
                            <div class="need_line_after-ds">👁️‍🗨️<%=p.getCount() %></div>
                            <div >🕗 <%=p.getTimeDiff()%></div>
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
        <button id="prev"> &lt; </button>
        <div id="related_products-ds">
            <div>
                <h5>관련상품</h5>
            </div>
            <div id="related_product_pic_title-ds">
            </div>
        </div> 
        <button id="next"> &gt; </button>
            
            <script>
            $(document).ready(function(){
                let currentPno = <%= p.getProductNo() %>;
                let currentPage = 0; // 현재 페이지 인덱스
                const itemsPerPage = 5; // 페이지 당 아이템 수
                let maxPage;
                let allData = []; // 서버로부터 받아온 모든 데이터를 저장할 배열
                let imgData = [];
                // 슬라이더에 데이터를 렌더링하는 함수
                function renderSlider(data) {
				    const slider = $("#related_product_pic_title-ds");
				    slider.empty(); // 기존 내용을 비움
				
				    // 현재 페이지에 해당하는 아이템들만 표시
				    const startIndex = currentPage * itemsPerPage;
				    const endIndex = startIndex + itemsPerPage;
				 // data 객체에서 plist와 imglist를 추출합니다.
				    let plist = data.plist;
				    let imglist = data.imglist;

				    // 현재 페이지에 해당하는 아이템들만 표시
				    let slicedData = plist.slice(currentPage * itemsPerPage, (currentPage + 1) * itemsPerPage);
				    slicedData.forEach(function(item){
				        let img = imglist.find(i => i.refPno == item.productNo);
				        let imagePath = img ? img.imgPath + img.changeName : "resources/images/noImage.png";
				        let itemHTML = '<div class="item">' +
				                        '<a href="detail.po?pno=' + item.productNo + '">' +
				                        '<img src="' + imagePath + '" alt="' + item.productName + '">' +
				                        '<p>' + item.productName + '</p>' +
				                        '</a>' +
				                        '</div>';
				        slider.append(itemHTML);
				    });
				}

                // 서버로부터 데이터를 불러오는 함수
                function fetchSliderData() {
                    if(allData.length == 0) { // 데이터가 아직 로드되지 않았다면 서버에서 불러온다
                        $.ajax({
                            url: "ajax.related",
                            data: { pno: currentPno },
                            dataType: "json", // 명시적으로 json 타입임을 선언
                            success: function(response) {
                            	allData = response;
								console.log(allData);
                                renderSlider(allData); // 슬라이더 렌더링 함수 호출
                            },
                            error: function() {
                                console.error("데이터를 불러오는 데 실패했습니다.");
                            }
                        });
                    } else {
                        renderSlider(allData); // 이미 데이터가 있으므로 바로 렌더링
                    }
                }

             	// 이전 페이지 보기
                $("#prev").click(function() {
                    if (currentPage > 0) {
                        currentPage = (currentPage - 1 + allData.plist.length) % allData.plist.length; // 이전 페이지로 이동
                    }else{
                    	currentPage = 3;
                    }   
                        renderSlider(allData); // 슬라이더 다시 렌더링
                
                });
				
                // 다음 페이지 보기
                $("#next").click(function() {
                    maxPage = Math.ceil(allData.plist.length / itemsPerPage) - 1; // 최대 페이지 인덱스 계산
                    if (currentPage < maxPage) {
                        currentPage += 1; // 다음 페이지로 이동
                    }else if(currentPage = maxPage){
                    	currentPage = 0
                    }
                        renderSlider(allData); // 슬라이더 다시 렌더링
                });
                
                fetchSliderData(); // 최초 데이터 로드 및 슬라이더 초기화
            });
			</script>
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