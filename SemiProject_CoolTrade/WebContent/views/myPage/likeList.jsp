<%@page import="com.cooltrade.product.model.vo.LikeProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int likePoCount = (int)request.getAttribute("likePoCount");
	ArrayList<LikeProduct> list = (ArrayList<LikeProduct>)request.getAttribute("list");
	// 로그인한 회원번호, 좋아요한 상품 번호, 상품 이름, 가격, 시간, 이미지
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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

    #mypage-wrap {
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

    /* 오른쪽 컨텐츠 css */
    #right-content {
        width: 80%;
    }

    #right-content-wrap>div {
        padding: 10px 0px;
    }

    #right-content-title {
        font-size: 18px;
        font-weight: 700;
        width: 100%;
    }

    #like-product-count {
        font-size: 16px;
        border-bottom: 1px solid #e6e6e6;
        width: 100%;
    }

    #like-product-count>span {
        color: rgb(4, 180, 252);
    }

    .like-list-area {
        display: flex;
        justify-content: space-between;
        height: 50px;
        align-items: center;
        padding: 20px 0px;
    }

    #like-delete-select-box {
        display: flex;
        align-items: center;
        line-height: 100%;
    }

    .like-list-area button {
        border: none;
        background-color: transparent;
        width: 60px;
    }

    #like-delete-select-box button {
        width: 80px;
    }

    .like-list-div {
        border: 1px solid #e6e6e6;
        width: 100%;
        height: auto;
        /*padding: 10px;*/
        display: flex;
        align-items: center;
        position: relative;
    }

    .like-list-a {
        display: flex;
        align-items: center;
        width: 100%;
    }

    .like-list-a>div {
        /*padding: 0px 10px;*/
    }

    .like-list-area-wrap {
        display: grid;
        grid-template-columns: repeat(2,1fr);
        gap: 10px;
    }

    .like-list-checkbox-div {
        display: flex;
        align-items: center;
        position: absolute;
        right: 15px;
        top: 20px;
    }

    .like-product-price {
        display: flex;
    }

    .like-checkbox {
        position: relative;
        width: 25px;
        height: 25px;
        border: solid 1px #e6e6e6;
        cursor: pointer;
        right: 5px;
        top: -5px;
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

	.checkbox-label {
		display: block;
		position: relative;
		padding-left: 25px;
		margins-bottom: 10px;
		-webkit-user-select: none; 
		-moz-user-select: none; 
		-ms-user-select: none; 
		user-select: none;
		cursor: pointer;
	}
	
	/* 기본 체크박스 숨기기 */
	.checkbox-label input[type="checkbox"] {
		display: none;
	}
	
	/* 클릭안한 체크박스 스타일 */
	.on {
		width: 20px;
		height: 20px;
		background: #ddd;
		position: absolute;
		top: 0;
		left: 0;
	}
	
	/* 클릭한 체크박스 스타일 */
	.checkbox-label input[type="checkbox"]:checked + .on {
		background: #f86480;
	}
	
	.on::after {
		content: "";
		position: absolute;
		display: none;
	}
	
	.checkbox-label input[type="checkbox"]:checked + .on::after {
		display: block;
	}
	
	.on::after {
		width: 6px;
		height: 10px;
		border: solid #fff;
		border-width: 0 2px 2px 0;
		-webkit-transform: rotate(45deg);
		-ms-transform:rotate(45deg);
		transform: rotate(45deg);
		position: absolute;
		left: 7px;
		top: 3px;
	}
	
	.won {
		font-size: 14px;
    	line-height: 27px;
    	margin-left: 3px;
	}
	
	.timeDiff {
		font-size: 14px;
    	color: lightgray;
	}
	
	.like-po-detail {
		padding-left: 10px;
	}
	
	.like-po-image {
		border-right: 1px solid #e6e6e6;
	}

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<% int userNo = loginUser.getUserNo(); %>

    <div id="mypage-wrap">
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
                    찜한 상품
                </div>

                <div id="like-product-count">
                    찜
                    <span><%= likePoCount %></span>
                </div>

                <div>
                    <div class="like-list-area">
                        <div id="like-delete-select-box">
                            <div>
                                <button type="button" onclick="checkDelete(<%= userNo %>);">선택삭제</button>
                                <button type="button" onclick="allDelete(<%= userNo %>);">전체삭제</button>
                            </div>
                        </div>
                    </div>
                    <div id="like-list-area-container">
                        <div class="like-list-area-wrap">
               			<% for(int i=0; i<list.size(); i++) { %>
                            <div class="like-list-div">
                                <div class="like-list-checkbox-div">
                                    <label for="deleteCheck<%= i %>" class="checkbox-label">
                                    	<input type="checkbox" id="deleteCheck<%= i %>" onclick="likePoCheckbox(this, <%= list.get(i).getProductNo() %>);">
                                    	<span class="on"></span>
                                    </label>
                                </div>
                                <a href="<%= contextPath %>/detail.po?pno=<%= list.get(i).getProductNo() %>" class="like-list-a">
                                    <div class="like-po-image">
                                        <img src="<%= contextPath %>/<%= list.get(i).getTitleImg() %>" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div class="like-po-detail">
                                        <div><%= list.get(i).getProductName() %></div>
                                        <div class="like-product-price">
                                            <div><b><%= list.get(i).getStrPrice() %></b></div>
                                            <div class="won">원</div>
                                        </div>
                                        <div class="timeDiff">
                                            <%= list.get(i).getTimeDiff() %>
                                        </div>
                                    </div>
                                </a>
                            </div>
                		<% } %>    
                        </div>
                    </div>
                </div>
                
                <script>
                
               	let checkedBox = [];
               	
               	// 선택한 요소 배열에 담기
                function likePoCheckbox(e, pno){
                	//console.log(e.checked);
                	
               		if(e.checked) {
               			checkedBox.push(pno);
               		} else {
               			let index = checkedBox.indexOf(pno);
               			if(index !== -1) {
               				checkedBox.splice(index, 1);
               			}
               		}
					console.log(checkedBox);
					//return checkedBox;
				}
				
                // 선택삭제 이벤트
                function checkDelete(num){
                	console.log(checkedBox);
                	if(confirm("찜을 해제하시겠습니까?")){
	                	$.ajax({
                			url:"ajaxCheckDelete.me",
                			data:{
                				uno:num,
                				pno:checkedBox,
                			},
                			type:"post",
                			traditional: true,
                			success:function(result){
                				alert("찜이 해제되었습니다.");
                				location.reload();
                			}
                		})
                	} else {
                		console.log("취소");
                	}
                }
                
                // 전체삭제 이벤트
                function allDelete(num){
                	if(confirm("모든 찜을 해제하시겠습니까?")){
                		$.ajax({
                			url:"ajaxAllDelete.me",
                			data:{
                				uno:num,
                			},
                			type:"post",
                			success:function(result){
                				alert("모든 찜이 해제되었습니다.");
                				location.reload();
                			}
                		})
                	} else {
                		console.log("취소");
                	}
                }
                
                </script>
                
               	<div class="paging-area" align="center">
					<div>
						<% if(currentPage != 1) { %>
							<button id="pageBtn_<%= currentPage-1 %>" onclick="location.href='<%= contextPath %>/likelist.me?&uno=<%= userNo %>&cpage=<%= currentPage-1 %>'">&lt;</button>
						<% } %>
			
						<% for(int p=startPage; p<=endPage; p++) { %>
							<% if(p == currentPage) { %>
								<button id="pageBtn_<%= p %>" disabled><%= p %></button>
							<% } else { %>
								<button id="pageBtn_<%= p %>" onclick="location.href='<%= contextPath %>/likelist.me?&uno=<%= userNo %>&cpage=<%= p %>'"><%= p %></button>
							<% } %>
						<% } %>
			
						<% if(currentPage != maxPage) { %>
							<button id="pageBtn_<%= currentPage+1 %>" onclick="location.href='<%= contextPath %>/likelist.me?uno=<%= userNo %>&cpage=<%= currentPage+1 %>'">&gt;</button>
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