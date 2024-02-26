<%@page import="com.cooltrade.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/cooltrade_ds.css">
<link rel="stylesheet" href="resources/css/cooltrade_cr.css">
</head>
<body>
	<%if (alertMsg!=null){ %>
	<script>
		alert("<%=alertMsg%>");
	</script>
	<% session.removeAttribute("alertMsg");%>
	<%} %>
	<div class="wrap">
        <!--Header 시작!-->
        <div id="header1" class="flex">
            <div id="header1-1" class="flex">
                <div id="headerLeft">
                    <button id="favoriteBtn">
                        <img src="resources/images/즐겨찾기.png" width="25" height="25" style="padding: 5px;" alt="즐겨찾기 이미지">
                        즐겨찾기
                    </button>
                </div>
                <div id="headerRight" class="flex">
                	<%if(loginUser==null){ %>
                	<!--case1. 로그인전-->
                    <div id="headerLogin" class="flex">
                        <button onclick="location.href ='<%=contextPath%>/loginForm.me'" id="loginBtn">로그인/회원가입</button>
                    </div>
                    <%}else{ %>
					<!-- case2. 로그인 후 -->
					<div id="headerLogin">
                        <button class="loginBtn" style="border-bottom: 1px solid rgb(238, 238, 238);">알림</button>
                        <button class="loginBtn" style="border-bottom: 1px solid rgb(238, 238, 238);">로그아웃</button>
                    </div>
                    <%} %>
                    <div id="headerStore" class="flex">
                        <a href="#" id="headerMyStore" class="flex">마이페이지</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="header2" class="flex">
            <div id="header2-1">
                <div id="headerSearch" class="flex">
                    <div id="logo">
                        <img src="resources/images/쿨거래 logo.png" alt="쿨거래 로고">
                    </div>
                    <div id="searchBar">
                        <div id="searchContainer" class="flex">
                            <input type="text" id="search" name="search" placeholder="상품명을 입력해주세요" maxlength="40">
                            <a id="searchImgContainer" href="#" class="flex">
                                <img id="searchImg" src="resources/images/돋보기.png" alt="돋보기 이미지">
                            </a>
                        </div>
                    </div>
                    <div id="chatSell" class="flex">
                        <div id="chatContainer">
                            <a href="" id="chat">
                                <img src="resources/images/말풍선.png" alt="말풍선 이미지">
                                채팅하기
                            </a>
                        </div>
                        <div id="sellContainer">
                            <a href="#" id="sell">
                                <img src="resources/images/sell.png" alt="판매하기 이미지">
                                판매하기
                            </a>
                        </div>
                    </div>
                </div>
                <div id="headerCategory" class="flex">
                    <div id="categoryMenu">
                        <img src="resources/images/카테고리.png" width="30" height="30" style="padding: 5px;" alt="카테고리 이미지">
                        카테고리
                    </div>
                    <div id="notice">
                        공지사항
                    </div>
                </div>
            </div>
            
            <div id="sidebarWrap">
                <div id="jjimWrap">
                    <div id="jjimText" class="flex">
                        관심상품
                    </div>
                    <a href="" id="jjimLink" class="flex">
                        <img src="resources/images/좋아요.png" width="25" height="25" style="padding: 5px;" alt="좋아요 이미지">
                    </a>
                </div>
                <div id="recentProduct">
                    <div id="recentTitle">최근본상품</div>
                    <div id="recentDotContainer" class="flex">
                        <div id="recentDottedBorder"></div>
                    </div>
                    <div id="recentSeenProduct">
                        <!-- <div id="seenEye"></div> -->
                        <div id="seenText">
                            최근 본<br>
                            상품이<br>
                            없습니다.
                        </div>
                    </div>
                </div>
                <div id="topContainer">
                    <button id="topBtn">TOP</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>