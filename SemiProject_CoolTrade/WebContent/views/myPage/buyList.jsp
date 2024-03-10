<%@page import="com.cooltrade.product.model.vo.Trade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
	ArrayList<Trade> list = (ArrayList<Trade>)request.getAttribute("list");
	// 거래번호, 상품이름, 가격, 거래일자, 배송상태
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String word = (String)request.getAttribute("word");
// 	int result = (int)request.getAttribute("result");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'GmarketSansMedium';
            color: #444444;
        }

        div {
            /* border: 1px solid red; */
        }

        #wrap {
            width: 1000px;
            margin: auto;
            display: flex;
            margin-top: 200px;
            padding-top: 20px;
        }

        /* 왼쪽 컨텐츠 CSS */
        #left-content {
            width: 20%;
        }

        #tit {
            font-weight: 800;
            letter-spacing: -1.5px;
            height: 60px;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: #444444;
        }

        a:hover {
            color: rgb(4, 180, 252);
        }

        .sub-title-list {
            padding: 3px 0px;
            font-size: 15px;
        }

        .sub-title-h3 {
            font-size: 18px;
            font-weight: 600;
        }

        .sub-title-li {
            padding-bottom: 20px;
        }

        /* 오른쪽 컨텐츠 CSS */
        #right-content {
            width: 80%;
        }

        #right-content-title {
            font-size: 18px;
            font-weight: 700;
        }
        
        ::placeholder {
	        color: #c2c2c2;
	    }
        
        #buy-list-search>input {
	        border: none;
	        outline: none;
	        width: 100%;
	        font-size: 14px;
	        padding: 0px 5px;
	    }

        .buy-list-search-btn {
            border: none;
            background: none;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
        }

        #right-content-search-area {
            display: flex;
            align-items: center;
            height: 70px;
        }

        #right-content-search-area>div {
            margin-right: 15px;
        }

        #right-content-wrap>div{
            padding: 10px 0px;
            width: 100%;
        }

        #search-input {
            border: none;
            outline: none;
            width: 100%;
            font-size: 14px;
            padding: 0px 5px;
        }

        #buy-list-search {
            display: flex;
            border: 1px solid #e6e6e6;
            width: 40%;
            height: 35px;
            padding: 0px 5px;
            align-items: center;
            background: white;
        }

        table {
            border-top: 2px solid #d6d6d6;
            border-bottom: 1px solid #e6e6e6;
            width: 100%;
            border-spacing: 10px;
            border-collapse: separate; /* 셀테두리가 별도로 표시되도록 설정 */
            border-collapse: collapse;
        }

        .list-select-btn {
            background-color: transparent;
            border: 1px solid #d6d6d6;
            height: 30px;
            width: 70px;
            border-radius: 5px;
            font-size: 13px;
            cursor: pointer;
        }

        td {
            text-align: center;
            font-size: 14px;
            border: 1px solid #e6e6e6;
            padding: 10px 10px;
        }

        .deliver-status {
            padding-bottom: 5px;
        }

        th {
            text-align: center;
        }

        #thead-tr {
            background-color: #fafafa;
            height: 35px;
            text-align: center;
        }

        tr td:first-child {
            border-left: none;
        }

        tr td:last-child {
            border-right: none; /* 마지막 td의 오른쪽 보더를 없애기 */
        }
        
        .paging-area {
	        height: 80px;
	        display: flex;
	        align-items: center;
	        justify-content: space-around;
	    }
	
	    .paging-area button {
	        border: none;
	        background-color: transparent;
	        margin: 0px 5px;
	    }
	
	    .active-page {
	        color: rgb(4, 180, 252); /* 선택된 페이지의 글자색을 흰색으로 설정 */
	    }
	    
	    #td-date {
	    	width: 120px;
	    }
	    
	    #td-po {
	    	width: 300px;
	    }
	    
	    .titleImg {
	    	width: 140px;
	    	height: 140px;
    	}
    	
    	.rating {
		   width: 180px;
		}
		
		.rating__star {
		   cursor: pointer;
		   color: #dabd18b2;
		}
		
		#se-review>div {
			border: 1px solid #e3e3e3;
			width: 200px;
			height: 30px;
			padding: 5px 0px;
			border-radius: 30px;
            font-size: 12px;
            cursor: pointer;
		}
    
    	#se-review {
            display: grid;
            grid-template-columns: repeat(2,1fr);
            gap: 5px;
            justify-items: center;
            width: 450px;
            height: 150px;
            background-color: none;
            padding: 15px 0px;
    	}

        .mo-h4 {
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-around;
        }
    	
        #mo-co2 {
            height: 60px;
        }

        #mo-co2>div {
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: space-around;
            color: #444444;
        }

        #mo-text {
            padding: 15px;
        }
        
        .btn-upload {
		  	width: 150px;
		  	height: 30px;
		  	background: #fff;
		  	border: 1px solid rgb(77,77,77);
		  	border-radius: 10px;
		  	font-weight: 500;
		  	cursor: pointer;
		  	display: flex;
		  	align-items: center;
		  	justify-content: center;
		  	&:hover {
		    	background: rgb(77,77,77);
		    	color: #fff;
		  	}
		}
		
		#mo-img-input {
		  	display: none;
		}
		
		#mo-img-input-area {
			display: flex;
			padding-left: 10px;
			align-items: center;
			height: 80px;
		}
		
		#mo-img-div {
			width: 50px;
			height: 50px;
 			margin: 10px 20px;
 			display: none;
 			border: 1px solid #e3e3e3;
 		}
		
		#mo-la {
			margin: 0;
		}
		
		#mo-img {
			width: 50px;
			height: 50px;	
		}
		
		.deletePo {
			opacity: 0.3;
		}
		
		#h-review-div {
			display: none;
		}
		
		input[type="radio"] {
		    appearance: none;
		    -webkit-appearance: none; /* Safari 및 Chrome 지원 */
		    -moz-appearance: none; /* Firefox 지원 */
		}
		
		.checkbox-input {
			display: none;
		}
		
		#checkbox-input1, #checkbox-input2, #checkbox-input3, #checkbox-input4, #checkbox-input5, #checkbox-input6 {
			display: none;
		}
		
		button:disabled {
			color: #ffffff;
			background: #ebebeb;
			cursor: default;
			border: none
		}
		

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<% int userNo = loginUser.getUserNo(); %>
	
	<div id="wrap">
        <div id="left-content">
            <div id="mypage-tit">
                <h2 id="tit">
                	<a href="<%= contextPath %>/mypage.me?uno=<%= userNo %>">마이페이지</a>
                </h2>
            </div>
            <div>
               <div>
                    <ul>
                        <li class="sub-title-li">
                            <h3 class="sub-title-h3">내정보</h3>
                            <ul>
                                <li class="sub-title-list">
                                    <a href="">회원정보 수정</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/review.me?uno=<%= userNo %>">거래 후기</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sub-title-li">
                            <h3 class="sub-title-h3">마이 쇼핑</h3>
                            <ul>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/likelist.me?uno=<%= userNo %>&cpage=1">찜한 상품</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/buylist.me?uno=<%= userNo %>&cpage=1">구매 내역</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/selllist.me?uno=<%= userNo %>&cpage=1">판매 내역</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
               </div>
            </div>
        </div>
        <div id="right-content">
            <div id="right-content-wrap">
                <div id="right-content-title">
                    구매 내역
                </div>

                <div id="right-content-search-area">
                    <div id="buy-list-search">
                        <input id="buysearchInput" type="text" id="search-input" placeholder="상품명을 입력해주세요." maxlength="20">
                    </div>
                    <div>
                        <button type="button" class="buy-list-search-btn" onclick="selectBtn(<%= userNo %>);">거래순</button>
                    </div>
                    <div>
                        <button type="button" class="buy-list-search-btn" onclick="selectPriceBtn(<%= userNo %>);">가격순</button>
                    </div>
                    
              	<script>
					// 검색창
					let uno = <%= userNo %>;
				    document.getElementById("buysearchInput").addEventListener("keyup", function(event) {
				        // 13은 Enter 키의 키코드입니다.
				        if (event.keyCode === 13) {
				            // 검색어 입력란의 값 가져오기
				            var word = document.getElementById("buysearchInput").value;
				            console.log(word);
				            // 검색어가 비어있지 않은 경우에만 이동
				            if (word.trim() !== "") {
				                // 새로운 URL 생성하여 페이지 이동
				            	location.href = "<%= contextPath %>/buyListSearch.me?search="+word+"&uno="+uno+"&cpage=1";
				            }
				        }
				    });
                
                	// 거래순 조회
                	function selectBtn(uno){
                		console.log(uno);
                		location.href = "<%= contextPath %>/buyListselect.me?&uno="+uno+"&cpage=1";
                	}
                	
                	// 가격순 조회
                	function selectPriceBtn(uno){
                		location.href = "<%= contextPath %>/buyListpriceselect.me?&uno="+uno+"&cpage=1";
                	}
                	
                </script>	
                    
                </div>

                <div id="right-content-buy-list-area">
                    <table>
                        <thead>
                            <tr id="thead-tr">
                                <th>구매일자</th>
                                <th>상품</th>
                                <th>금액</th>
                                <th>상태</th>
                                <th>이용후기</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% for(int i=0; i<list.size(); i++) { %>
	                            <tr>
	                                <td id="td-date"><%= list.get(i).getTradeDate() %></td>
	                                <td id="td-po">
	                                    <div>
	                                    	<% if(list.get(i).getUploadType().equals("Y")) { %>
		                                    	<div>
			                                        <% if(list.get(i).getTitleImg() != null) { %>
		                                    			<a href="<%= contextPath %>/detail.po?pno=<%= list.get(i).getProductNo() %>"><img class="titleImg" src="<%= contextPath %>/<%= list.get(i).getTitleImg() %>"></a>
		                                    		<% } else { %>
		                                    			<a href="<%= contextPath %>/detail.po?pno=<%= list.get(i).getProductNo() %>"><img class="titleImg" src="resources/images/no_img.png"></a>
	                                    			<% } %>
		                                    	</div>
		                                    	<div>
			                                        <a href="<%= contextPath %>/detail.po?pno=<%= list.get(i).getProductNo() %>"><%= list.get(i).getProductName() %></a>
		                                    	</div>
	                                    	<% } else { %>
	                                    		<div>
			                                        <% if(list.get(i).getTitleImg() != null) { %>
		                                    			<a href="#" onclick="deletePo(this);"><img class="titleImg deletePo" src="<%= contextPath %>/<%= list.get(i).getTitleImg() %>"></a>
		                                    		<% } else { %>
		                                    			<a href="#" onclick="deletePo(this);"><img class="titleImg deletePo" src="resources/images/no_img.png"></a>
	                                    			<% } %>
		                                    	</div>
		                                    	<div>
			                                        <a class="deletePo" href="#" onclick="deletePo(this);"><%= list.get(i).getProductName() %></a>
		                                    	</div>
	                                    	<% } %>
	                                    	
	                                    	<script>
	                                    	
	                                    		function deletePo(e){
	                                    			location.href = "";
	                                    			alert("삭제된 상품입니다.");
	                                    		}
	                                    	
	                                    	</script>
	                                    	
	                                    </div>
	                                </td>
	                                
	                                <td><%= list.get(i).getStrPrice() %>원</td>
	                                <td>
	                                    <div class="deliver-status"><%= list.get(i).getDeliveryStatus() %></div>
	                                    <button type="button" class="list-select-btn">배송조회</button>
	                                </td>
	                                <td>
	                                	<% if(list.get(i).getReviewStatus().equals("Y")) { %>
	                                    	<button type="button" class="list-select-btn" data-toggle="modal" data-target="#reviewModal" disabled>후기남기기</button>
                                		<% } else { %>
                                   			<button type="button" class="list-select-btn" data-toggle="modal" data-target="#reviewModal<%= i %>">후기남기기</button>
	                                	<% } %>

											<!-- 이용후기 모달 -->
							           		<div class="modal" id="reviewModal<%= i %>">
											  	<div class="modal-dialog modal-dialog-centered">
											    	<div class="modal-content">
											    	
											    	<script>
											    		
											    		// 모달이 닫히면 새로고침
											    		$('#reviewModal<%= i %>').on('hidden.bs.modal', function (e) {
											    		    location.reload();
											    		});
											    		
								                    	function openDiv(e){
															//console.log("오냐?");
															//console.log($(e).siblings("#h-review-div"));
															$(e).siblings("#h-review-div").css("display", "block");
 															//$(".h-review-div").css("display", "block"); // 이것도됨
															
								                    	}
								                    	
								                        // 이미지 클릭 시 input 클릭
								                        function chooseFile(ele){
								    						//console.log($(ele).parent().siblings().eq(0));
								    						$(ele).parent().siblings().eq(0).click();
								    					}
								                        
								    					// file type의 input에 onchange=loadImg 
								    					function loadImg(el){
								    						//console.log($(el).siblings().eq(1)); // img의 div
								    						// 파일을 읽어들이는 파일리더 객체 생성
								    						const reader = new FileReader();
								    						// id가 mo-img-input인 요소의 파일의 첫번째 파일
								    						const file = el.files[0];
								    						// 파일을 data URL로 반환
								    						reader.readAsDataURL(file);
								    						
								    						reader.onload = function(e) {
								    							// 파일 객체의 url 생성
								    							const imageUrl = URL.createObjectURL(file);
								    							console.log($(el).siblings().eq(1).children());
								    							$(".mo-img-div-cl").css("display", "block");
								    							$(el).siblings().eq(1).children().attr("src", e.target.result);
								    					    }
								    						
								    					}
								                    	
											    	</script>
												      	<!-- Modal Header -->
												     	<div class="modal-header" align="center">
												        	<h4 class="modal-title">후기 남기기</h4>
												        	<button type="button" class="close" data-dismiss="modal">&times;</button>
												      	</div>
												
												      	<!-- Modal body -->
												      	<div class="modal-body" align="center">
												        
												        	<form action="<%= contextPath %>/reviewForm.me?" method="post" id="review-form" enctype="multipart/form-data">
												        		<input type="hidden" name="pno" value="<%= list.get(i).getProductNo() %>">
												        		<input type="hidden" name="uno" value="<%= userNo %>">
												        		<input type="hidden" name="cpage" value="1">
												        
											                	<div class="mo-h4"><h4 style="margin:0px;"><%= list.get(i).getNickname() %>과의 거래에 만족하셨나요?</h4></div>
											                	<div class="rating mo-h4 divBlokc" onclick="openDiv(this);">
																	<h4 style="margin:0px;">
																		<fieldset class="rate">
											                                <input class="rating__star far fa-star" type="radio" id="rating5" name="rating" value="1"><label for="rating5"></label>
											                                <input class="rating__star far fa-star" type="radio" id="rating4" name="rating" value="2"><label for="rating4"></label>
											                                <input class="rating__star far fa-star" type="radio" id="rating3" name="rating" value="3"><label for="rating3"></label>
											                                <input class="rating__star far fa-star" type="radio" id="rating2" name="rating" value="4"><label for="rating2"></label>
											                                <input class="rating__star far fa-star" type="radio" id="rating1" name="rating" value="5"><label for="rating1"></label>
							                                                <input type="hidden" id="hidden-input-stars" value="">
											                            </fieldset>
																	</h4>
																</div>
																
																<div id="h-review-div" class="h-review-div" style="display:none">	
																	<div id="mo-co2">
																		<div><%=list.get(i).getNickname() %> 에게 후기를 남겨주세요.</div>
																		<div><small>해당하는 항목을 모두 골라주세요.</small></div>
																	</div>
																	<div id="se-review">
																		<div class="rv-checkbox" onclick="changeColor(this, 1);">
																			<input type="checkbox" id="checkbox-input1" name="R1" value="R1">친절하고 배려가 넘쳐요.
																		</div>
																		<div class="rv-checkbox" onclick="changeColor(this, 2);" value="2">
																			<input type="checkbox" id="checkbox-input2" name="R2" value="R2">포장이 깔끔해요.
																		</div>
																		<div class="rv-checkbox" onclick="changeColor(this, 3);" value="3">
																			<input type="checkbox" id="checkbox-input3" name="R3" value="R3">채팅 답변이 빨라요.
																		</div>
																		<div class="rv-checkbox" onclick="changeColor(this, 4);" value="4">
																			<input type="checkbox" id="checkbox-input4" name="R4" value="R4">상품 설명과 실제 상품이 동일해요.
																		</div>
																		<div class="rv-checkbox" onclick="changeColor(this, 5);" value="5">
																			<input type="checkbox" id="checkbox-input5" name="R5" value="R5">상품 정보가 자세히 적혀있어요.
																		</div>
																		<div class="rv-checkbox" onclick="changeColor(this, 6);" value="6">
																			<input type="checkbox" id="checkbox-input6" name="R6" value="R6">배송이 빨라요.
																		</div>
																	</div>
								
							                                        <div id="mo-img-input-area">
							                                            <label for="image" id="mo-la">
							                                            	<div class="btn-upload" onclick="chooseFile(this);">사진 올리기</div>
							                                            </label>
							                                            <input type="file" name="reviewImage" id="mo-img-input" onchange="loadImg(this);" value="#" required>
							                                            <div id="mo-img-div" class="mo-img-div-cl">
							                                            	<img id="mo-img" id="mo-img-cl" src="#">
							                                            </div>
							                                        </div>
								                                                      
																	<div>
																		<textarea id="mo-text" name="reviewContent" cols="40" rows="5" style="resize: none;" placeholder="소중한 후기를 남겨주세요." required></textarea>
																	</div>
											                	
											                		<div>
												                		<button type="submit" class="btn btn-sm btn-danger" onclick="reviewForm(this);">후기 보내기</button>
											                		</div>
											                	</div>
											      			</form>
												      	</div>
										    		</div>
											  	</div>
											</div>
	                                </td>
	                            </tr>
							<% } %>
                        </tbody>
                    </table>
                </div>
                

                
                <script>
										      	
                    const ratingStars = [...document.getElementsByClassName("rating__star")];
                    const ratingForm = document.getElementById("review-form"); // 별점을 포함한 평가 폼의 form 요소
                    const selectedStarsInput = document.getElementById("selectedStars");
                    
                    function executeRating(stars) {
                      	const starClassActive = "rating__star fas fa-star"; // 텅빈별
                      	const starClassInactive = "rating__star far fa-star"; // 색칠한별
                      	const starsLength = stars.length;
                      	let i;
                      
                      		stars.map((star) => {
                       		star.onclick = () => {
                          	i = stars.indexOf(star);

                          	if (star.className===starClassInactive) {
                            	for (i; i >= 0; --i) stars[i].className = starClassActive;
                          	} else {
                            	for (i; i < starsLength; ++i) stars[i].className = starClassInactive;
                          	}
                          
                       		};
                   		});
                   	}

                    executeRating(ratingStars);
                    
                    function changeColor(element) {
                        var input = element.querySelector('input[type="checkbox"]');
                        
                        // 체크박스의 선택 여부에 따라 처리
                        if (!input.checked) {
                            // 체크되지 않은 경우
                            element.style.backgroundColor = "rgb(44, 44, 44)";
                            element.style.color = "white";
                            input.checked = true; // 체크박스 선택
                        } else {
                            // 이미 체크된 경우
                            element.style.backgroundColor = "";
                            element.style.color = "black";
                            input.checked = false; // 체크박스 선택 해제
                        }
                    }
                    
                    function reviewForm(e){
                    	console.log($(e).parent().siblings().eq(2).children().eq(1));
                    	const moImgInput = $(e).parent().siblings().eq(2).children().eq(1);
                    	const moText = $(e).parent().siblings().eq(3).children();
                    	// checkValidity()는 required를 만족하는지 체크하는 메소드
                    	// input의 required가 만족하지않으면
                    	if(!moImgInput[0].files.length){
                    		alert("이미지를 등록해주세요.");
                    		return false;
                    	}  
                    	
                    	if(!moText.val().trim()){
                    		alert("후기를 입력해주세요.");
                    		return false;
                    	}
                    }
                    

					
                    </script>  
                
                <div class="paging-area" align="center">
                    <div>
                    	<% System.out.println("검색어 : " + request.getParameter("search")); %>
                    	<% if(request.getParameter("search") != null) { %>
	                        <% if(currentPage != 1) { %>
	                        	<% System.out.println("검색어가 널이 아니면 들어와야함"); %>
	                            <button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/buyListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
	                        <% } %>
	                        
	                        <% for(int p=startPage; p<=endPage; p++) { %>
	                            <% if(p == currentPage) { %>
	                                <button id="pageBtn_<%= p %>" disabled><%= p %></button>
	                            <% } else { %>
	                                <button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/buyListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
	                            <% } %>
	                        <% } %>
	                        
	                        <% if(currentPage != maxPage) { %>
	                            <button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/buyListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
	                        <% } %>
	                        
                        <% } else { %>
	                        	<% if(currentPage != 1) { %>
		                            <button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/buyllist.me?uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
		                        <% } %>
		                        
		                        <% for(int p=startPage; p<=endPage; p++) { %>
		                            <% if(p == currentPage) { %>
		                                <button id="pageBtn_<%= p %>" disabled><%= p %></button>
		                            <% } else { %>
		                                <button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/buylist.me?uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
		                            <% } %>
		                        <% } %>
		                        
		                        <% if(currentPage != maxPage) { %>
		                            <button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/buylist.me?uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
		                        <% } %>
	                    <% } %>
                        
                        
					</div>
		        </div>

                <script>
                    $(document).ready(function() {
                        // 현재 페이지에 해당하는 버튼에 active-page 클래스 추가
                        $('#pageBtn_<%= currentPage %>').addClass('active-page');
                    });
                </script>
                
            </div>
        </div>
    </div>	
	
	<%@ include file = "../common/footer.jsp" %>
	
</body>
</html>