<%@page import="com.cooltrade.common.PageInfo"%>
<%@page import="com.cooltrade.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Product> recentList = (ArrayList<Product>)request.getAttribute("recentList");	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="flex-ds" style="align-items: center;">

	<div id="content-ds">
		<div style="position: relative;">
			<button id="banner-prev" onclick="prevBanner()"><</button>
			<div id="banner1-ds" class="flex-ds"
				style="justify-content: space-around; overflow: hidden;">
				<img id="bannerImg" style="width: 100%;"
					src="resources/images/banner_image_1.jpg">
			</div>
			<button id="banner-next" onclick="nextBanner()">></button>
		</div>
		<script>
			function nextBanner(){
				let currentImg= $("#bannerImg").attr('src');
				let nextImg;
				
				switch(currentImg){
					case "resources/images/banner_image_1.jpg":
			            nextImg = "resources/images/banner_watch.jpg";
			            break;
			        case "resources/images/banner_watch.jpg":
			            nextImg = "resources/images/electronics_banner_cooltrade.jpg";
			            break;
			        case "resources/images/electronics_banner_cooltrade.jpg":
			        	nextImg = "resources/images/luxurious_watch_banner.jpg";
			        	break;
			        case "resources/images/luxurious_watch_banner.jpg":
			        	nextImg = "resources/images/shoes_cooltrade_banner.jpg";
			        	break;
			        case "resources/images/shoes_cooltrade_banner.jpg":
			        	nextImg = "resources/images/clothes_model_cooltrade.jpg";
			        	break;
			        default:
			            nextImg = "resources/images/banner_image_1.jpg";
				}
				
				$("#bannerImg").attr('src', nextImg)
			}
			
			function prevBanner(){
				if($("#bannerImg").attr('src') == "resources/images/banner_image_1.jpg"){
					$("#bannerImg").attr('src',"resources/images/clothes_model_cooltrade.jpg");
				}else if($("#bannerImg").attr('src') == "resources/images/clothes_model_cooltrade.jpg"){
					$("#bannerImg").attr('src',"resources/images/shoes_cooltrade_banner.jpg");
				}else if($("#bannerImg").attr('src') == "resources/images/shoes_cooltrade_banner.jpg"){
					$("#bannerImg").attr('src',"resources/images/luxurious_watch_banner.jpg");
				}else if($("#bannerImg").attr('src') == "resources/images/luxurious_watch_banner.jpg"){
					$("#bannerImg").attr('src',"resources/images/electronics_banner_cooltrade.jpg");
				}else if($("#bannerImg").attr('src') == "resources/images/electronics_banner_cooltrade.jpg"){
					$("#bannerImg").attr('src',"resources/images/banner_watch.jpg") ;
				}else if($("#bannerImg").attr('src') == "resources/images/banner_watch.jpg"){
					$("#bannerImg").attr('src',"resources/images/banner_image_1.jpg");
				}
			}
		</script>
		<div id="banner2-ds" style="margin-bottom: 20px;">
			<h1>banner2</h1>
		</div>
		<div class="flex-ds" style="justify-content: space-between;">
			<h2>오늘의 상품추천</h2>
			<span style="color: gray" id="cpi"></span>
		</div>
		<div class="buttonContainer">
			<button id="prevButton"><</button>
			<div id="search_content_main-ds"></div>
			<button id="nextButton">></button>
		</div>
		<script>
			$(document).ready(function() {
			    let currentPage = 0; // 현재 페이지 인덱스
			    const itemsPerPage = 10; // 페이지 당 아이템 수
			    let maxPage;
			    let allData = {}; // 서버로부터 받아온 모든 데이터를 저장할 객체
	
			    // 슬라이더에 데이터를 렌더링하는 함수
			    function renderSlider(data) {
			        const slider = $("#search_content_main-ds");
			        slider.empty(); // 기존 내용을 비움
	
			        // 현재 페이지에 해당하는 아이템들만 표시
			        const startIndex = currentPage * itemsPerPage;
			        const endIndex = startIndex + itemsPerPage;
			        let plist = data.plist;
			        let imgList = data.imgList;
	
			        let slicedData = plist.slice(startIndex, endIndex);
			        slicedData.forEach(function(product) {
			            let img = imgList.find(img => img.refPno == product.productNo);
			            let imagePath = img ? img.imgPath + img.changeName : "resources/images/noImage.png";
			            let productHTML = '<div class="product_result_main-ds" style="border: 1px solid rgb(204, 204, 204); padding: 5px;">' +
			                '<a href="detail.po?pno=' + product.productNo + '" class="flex-ds show_detail-ds" style="flex-direction: column;">' +
			                '<div class="img_container_main-ds">' +
			                '<img src="' + imagePath + '" alt="" class="product_thumbnail_main-ds">' +
			                '</div>' +
			                '<div class="search_title_price_main-ds">' +
			                '<div class="search_ptitle_main-ds" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">' + product.productName + '</div>' +
			                '<div class="search_price_time_main-ds flex-ds" style="justify-content: space-between;">' +
			                '<div class="search_price_main-ds">' + product.price + '</div>' +
			                '<div id="search_time_main-ds">' + product.timeDiff + '</div>' +
			                '</div>' +
			                '</div>' +
			                '<div class="country_location_main-ds flex-ds" style="align-items: center; width: 192px; height: 40px;">' +
			                '<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">' +
			                product.zone +
			                '</div>' +
			                '</a>' +
			                '</div>';
			            slider.append(productHTML);
			        });
	
			        // 페이지 계산
			        maxPage = Math.ceil(plist.length / itemsPerPage) - 1;
			        updatePageIndicator();
			    }
	
			    // 페이지 지시자 업데이트
			    function updatePageIndicator() {
			        $("#cpi").text((currentPage + 1) + '/' + (maxPage + 1));
			    }
	
			    // 서버로부터 데이터를 불러오는 함수
			    function fetchSliderData() {
			        $.ajax({
			            url: "ajax.main", // 예시 URL
			            dataType: "json",
			            success: function(response) {
			                allData = response;
			                renderSlider(allData);
			            },
			            error: function() {
			                console.error("데이터를 불러오는 데 실패했습니다.");
			            }
			        });
			    }
	
			    // 이전 페이지 보기
			    $("#prevButton").click(function() {
			        if (currentPage > 0) {
			            currentPage--;
			        } else {
			            currentPage = maxPage;
			        }
			        renderSlider(allData);
			    });
	
			    // 다음 페이지 보기
			    $("#nextButton").click(function() {
			        if (currentPage < maxPage) {
			            currentPage++;
			        } else {
			            currentPage = 0;
			        }
			        renderSlider(allData);
			    });
	
			    fetchSliderData(); // 최초 데이터 로드 및 슬라이더 초기화
			});
		
		</script>

		<div class="flex-ds" style="justify-content: space-between;">
			<h2>최신 등록 상품</h2>
			<span style="color: gray" id="cpi2"></span>
		</div>
		<div class=buttonContainer>
			<button id="prevButton2"><</button>
			<div class="search_content_main2-ds"></div>
			<button id="nextButton2">></button>
		</div>
		<script>
			$(document).ready(function() {
			    let currentPage2 = 0; // 현재 페이지 인덱스
			    const itemsPerPage2 = 10; // 페이지 당 아이템 수
			    let maxPage2;
			    let allData2 = {}; // 서버로부터 받아온 모든 데이터를 저장할 객체
	
			    // 슬라이더에 데이터를 렌더링하는 함수
			    function renderSlider2(data) {
			        const slider2 = $(".search_content_main2-ds");
			        slider2.empty(); // 기존 내용을 비움
	
			        // 현재 페이지에 해당하는 아이템들만 표시
			        const startIndex2 = currentPage2 * itemsPerPage2;
			        const endIndex2 = startIndex2 + itemsPerPage2;
			        let plist2 = data.plist;
			        let imgList2 = data.imgList;
	
			        let slicedData2 = plist2.slice(startIndex2, endIndex2);
			        slicedData2.forEach(function(product) {
			            let img2 = imgList2.find(img => img.refPno == product.productNo);
			            let imagePath2 = img2 ? img2.imgPath + img2.changeName : "resources/images/noImage.png";
			            let productHTML = '<div class="product_result_main-ds"  style="border: 1px solid rgb(204, 204, 204); padding: 5px;">' +
			                '<a href="detail.po?pno=' + product.productNo + '" class="flex-ds show_detail-ds" style="flex-direction: column;">' +
			                '<div class="img_container_main-ds">' +
			                '<img src="' + imagePath2 + '" alt="" class="product_thumbnail_main-ds">' +
			                '</div>' +
			                '<div class="search_title_price_main-ds">' +
			                '<div class="search_ptitle_main-ds" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">' + product.productName + '</div>' +
			                '<div class="search_price_time_main-ds flex-ds" style="justify-content: space-between;">' +
			                '<div class="search_price_main-ds">' + product.price + '</div>' +
			                '<div id="search_time_main-ds">' + product.timeDiff + '</div>' +
			                '</div>' +
			                '</div>' +
			                '<div class="country_location_main-ds flex-ds" style="align-items: center; width: 192px; height: 40px;">' +
			                '<img src="https://cdn-icons-png.flaticon.com/512/535/535239.png" alt="위치 이미지" width="15" height="17" style="margin: 0px 10px;">' +
			                product.zone +
			                '</div>' +
			                '</a>' +
			                '</div>';
			            slider2.append(productHTML);
			        });
			        maxPage2 = Math.ceil(plist2.length / itemsPerPage2) - 1;
			        updatePageIndicator2();
			    }
	
			    function updatePageIndicator2() {
			        $("#cpi2").text((currentPage2 + 1) + '/' + (maxPage2 + 1));
			    }
	
			    // 서버로부터 데이터를 불러오는 함수
			    function fetchSliderData2() {
			        $.ajax({
			            url: "ajax.recent",
			            dataType: "json",
			            success: function(response) {
			                allData2 = response;
			                renderSlider2(allData2);
			            },
			            error: function() {
			                console.error("데이터를 불러오는 데 실패했습니다.");
			            }
			        });
			    }
	
			    // 이전 페이지 보기
			    $("#prevButton2").click(function() {
			        if (currentPage2 > 0) {
			            currentPage2--;
			        } else {
			            currentPage2 = maxPage2;
			        }
			        renderSlider2(allData2);
			    });
	
			    // 다음 페이지 보기
			    $("#nextButton2").click(function() {
			        if (currentPage2 < maxPage2) {
			            currentPage2++;
			        } else {
			            currentPage2 = 0;
			        }
			        renderSlider2(allData2);
			    });
	
			    fetchSliderData2(); // 최초 데이터 로드 및 슬라이더 초기화
			});
		
		</script>
	</div>
</body>
</html>