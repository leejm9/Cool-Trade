<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	// 상품번호, 상품제목, 가격, 쿨거래여부, 판매상태, 판매일자
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	String word = (String)request.getAttribute("word");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #right-content-wrap>div {
        padding: 10px 0px;
        width: 100%;
    }

    .right-content-title-btn {
        border: none;
        background-color: transparent;
        padding-right: 50px;
        font-size: 18px;
        font-weight: 700;
        cursor: pointer;
    }

    #right-content-title {
        display: flex;
    }

    #sell-list-search {
        display: flex;
        border: 1px solid #e6e6e6;
        width: 40%;
        height: 35px;
        padding: 0px 5px;
        align-items: center;
        background: white;
    }

    ::placeholder {
        color: #c2c2c2;
    }

    #sell-list-search>input {
        border: none;
        outline: none;
        width: 100%;
        font-size: 14px;
        padding: 0px 5px;
    }

    #right-content-search-area {
        display: flex;
        align-items: center;
        height: 70px;
    }

    #right-content-search-area>div {
        margin-right: 15px;
    }

    .sell-list-select-btn {
        border: none;
        background: none;
        font-size: 15px;
        font-weight: 700;
        cursor: pointer;
    }

    table {
        border-top: 2px solid #d6d6d6;
        border-bottom: 1px solid #e6e6e6;
        width: 100%;
        border-spacing: 10px;
        border-collapse: separate; /* 셀테두리가 별도로 표시되도록 설정 */
        border-collapse: collapse;
    }

    .func-btn {
        background-color: transparent;
        border: 1px solid #d6d6d6;
        height: 30px;
        width: 50px;
        border-radius: 5px;
        font-size: 13px;
        cursor: pointer;
        margin: 3px;
    }

    td {
        text-align: center;
        font-size: 14px;
        border: 1px solid #e6e6e6;
        padding: 10px 10px;
    }

    th {
        text-align: center;
    }

    select {
        border: 1px solid #e6e6e6;
        font-size: 15px;
        height: 30px;
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
    
    .titleImg {
    	width: 140px;
    	height: 140px;
    }
    
    #th-date {
     	width: 100px;
    }
    
    #th-price {
    	width: 60px;
    }
    
    #th-po {
    	width: 200px;
    }
    
    #th-status {
    	width: 90px;
    }
    
    #th-func {
    	width: 70px;
    }
    
    .th-oth {
    	width: 60px;
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
                                    <a href="<%= contextPath %>/infoedit.me">회원정보 수정</a>
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
                        <button type="button" class="right-content-title-btn">
                            판매 내역
                        </button>
                </div>
                
                <div id="right-content-search-area">
                    <div id="sell-list-search">
                        <input id="sellsearchInput" type="text" placeholder="상품명을 입력해주세요." maxlength="20">
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn" onclick="statusBtn(1, <%= userNo %>);">판매중</button>
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn" onclick="statusBtn(2, <%= userNo %>);">예약중</button>
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn" onclick="statusBtn(3, <%= userNo %>);">판매완료</button>
                    </div>
                </div>
                
                <script>
					// 검색창
					let uno = <%= userNo %>;
				    document.getElementById("sellsearchInput").addEventListener("keyup", function(event) {
				        // 13은 Enter 키의 키코드입니다.
				        if (event.keyCode === 13) {
				            // 검색어 입력란의 값 가져오기
				            var word = document.getElementById("sellsearchInput").value;
				            console.log(word);
				            // 검색어가 비어있지 않은 경우에만 이동
				            if (word.trim() !== "") {
				                // 새로운 URL 생성하여 페이지 이동
				            	location.href = "<%= contextPath %>/sellListSearch.me?search="+word+"&uno="+uno+"&cpage=1";
				            }
				        }
				    });
                
                	// 판매상태 조회
                	function statusBtn(num, uno){
                		console.log(num);
                		console.log(uno);
                		location.href = "<%= contextPath %>/sellListStatus.me?status="+num+"&uno="+uno+"&cpage=1";
                	}
                	
                </script>
                
                <div id="right-content-read">
                    <table>
                        <thead>
                            <tr id="thead-tr"> 
                                <th id="th-date">등록일자</th>
                                <th id="th-po">상품</th>
                                <th id="th-price">가격</th>
                                <th class="th-oth">찜</th>
                                <th class="th-oth">쿨거래</th>
                                <th id="th-status">판매상태</th>
                                <th id="th-func">기능</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                           	<% for(Product p : list) { %>
                            	<tr>
	                                <td><%= p.getUploadDate() %></td>
	                                <td>
	                                    <div>
	                                    	<div>
	                                    		<% if(p.getTitleImg() != null) { %>
	                                    			<a href="<%= contextPath %>/detail.po?pno=<%= p.getProductNo() %>"><img class="titleImg" src="<%= contextPath %>/<%= p.getTitleImg() %>"></a>
	                                    		<% } else { %>
	                                    			<a href="#"><img class="titleImg" src="resources/images/no_img.png"></a>
                                    			<% } %>
	                                    	</div>
	                                    	<div>
	                                    		<a href="<%= contextPath %>/detail.po?pno=<%= p.getProductNo() %>"><%= p.getProductName() %></a>
	                                    	</div>
	                                    </div>
	                                </td>
	                                
	                                <td class="td-price">
	                                	<%= p.getStrPrice() %>원
	                                </td>
	                                
	                                <td><%= p.getCount() %></td>
	                                	<% if(p.getTradeType() == 1) { %>
	                                		<td>X</td>
	                                	<% } else { %>
	                                		<td>O</td>
	                                	<% } %>
	                                
	                                <td>

                                        <% if(p.getSellStatus().equals("판매중")) { %>
                                        	<select name="sell-status" onchange="changeSel(this, <%= p.getProductNo() %>);">
		                                        <option value="판매중" selected>판매중</option>
		                                        <option value="예약중">예약중</option>
		                                        <option value="판매완료">판매완료</option>
	                                    	</select>
                                        <% } else if(p.getSellStatus().equals("예약중")) { %>
											<select name="sell-status" onchange="changeSel(this, <%= p.getProductNo() %>);">
		                                        <option value="판매중">판매중</option>
		                                        <option value="예약중" selected>예약중</option>
		                                        <option value="판매완료">판매완료</option>
	                                   	 </select>
										<% } else { %>
		                                    <select name="sell-status" onchange="changeSel(this, <%= p.getProductNo() %>);">
		                                        <option value="판매중">판매중</option>
		                                        <option value="예약중">예약중</option>
		                                        <option value="판매완료" selected>판매완료</option>
		                                    </select>
		                                <% } %>
                                    <script>
										// 판매상태 변경 ajax
                                    	function changeSel(op, num){
                                    		let option = op.value;
                                    		console.log(op, option, num);
                                    		$.ajax({
                                    			url:"ajaxselllist.me",
                                    			data:{
                                    					pno:num,
                                    					sellstatus:option
                                    			},
                                    			type:"post",
                                    			success:function(result){
                                    				alert("판매상태가 변경되었습니다.");
                                    			}
                                    		});
                                    	}
                                    </script>
                                    
	                                </td>

	                                <td>
	                                    <div>
	                                        <button type="button" class="func-btn" onclick="updateBtn(this, <%= p.getProductNo() %>);">수정</button>
	                                    </div>
	                                    <div>
	                                        <button type="button" class="func-btn" onclick="deleteBtn(<%= p.getProductNo() %>);">삭제</button>
	                                    </div>                                   
	                                </td>
	                                
                            	</tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                
                <div class="paging-area" align="center">
                    <div>
                    	<% if(request.getParameter("search") != null) { %>
	                        <% if(currentPage != 1) { %>
	                           		<button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/sellListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
	                        <% } %>
	                        <% for(int p=startPage; p<=endPage; p++) { %>
	                            	<% if(p == currentPage) { %>
		                                <button id="pageBtn_<%= p %>" disabled><%= p %></button>
		                            <% } else { %>
		                                <button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/sellListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
		                            <% } %>
	                        <% } %>
	                       	<% if(currentPage != maxPage) { %>
	                            <button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/sellListSearch.me?search=<%= request.getParameter("search") %>&uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
	                        <% } %>
	                        
                   		<% } else {%>  
                   		
                   			<% if(request.getParameter("status") != null) { %>
	                   			<% if(currentPage != 1) { %>
		                           		<button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/sellListStatus.me?status=<%= request.getParameter("status") %>&uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
		                        <% } %>
		                        <% for(int p=startPage; p<=endPage; p++) { %>
		                            	<% if(p == currentPage) { %>
			                                <button id="pageBtn_<%= p %>" disabled><%= p %></button>
			                            <% } else { %>
			                                <button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/sellListStatus.me?status=<%= request.getParameter("status") %>&uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
			                            <% } %>
		                        <% } %>
		                       	<% if(currentPage != maxPage) { %>
		                            <button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/sellListStatus.me?status=<%= request.getParameter("status") %>&uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
		                        <% } %>
		                        
	                      	<% } else { %>  
	                      		<% if(currentPage != 1) { %>
		                           		<button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/selllist.me?uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
		                        <% } %>
		                        <% for(int p=startPage; p<=endPage; p++) { %>
		                            	<% if(p == currentPage) { %>
			                                <button id="pageBtn_<%= p %>" disabled><%= p %></button>
			                            <% } else { %>
			                                <button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/selllist.me?uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
			                            <% } %>
		                        <% } %>
		                       	<% if(currentPage != maxPage) { %>
		                            <button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/selllist.me?uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
		                        <% } %>
	                      	<% } %>
	                      	
                   		<% } %>
					</div>
		        </div>
		        

                <script>

                    $(document).ready(function() {
                        // 현재 페이지에 해당하는 버튼에 active-page 클래스 추가
                        $('#pageBtn_<%= currentPage %>').addClass('active-page');
                    });
                    
                    // 수정하기 버튼 이벤트
                	function updateBtn(btn, num){
                		console.log(location.href);
                		console.log(num);
                		location.href = "<%= contextPath %>/updateSellForm.po?pno="+num;
                	}
                    
                    // 삭제하기 버튼 이벤트
                    function deleteBtn(num){
                    	console.log("d");
                    	if(confirm("상품을 삭제하시겠습니까?")){
	                    	$.ajax({
	                			url:"ajaxselldelete.me",
	                			data:{
	                					pno:num,
	                			},
	                			type:"post",
	                			success:function(result){
	                				alert("상품이 삭제되었습니다.");
	                				location.reload();
	                			}	
                			})
                		} else{
                			console.log("취소");
                		}
                   	}
                    
                </script>
		        
            </div>
        </div>
    </div>

	<%@ include file = "../common/footer.jsp" %>

</body>
</html>