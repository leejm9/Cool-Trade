<%@page import="com.cooltrade.common.PageInfo"%>
<%@page import="com.cooltrade.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
	ArrayList<Product> recentList = (ArrayList<Product>)request.getAttribute("recentList");	

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int pagelimit = pi.getPageLimit();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<script> -->
// 		$(document).ready(function({
			
// 		}))
<!-- 	</script> -->
	<div id="content-ds">
        <div id="banner1-ds"><h1>banner1</h1></div>
        <div id="banner2-ds"><h1>banner2</h1></div>
        <h2>오늘의 상품추천</h2>
        <div id="search_content_main-ds"> 
        <%if(!plist.isEmpty()){ %>
        	<%for(Product p : plist){ %>
	            <div class="product_result_main-ds">
	                <a href="<%=contextPath%>/detail.po?pno=<%=p.getProductNo()%>" class="flex-ds show_detail-ds" style="flex-direction: column;" >
	                    <div class="img_container_main-ds">
	                        <img src="resources/images/home.png" alt="" class="product_thumbnail_main-ds">
	                    </div>
	                    <div class="search_title_price_main-ds">
	                        <div class="search_ptitle_main-ds" >
	                           <%=p.getProductName() %>
	                        </div>
	                        <div class="search_price_time_main-ds flex-ds" style="justify-content: space-between;">
	                            <div class="search_price_main-ds" >
	                                <%=p.getPrice()%>
	                            </div>
	                            <div id="search_time_main-ds"><%=p.getTimeDiff() %></div>	
	                        </div>
	                    </div>
	                    <div class="country_location_main-ds flex-ds" style="align-items: center;width: 192px;height: 40px;">
	                        <img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">
	                        <%=p.getZone()%>
	                    </div>
	                </a>
	            </div>
            <%} %>
        <%} %>
        </div>
		
        <ul class="pagination" class="flex-ds" style="justify-content: center; margin-bottom: 50px;">
     		<%if(startPage != 1){ %>
            <li class="page-item"><a class="page-link" href="#"></a></li>
            <%}%>
            <%for(int i = startPage; i<=endPage;i++){ %>
            	<%if(i == currentPage){ %>
           			<li class="page-item"><a class="page-link disabled" href="#"><%=i%></a></li>
            	<%}else{ %>
            		<li class="page-item"><a class="page-link" href="#"><%=i%></a></li>
            	<%} %>
            <%} %>
       		<%if(endPage != maxPage){ %>
            <li class="page-item"><a class="page-link" href="#">>></a></li>
            <%} %>
        </ul>

        <h2>최신 등록 상품</h2>
        <div class="search_content_main2-ds"> 
        	<%for(Product p : recentList){ %>
	            <div class="product_result_main2-ds">
	                <a href="#" class="flex-ds show_detail2-ds" style="flex-direction: column;" >
	                    <div class="img_container_main2-ds">
	                        <img src="resources/images/home.png" alt="" class="product_thumbnail_main2-ds">
	                    </div>
	                    <div class="search_title_price_main2-ds">
	                        <div class="search_ptitle_main2-ds" >
	                           <%=p.getProductName() %>
	                        </div>
	                        <div class="search_price_time_main2-ds flex-ds" style="justify-content: space-between;">
	                            <div class="search_price_main2-ds" >
	                                <%=p.getPrice()%>
	                            </div>
	                            <div id="search_time_main2-ds"><%=p.getTimeDiff() %></div>	
	                        </div>
	                    </div>
	                    <div class="country_location_main2-ds flex-ds" style="align-items: center;width: 192px;height: 40px;">
	                        <img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">
	                        <%=p.getZone()%>
	                    </div>
	                </a>
	            </div>
            <%} %>
        </div>
    </div>
</body>
</html>