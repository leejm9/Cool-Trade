<%@page import="com.cooltrade.product.model.vo.Images"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<Product> searchList = (ArrayList<Product>)request.getAttribute("searchList");
	ArrayList<Images> imgList = (ArrayList<Images>)request.getAttribute("imgList");
	ArrayList<Category> catList = (ArrayList<Category>)request.getAttribute("catList");
	int pCount = (int)request.getAttribute("pCount");
	String search = (String)request.getAttribute("search");
	String cno = (String)request.getAttribute("cno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="content-ds" align="center">
		<div class="category_table-ds">
			<div class="category_header-ds"><h3>카테고리</h3></div>
			<div class="category_list-ds flex-ds">
				<%for(Category c : catList) {%>
				<div class="cat-list-ds">
					<a href="<%=contextPath%>/search.po?cno=<%=c.getCategoryNo()%>">
						<div class="category_name-ds"><%=c.getCategoryName()%></div>
						<div class="searched_items-ds"><%=c.getCategoryCount()%></div>
					</a>
				</div>
				<%} %>
			</div>
		</div>
		<div id="search_header-ds">
			<div>
				<span style="color: #04b4fc;"><%=search%></span>의 검색결과 <span style="color: rgb(136 136 136);"><%=pCount%>개</span>
			</div>
			<div>
				<a onclick="productListOrder(1)" class="aline-ds">최신순</a>
				<a onclick="productListOrder(2)" class="aline-ds">저가순</a>
				<a onclick="productListOrder(3)">고가순</a>
			</div>
		</div>
	
		<script>
			function productListOrder(order){
				let search = '<%=search%>';
				let cno = '<%=cno%>';
				$.ajax({
					url: 'listOrder.po',
					data : {order : order,
							search: search,
							cno : cno},
					success : function(response){
						arrangeList(response);
					},
					error : function(){
						console.log("failed to load by order")
					}
				});
			}
			function arrangeList(data){
				let plist = data.plist;
				let imglist = data.imgList
				
				const productList = $("#search_content-ds");					
				productList.empty();
				
				plist.forEach(function(product){
					let img = imglist.find(i => i.refPno == product.productNo);
			        let imagePath = img ? img.imgPath + img.changeName : "resources/images/noImage.png";
			        let productHTML = '<div class="product_result-ds">'
			        				+ '<a href="<%=contextPath%>/detail.po?pno=' + product.productNo + '" class="flex-ds show_detail-ds" style="flex-direction: column;" >'
			        				+ '<div class="img_container-ds">'
			        				+ '<img src="' + imagePath + '" alt="" class="product_thumbnail-ds">'
			        				+ '</div>'
			        				+ '<div class="search_title_price-ds">'
			        				+ '<div class="search_ptitle-ds">'
									+ product.productName
									+ '</div>'
									+ '<div class="search_price_time-ds flex-ds" style="justify-content: space-between;">'
									+ '<div class="search_price-ds">'
									+ product.price
									+ '</div>'
									+ '<div class="search_time-ds">' + product.timeDiff + '</div>'	
									+ '</div>'
									+ '</div>'
									+ '<div class="country_location-ds flex-ds" style="align-items: center;width: 182px;height: 40px;">'
									+ '<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">'
									+ product.zone
									+ '</div>'
									+ '</a>'
									+ '</div>'
									+ '</div>';
									
					productList.append(productHTML);
				})
			}
			
		</script>


		<%if(searchList.size() != 0) {%>
		<!-- 검색결과가 있는 경우-->
		<div id="search_content-ds">
		<%for(int i = 0; i < searchList.size(); i++){ %>
			 <div class="product_result-ds">
				<a href="<%=contextPath%>/detail.po?pno=<%=searchList.get(i).getProductNo()%>" class="flex-ds show_detail-ds" style="flex-direction: column;" >
					<div class="img_container-ds">
						<img src="<%=imgList.get(i).getImgPath()+imgList.get(i).getChangeName() %>" alt="" class="product_thumbnail-ds">
					</div>
					<div class="search_title_price-ds">
						<div class="search_ptitle-ds">
							<%=searchList.get(i).getProductName()%>
						</div>
						<div class="search_price_time-ds flex-ds" style="justify-content: space-between;">
							<div class="search_price-ds">
								<%=searchList.get(i).getPrice()%>
							</div>
							<div class="search_time-ds"><%=searchList.get(i).getTimeDiff() %></div>	
						</div>
					</div>
					<div class="country_location-ds flex-ds" style="align-items: center;width: 182px;height: 40px;">
						<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">
						<%=searchList.get(i).getZone()%>
					</div>
				</a>
			</div>
			 <%} %>
		</div>
		<%}else{ %>
		<!-- 검색결과가 없는 경우 -->
		<div id="no_match_container-ds">
			<div id="no_match_text-ds" class="flex-ds" align="center">
				<div id="search_text-ds">
					<div id="user_search_text-ds" align="center">
						검색한 텍스트
					</div>
					<span style="color:hotpink"><%=search%></span>에 대한 검색결과가 없습니다.
				</div>
				<div id="search_advice-ds">
					- 단어의 철자가 정확한지 확인해 보세요<br>
					- 보다 일반적인 검색어로 다시 검색해 보세요<br>
					- 검색어의 띄어쓰기를 다르게 해보세요<br>
					- 유해/금지어가 아닌지 확인해주세요<br>
				</div>
			</div>
		</div>
		<div class="recommend_products-ds">
			<div class="simple_product_wrap-ds">
				<div class="simple_img-ds"></div>
				<div class="simple_title-ds"></div>
			</div>
		</div>
		<%}%>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>



