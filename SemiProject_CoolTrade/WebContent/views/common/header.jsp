<%@page import="com.cooltrade.common.PageInfo"%>
<%@page import="com.cooltrade.product.model.vo.Product"%>
<%@page import="com.cooltrade.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
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
<title>쿨거래 중고거래 사이트</title>
<link rel="icon" sizes="16x16" type="image/png" href="resources/images/logo.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/cooltrade_ds.js"></script>
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
	<div class="wrap-ds">
        <!--Header 시작!-->
        <div id="header1-ds" class="flex-ds">
            <div id="header1-1-ds" class="flex-ds">
                <div id="headerLeft-ds">
                    <button id="favoriteBtn-ds">
                        <img src="resources/images/즐겨찾기.png" width="25" height="25" style="padding: 5px;" alt="즐겨찾기 이미지">
                        즐겨찾기
                    </button>
                </div>
                <div id="headerRight-ds" class="flex-ds">
                	<%if(loginUser==null){ %>
                	<!--case1. 로그인전-->
                    <div class="headerLogin-ds flex-ds" >
                        <button onclick="location.href ='<%=contextPath%>/loginForm.me'" id="loginBtn-ds" style="border-bottom: 1px solid rgb(238, 238, 238);">로그인/회원가입</button>
                    </div>
                    <%}else{ %>
					<!-- case2. 로그인 후 -->
					<div class="headerLogin-ds">
                        <button class="loginBtn-ds" style="border-bottom: 1px solid rgb(238, 238, 238);">알림</button>
                        <button class="loginBtn-ds" style="border-bottom: 1px solid rgb(238, 238, 238);" onclick="location.href='<%=contextPath%>/logout.me'">로그아웃</button>
                    </div>
                    
                    <div id="headerStore-ds" class="flex-ds">
                    	<% if(loginUser.getUserName().equals("관리자")) { %>
                        	<a href="<%= contextPath %>/manager.in" id="headerMyStore-ds" class="flex-ds">마이페이지</a>
                        <% }else{ %>
                        	<a href="<%= contextPath %>/mypage.me" id="headerMyStore-ds" class="flex-ds">마이페이지</a>
                        <% } %>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
        <div id="header2-ds" class="flex-ds">
            <div id="header2-1-ds">
                <div id="headerSearch-ds" class="flex-ds">
                    <div id="logo-ds">
                        <img src="resources/images/logo.png" alt="쿨거래 로고" onclick="location.href='<%=contextPath%>/onload.page'">
                    </div>
                    <div id="searchBar-ds">
                        <div id="searchContainer-ds" class="flex-ds">
                        <form id="searchForm-ds" class="flex-ds" action="<%=contextPath%>/search.po">
                            <input type="text" id="search-ds" name="search" placeholder="상품명을 입력해주세요" maxlength="40">
                            <button type="submit" style="border:none;" id="searchImgContainer-ds" class="flex-ds">
                                <img id="searchImg-ds" src="resources/images/돋보기.png" alt="돋보기 이미지">
                            </button>
                        </form>
                        </div>
                    </div>
                    <div id="chatSell-ds" class="flex-ds">
                        <div id="chatContainer-ds">
                            <a href="" id="chat-ds">
                                <img src="resources/images/말풍선.png" alt="말풍선 이미지">
                                채팅하기
                            </a>
                        </div>
                        <div id="sellContainer-ds">
							<% if(loginUser == null) { %>
								<a href="<%=contextPath%>/loginForm.me" class="sell-ds">
									<img src="resources/images/sell.png" alt="판매하기 이미지">
	                                판매하기
								</a>
							<% } else { %>                        
	                            <a href="<%= contextPath %>/sellForm.po" class="sell-ds">
	                                <img src="resources/images/sell.png" alt="판매하기 이미지">
	                                판매하기
	                            </a>
	                        <% } %>
                        </div>
                    </div>
                </div>
                <div id="headerCategory-ds" class="flex-ds">
                    <div class="category_wrap-ds">
                        <div id="categoryMenu-ds">
                            <img src="resources/images/카테고리.png" width="30" height="30" style="padding: 5px;" alt="카테고리 이미지">
                            카테고리
                            <br>
                        </div>
                        <div class="category_hover-ds flex-ds">
                            <a href="#">패션의류</a>
                            <a href="#">패션잡화</a>
                            <a href="#">뷰티</a>
                            <a href="#">전자제품</a>
                            <a href="#">리빙/생활</a>
                            <a href="#">가구/인테리어</a>
                            <a href="#">반려동물</a>
                            <a href="#">도서/음반/문구</a>
                            <a href="#">상품권</a>
                            <a href="#">무료나눔</a>
                        </div>
                    </div>
                    <div id="notice-ds">
                        공지사항
                    </div>
                </div>
            </div>
            
            <div id="sidebarWrap-ds">
                <div id="jjimWrap-ds">
                    <div id="jjimText-ds" class="flex-ds">
                        관심상품
                    </div>
                    <a href="" id="jjimLink-ds" class="flex-ds">
                        <img src="resources/images/좋아요.png" width="25" height="25" style="padding: 5px;" alt="좋아요 이미지">
                    </a>
                </div>
                <div id="recentProduct-ds">
                    <div id="recentTitle-ds">최근본상품</div>
                    <div id="recentDotContainer-ds" class="flex-ds">
                        <div id="recentDottedBorder-ds"></div>
                    </div>
                    <div id="recentSeenProduct-ds">
                        <div id="seenText-ds">
                            최근 본<br>
                            상품이<br>
                            없습니다.
                        </div>
                    </div>
                </div>
                <div id="topContainer-ds">
                    <button type="button" id="topBtn-ds">TOP</button>
                </div>
                <script>
                	$("#topBtn-ds").click(function(){
                		$('html, body').animate({scrollTop:0}, "fast");
                	})
                </script>
            </div>
        </div>
    </div>
</body>
</html>