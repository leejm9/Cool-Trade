<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Product> searchList = (ArrayList<Product>)request.getAttribute("searchList");
	ArrayList<Category> catList = (ArrayList<Category>)request.getAttribute("catList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="content-ds">

		<div class="category_table-ds">
			<div class="category_header-ds"><h3>카테고리</h3></div>
			<div class="category_list-ds flex-ds">
				<%for(Category c : catList) {%>
				<div class="cat-list-ds">
					<a href="#<%=c.getCategoryNo()%>">
						<div class="category_name-ds"><%=c.getCategoryName()%></div>
						<div class="searched_items-ds"><%=c.getCategoryCount()%></div>
					</a>
				</div>
				<%} %>
			</div>
		</div>
		<div id="search_header-ds">
			<div>
				<span style="color: #04b4fc;">가방</span>의 검색결과 <span style="color: rgb(136 136 136);">123개</span>
			</div>
			<div>
				<a href="#" class="aline-ds">정확도순</a>
				<a href="#" class="aline-ds">최신순</a>
				<a href="#" class="aline-ds">저가순</a>
				<a href="#">고가순</a>
			</div>
		</div>


		<!-- 검색결과가 있는 경우-->
		<div id="search_content-ds">
			 <div class="product_result-ds">
				<a href="#" class="flex-ds show_detail-ds" style="flex-direction: column;" >
					<div class="img_container-ds">
						<img src="resources/images/돋보기.png" alt="" class="product_thumbnail-ds">
					</div>
					<div class="search_title_price-ds">
						<div class="search_ptitle-ds">
							내가방
						</div>
						<div class="search_price_time-ds flex-ds" style="justify-content: space-between;">
							<div class="search_price-ds">
								10000
							</div>
							<div class="search_time-ds">어제</div>	
						</div>
					</div>
					<div class="country_location-ds flex-ds" style="align-items: center;width: 192px;height: 40px;">
						<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">
						어디든
					</div>
				</a>
			</div>
			 
		</div>

		<!-- 검색결과가 없는 경우 -->
<!-- 		<div id="no_match_container-ds"> -->
<!-- 			<div id="no_match_text-ds" class="flex-ds"> -->
<!-- 				<div id="search_text-ds"> -->
<!-- 					<div id="user_search_text-ds" align="center"> -->
<!-- 						검색한 텍스트 -->
<!-- 					</div> -->
<!-- 					에 대한 검색결과가 없습니다. -->
<!-- 				</div> -->
<!-- 				<div id="search_advice-ds"> -->
<!-- 					- 단어의 철자가 정확한지 확인해 보세요<br> -->
<!-- 					- 보다 일반적인 검색어로 다시 검색해 보세요<br> -->
<!-- 					- 검색어의 띄어쓰기를 다르게 해보세요<br> -->
<!-- 					- 유해/금지어가 아닌지 확인해주세요<br> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="recommend_products-ds"> -->
<!-- 			<div class="simple_product_wrap-ds"> -->
<!-- 				<div class="simple_img-ds"></div> -->
<!-- 				<div class="simple_title-ds"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<ul class="pagination" class="flex-ds" style="justify-content: center; margin-bottom: 50px;">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>



