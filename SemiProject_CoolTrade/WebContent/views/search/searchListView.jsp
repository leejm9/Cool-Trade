<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%@ include file="../common/header.jsp" %> --%>
	<div id="content">

		<div class="category_table">
			<div class="category_header"><h3>카테고리</h3></div>
			<div class="category_list" class="flex">
				<div id="list1">
					<a href="">
						<div id="category_name1">패션의류</div>
						<div id="searched_items1">150</div>
					</a>
				</div>
				<div id="list2">
					<a href="">
						<div id="category_name2">패션잡화</div>
						<div id="searched_items2">100</div>
					</a>
				</div>
				<div id="list3">
					<a href="">
						<div id="category_name3">뷰티</div>
						<div id="searched_items3">1212</div>
					</a>
				</div>
				<div id="list4">
					<a href="">
						<div id="category_name4">전자제품</div>
						<div id="searched_items4">1212</div>
					</a>
				</div>
				<div id="list5">
					<a href="">
						<div id="category_name5">가구/인테리어</div>
						<div id="searched_items5">1212</div>
					</a>
				</div>
				<div id="list6">
					<a href="">
						<div id="category_name6">리빙/생활</div>
						<div id="searched_items6">1212</div>
					</a>
				</div>
				<div id="list7">
					<a href="">
						<div id="category_name7">반려동물</div>
						<div id="searched_items7">1212</div>
					</a>
				</div>
				<div id="list8">
					<a href="">
						<div id="category_name8">상품권</div>
						<div id="searched_items8">1212</div>
					</a>
				</div>
				<div id="list9">
					<a href="">
						<div id="category_name9">무료나눔</div>
						<div id="searched_items9">1212</div>
					</a>
				</div>
				<div id="list10">
					<a href="">
						<div id="category_name10">도서/음반/문구</div>
						<div id="searched_items10">0</div>
					</a>
				</div>
			</div>
		</div>
		<div id="search_header">
			<div>
				<span style="color: #04b4fc;">가방</span>의 검색결과 <span style="color: rgb(136 136 136);">123개</span>
			</div>
			<div>
				<a href="#" class="aline">정확도순</a>
				<a href="#" class="aline">최신순</a>
				<a href="#" class="aline">저가순</a>
				<a href="#">고가순</a>
			</div>
		</div>


		<!-- 검색결과가 있는 경우-->
		<div id="search_content">
			 <div class="product_result">
				<a href="#" class="flex show_detail" style="flex-direction: column;" >
					<div id="img_container">
						<img src="resources/images/사이트맵.png" alt="" id="product_thumbnail">
					</div>
					<div id="search_title_price">
						<div id="search_ptitle" class="hover_text">
							내가방
						</div>
						<div id="search_price_time" class="flex" style="justify-content: space-between;">
							<div id="search_price" class="hover_text">
								10000
							</div>
							<div id="search_time" class="hover_text">어제</div>	
						</div>
					</div>
					<div id="country_location" style="align-items: center;width: 192px;height: 40px;" class="flex hover_text">
						<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">
						어디든
					</div>
				</a>
			</div>
			 
		</div>

		<!-- 검색결과가 없는 경우 -->
<!-- 		<div id="no_match_container"> -->
<!-- 			<div id="no_match_text" class="flex"> -->
<!-- 				<div id="search_text"> -->
<!-- 					<div id="user_search_text" align="center"> -->
<!-- 						검색한 텍스트 -->
<!-- 					</div> -->
<!-- 					에 대한 검색결과가 없습니다. -->
<!-- 				</div> -->
<!-- 				<div id="search_advice"> -->
<!-- 					- 단어의 철자가 정확한지 확인해 보세요<br> -->
<!-- 					- 보다 일반적인 검색어로 다시 검색해 보세요<br> -->
<!-- 					- 검색어의 띄어쓰기를 다르게 해보세요<br> -->
<!-- 					- 유해/금지어가 아닌지 확인해주세요<br> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div id="recommend_products"> -->
<!-- 			<div id="simple_product_wrap"> -->
<!-- 				<div id="simple_img"></div> -->
<!-- 				<div id="simple_title"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<ul class="pagination" class="flex" style="justify-content: center; margin-bottom: 50px;">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</div>
					<script>
						$(function(){
							$(".show_detail").hover(function(){
								$(this).find(".hover_text").css({"color": "#04b4fc", "text-decoration":"none"});
							}, function(){
								$(this).find(".hover_text").css("color", "");
							});
						})
					</script>
</body>
</html>



