<%@page import="com.cooltrade.product.model.vo.Images"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
	Product p = (Product)request.getAttribute("p"); 
	ArrayList<Images> imglist = (ArrayList<Images>)request.getAttribute("imglist"); 
	double ondo = p.getOndo(); 
	int likeCount = (int)request.getAttribute("likeCount"); 
%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title><%=p.getProductName()%> | 쿨거래</title>
      </head>
      <body>
        <%@ include file="../common/header.jsp" %>

        <div id="content-ds">
          <div id="category_path-ds">
            <div
              id="category_selection-ds"
              class="flex-ds"
              style="flex-direction: row; align-items: top"
            >
              <div id="home_img-ds">
                <img src="resources/images/home.png" alt="home img" />
                홈
              </div>
              <img
                src="resources/images/greater than.png"
                alt="greater than sign"
              />
              <div id="product_category_path-ds">
                <div id="product_category_selected-ds">
                  <%=p.getCategoryNo()%>
                </div>
              </div>
            </div>
          </div>
          <div id="detail_pic_price-ds" class="flex-ds">
            <div id="small_thumbnail-ds">
              <%for(Images img : imglist) {%>
              <div>
                <img
                  src="<%=img.getImgPath()+img.getChangeName()%>"
                  alt="이미지"
                />
              </div>
              <%} %>
            </div>
            <div id="main_img-ds"></div>
            <div id="product_info-ds">
              <div id="title_price-ds">
                <div id="detail_title-ds">
                  <h4><%=p.getProductName()%></h4>
                </div>
                <div id="detail_price-ds" class="flex-ds">
                  <div class="flex-ds">
                    <h1><%=p.getPrice()%></h1>
                    <span>원</span>
                  </div>
                  <a href="#">네이버 가격비교</a>
                </div>
                <div id="like_view_report-ds" class="flex-ds">
                  <div id="like_view_time-ds" class="flex-ds">
                    <div class="need_line_after-ds">
                      ❤️
                      <span id="like-span"><%= likeCount %></span>
                    </div>
                    <div class="need_line_after-ds">👁️‍🗨️<%=p.getCount() %></div>
                    <div>🕗 <%=p.getTimeDiff()%></div>
                  </div>
                  <div id="go_report-ds">🚨신고하기</div>
                </div>
                <div id="product_stats-ds">
                  <div id="current_status-ds" class="flex-ds">
                    <div class="dot_before-ds">상품상태</div>
                    <div id="stat_text-ds"><%=p.getProductStatus()%></div>
                  </div>
                  <div id="delivery_fee-ds" class="flex-ds">
                    <div class="dot_before-ds">배송비</div>
                    <div id="fee_yn-ds" style="color: #04b4fc">배송비 별도</div>
                  </div>
                  <div id="sell_location-ds" class="flex-ds">
                    <div class="dot_before-ds">거래지역</div>
                    <div id="sell_location_text-ds"><%=p.getZone()%></div>
                  </div>
                </div>
              </div>
              <div id="like_chat_buy-ds" class="flex-ds">
                <% if(loginUser != null){%>
                <button
                  class="btn btn-lg btn-secondary"
                  onclick="likeBtn(<%= loginUser.getUserNo() %>, <%= p.getProductNo() %>);"
                >
                  ❤️찜<span><%= likeCount %></span>
                </button>
                <%}else{ %>
                <button
                  class="btn btn-lg btn-secondary"
                  onclick="location.href='<%=contextPath%>/loginForm.me';"
                >
                  ❤️찜<span><%= likeCount %></span>
                </button>
                <%} %>
                <%if(loginUser.getUserId().equals(p.getSellerNo())) {%>
                <button
                  class="btn btn-lg btn-warning"
                  onclick="location.href='<%= request.getContextPath() %>/chatroom.in?pno=<%= p.getSellerNo()%>&userId=<%=loginUser.getUserId() %>'"
                >
                  💬 나와의 채팅
                </button>
                <%}else{ %>
                <button
                  class="btn btn-lg btn-warning"
                  onclick="location.href='<%= request.getContextPath() %>/chatroom.in?pno=<%= p.getSellerNo()%>&userId=<%=loginUser.getUserId() %>'"
                >
                  💬 채팅하기
                </button>
                <%} %>
              </div>
            </div>
          </div>

          <script>
            // 찜하기
            function likeBtn(userNo, pNo) {
              console.log("찜버튼클릭함");
              if (confirm("상품을 관심상품으로 등록/해제 하시겠습니까?")) {
                $.ajax({
                  url: "ajaxlike.po",
                  data: {
                    uno: userNo,
                    pno: pNo,
                  },
                  type: "post",
                  success: function (result) {
                    console.log(userNo, pNo)
                    alert("성공적으로 반영되었습니다.");
                    location.reload();
                  },
                });
              } else {
                console.log("취소");
              }
            }
          </script>

          <div id="related_products-ds">
            <button class="prev-ds">&lt;</button>
            <div class="flex-ds" style="justify-content: space-between">
              <h5>관련상품</h5>
              <span id="related_cpage" style="color: gray"></span>
            </div>
            <div id="related_product_pic_title-ds">
              <!-- Ajax를 통한 관련 서치 리스트 -->
            </div>
            <button class="next-ds">&gt;</button>
          </div>

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
                    let itemHTML = '<div class="item" style="border: 1px solid rgb(204, 204, 204); padding: 5px;">'
                    			 + '<a href="detail.po?pno=' + item.productNo + '">'
                    			 + '<img src="' + imagePath + '" alt="' + item.productName + '">'
                    			 + '<p>' + item.productName + '</p>'
                    			 + '</a>'
                    			 + '</div>';
                    slider.append(itemHTML);
                });
                maxPage = Math.ceil(data.plist.length / itemsPerPage) - 1;
                if(maxPage == -1){
            		currentPage = -1;
                }
                $("#related_cpage").text((currentPage + 1) + "/" + (maxPage + 1));
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
                        $(".prev-ds").click(function() {
                            if (currentPage > 0) {
                                currentPage = (currentPage - 1 + allData.plist.length) % allData.plist.length; // 이전 페이지로 이동
                            }else if(currentPage == 0){
                            	maxPage = Math.ceil(allData.plist.length / itemsPerPage) - 1;
                            	currentPage = maxPage;
                            }
                            renderSlider(allData); // 슬라이더 다시 렌더링
                        });

                        // 다음 페이지 보기
                        $(".next-ds").click(function() {
                            maxPage = Math.ceil(allData.plist.length / itemsPerPage) - 1; // 최대 페이지 인덱스 계산
                            if (currentPage < maxPage) {
                                currentPage += 1; // 다음 페이지로 이동
                            }else if(currentPage == maxPage){
                            	currentPage = 0
                            }

                                renderSlider(allData); // 슬라이더 다시 렌더링
                        });

                        fetchSliderData(); // 최초 데이터 로드 및 슬라이더 초기화
                    });
          </script>
          <div
            id="detail_seller-ds"
            class="flex-ds"
            style="
              border-top: 1px solid black;
              margin-bottom: 100px;
              border-bottom: 1px solid rgb(204, 204, 204);
            "
          >
            <div id="detail_info-ds" style="padding-right: 30px; width: 650px">
              <div
                style="
                  border-bottom: 1px solid rgb(204, 204, 204);
                  padding: 50px 0 20px 0;
                "
              >
                상품정보
              </div>
              <div style="margin: 40px 0 40px 0"><%=p.getProductDesc()%></div>
            </div>
            <div
              id="seller_info-ds"
              style="
                border-left: 1px solid rgb(204, 204, 204);
                padding-left: 20px;
                width: 350px;
              "
            >
              <div
                style="
                  border-bottom: 1px solid rgb(204, 204, 204);
                  padding: 50px 0 20px 0;
                "
              >
                상점정보
              </div>
              <div
                style="margin: 20px 0 20px 0; align-items: center"
                class="flex-ds"
              >
                <div id="store_info-ds" style="margin-right: 15px">
                  <img
                    src="https://cdn-icons-png.flaticon.com/256/2815/2815428.png"
                    alt=""
                  />
                </div>
                <div>
                  <h5><%=p.getSellerNo()%></h5>
                  <div
                    class="flex-ds"
                    style="justify-content: center; flex-direction: column"
                  >
                    <div id="temperature-ds">
                      <div id="temperature-div-ds">
                        <div>매너온도</div>
                        <div><%=ondo%> ℃</div>
                      </div>
                      <div id="progress-bar-div-ds">
                        <div class="progress-ds">
                          <progress
                            class="progress-ds"
                            id="progress-ds"
                            value="<%= ondo %>"
                            min="0"
                            max="42.0"
                          ></progress>
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
            <button class="prev2-ds">&lt;</button>
            <div class="flex-ds" style="justify-content: space-between">
              <h5>추천상품</h5>
              <span id="recommend_cpage" style="color: gray">123</span>
            </div>
            <div id="random_product_pic_title-ds">
              <!-- 추천상품 들어오는 장소 -->
            </div>
            <button class="next2-ds">&gt;</button>
          </div>

          <script>
                    $(document).ready(function(){
                        let currentPno2 = <%= p.getProductNo() %>;
                        let currentPage2 = 0; // 현재 페이지 인덱스
                        const itemsPerPage2 = 5; // 페이지 당 아이템 수
                        let maxPage2;
                        let allData2 = []; // 서버로부터 받아온 모든 데이터를 저장할 배열
                        let imgData2 = [];
                        // 슬라이더에 데이터를 렌더링하는 함수
                        function renderSlider2(data) {
                const slider2 = $("#random_product_pic_title-ds");
                slider2.empty(); // 기존 내용을 비움

                // 현재 페이지에 해당하는 아이템들만 표시
                const startIndex2 = currentPage2 * itemsPerPage2;
                const endIndex2 = startIndex2 + itemsPerPage2;
             // data 객체에서 plist와 imglist를 추출합니다.
                let plist2 = data.plist;
                let imglist2 = data.imglist;

                // 현재 페이지에 해당하는 아이템들만 표시
                let slicedData2 = plist2.slice(currentPage2 * itemsPerPage2, (currentPage2 + 1) * itemsPerPage2);
                slicedData2.forEach(function(item){
                    let img2 = imglist2.find(i => i.refPno == item.productNo);
                    let imagePath2 = img2 ? img2.imgPath + img2.changeName : "resources/images/noImage.png";
                    let itemHTML2 = '<div class="item" style="border: 1px solid rgb(204, 204, 204); padding: 5px;">' +
                                    '<a href="detail.po?pno=' + item.productNo + '">' +
                                    '<img src="' + imagePath2 + '" alt="' + item.productName + '">' +
                                    '<p>' + item.productName + '</p>' +
                                    '</a>' +
                                    '</div>';
                    slider2.append(itemHTML2);
                });
                maxPage2 = Math.ceil(data.plist.length / itemsPerPage2) - 1;
                if(maxPage2 == -1){
            		currentPage2 = -1;
                }
                $("#recommend_cpage").text((currentPage2 + 1) + "/" + (maxPage2 + 1));
            }

                        // 서버로부터 데이터를 불러오는 함수
                        function fetchSliderData2() {
                            if(allData2.length == 0) { // 데이터가 아직 로드되지 않았다면 서버에서 불러온다
                                $.ajax({
                                    url: "ajax.randomize",
                                    data:{pno : currentPno2},
                                    dataType: "json", // 명시적으로 json 타입임을 선언
                                    success: function(response) {
                                    	allData2 = response;
                                    	console.log(allData2);
                                        renderSlider2(allData2); // 슬라이더 렌더링 함수 호출
                                    },
                                    error: function() {
                                        console.error("데이터를 불러오는 데 실패했습니다.");
                                    }
                                });
                            } else {
                                renderSlider2(allData2); // 이미 데이터가 있으므로 바로 렌더링
                            }
                        }

                     	// 이전 페이지 보기
                        $(".prev2-ds").click(function() {
                            if (currentPage2 > 0) {
                                currentPage2 = (currentPage2 - 1 + allData2.plist.length) % allData2.plist.length; // 이전 페이지로 이동
                            }else if(currentPage2 == 0){
                            	maxPage2 = Math.ceil(allData2.plist.length / itemsPerPage2) - 1;
                            	currentPage2 = maxPage2;
                            }
                            renderSlider2(allData2); // 슬라이더 다시 렌더링
                        });

                        // 다음 페이지 보기
                        $(".next2-ds").click(function() {
                            maxPage2 = Math.ceil(allData2.plist.length / itemsPerPage2) - 1; // 최대 페이지 인덱스 계산
                            if (currentPage2 < maxPage2) {
                                currentPage2 += 1; // 다음 페이지로 이동
                            }else if(currentPage2 == maxPage2){
                            	currentPage2 = 0
                            }
                                renderSlider2(allData2); // 슬라이더 다시 렌더링
                        });

                        fetchSliderData2(); // 최초 데이터 로드 및 슬라이더 초기화
                    });
          </script>
        </div>
        <%@ include file="../common/footer.jsp" %>
      </body>
    </html></Images
  ></Images
>
