<%@page import="com.cooltrade.product.model.vo.LikeProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int likePoCount = (int)request.getAttribute("likePoCount");
	ArrayList<LikeProduct> list = (ArrayList<LikeProduct>)request.getAttribute("list");
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
        height: 150px;
        padding: 10px;
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
        padding: 0px 10px;
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

    .like-checkbox-checked {
        position: relative;
        width: 25px;
        height: 25px;
        border: solid 1px #e6e6e6;
        cursor: pointer;
        right: 5px;
        top: -5px;
        background: rgb(247, 47, 51);
        border: 1px solid rgb(247, 47, 51);
        transition: border 0.2s ease 0s, background-color 0.2s ease 0s;
    }

    .like-checkbox::before {
        content: "";
        position: absolute;
        bottom: 5px;
        left: 2px;
        border-width: 2px;
        border-style: solid;
        border-color: transparent rgb(204, 204, 204) rgb(204, 204, 204) transparent;
        width: 8px;
        height: 14px;
        transform: rotate(40deg);
        transform-origin: 100% 100%;
    }

    .like-checkbox::after {
        content: "";
        position: absolute;
        bottom: 5px;
        left: 2px;
        border-width: 2px;
        border-style: solid;
        border-color: transparent;
        width: 0px;
        height: 0px;
        transform: rotate(40deg);
        transform-origin: 100% 100%;
        transition: width 0.1s ease-out 0s, height 0.1s ease-out 0.1s;
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
                                <button>선택삭제</button>
                                <button>전체삭제</button>
                            </div>
                        </div>
                    </div>
                    <div id="like-list-area-container">
                        <div class="like-list-area-wrap">
                    	<% for(LikeProduct lp : list) { %>
                            <div class="like-list-div">
                                <div class="like-list-checkbox-div">
                                    <div class="like-checkbox like-checkbox-checked"></div>
                                </div>
                                <a href="<%= contextPath %>/detail.po?pno=<%= lp.getProductNo() %>" class="like-list-a">
                                    <div>
                                        <img src="<%= contextPath %>/<%= lp.getTitleImg() %>" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div><%= lp.getProductName() %></div>
                                        <div class="like-product-price">
                                            <div><%= lp.getStrPrice() %></div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            <%= lp.getTimeDiff() %>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        <% } %>    
                        </div>
                    </div>
                </div>
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