<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
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

    .flex-class {
        display: flex;
    }

    div {
        /* border: 1px solid red; */
    }

    #wrap {
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 180px;
        padding-top: 20px;
        position: relative;
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

    .redColor {
        color: red;
    }

    #right-content-main>div {
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

    .sell-section-title {
        display: flex;
        height: 80px;
        align-items: center;
        border-bottom: 2px solid;
    }

    .sell-section-title-h2 {
        font-size: 18px;
        font-weight: 700;
        padding-right: 20px;
        margin: 0px;
    }

    .sell-section-title-div {
        font-size: 12px;
        color: red;
    }

    #sell-section-wrap>div {
        border-bottom: 1px solid #e6e6e6;
        width: 100%;
        padding: 30px 0px;
    }  

    #fileInput {
        display: none;
    }

    #fileInput-div>img {
        width: 160px;
        height: 160px;
    }

    .hidden-div {
        width: 160px;
        height: 160px;
        /* border: 1px solid #cfcfcf; */
        display: block;
        position: relative;
    }
    
    .hidden-img {
    	width: 160px;
    	height: 160px;
        border: 1px solid #cfcfcf;
        /* display: none; */
    }

    .hidden-btn {
        width: 25px;
        height: 25px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: 11px 11px;
        background-image: url("resources/images/closeBtn.png");
        background-color: rgb(25, 25, 25);
        opacity: 0.3;
        border-radius: 50%;
        /*
        border: none;
        background-color: transparent;
        */
        position: absolute;
        top: 10px;
        right: 10px;
    }

    #sell-fileInput-div {
        height: auto;
        width: 75%;
        display: grid;
        grid-template-columns: repeat(3,1fr);
        gap: 10px;
    }

    #fileInput-div {
        height: 160px;
        width: 100%;
    }

    #fileImg {
        cursor: pointer;
        /* border: 1px solid #e6e6e6; */
    }

    #sell-section-img {
        width: 100%;
    }

    #sell-section-img-title {
        width: 25%;
    }
    #sell-section-product-name-title {
        width: 25%;
    }

    #sell-section-product-name-input {
        width: 75%;
        display: flex;
        align-items: center;
    }

    #sell-section-product-name-input-area {
        width: 85%;
        padding: 0px 10px;
        border: 1px solid #c2c2c2;
        height: 40px;
        background: white;
    }

    #sell-section-product-name-input-limit {
        width: 15%;
        padding: 0px 20px;
    }

    #sell-section-product-name-input-area>input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
    }

    ::placeholder {
        color: #c2c2c2;
    }

    #sell-section-category-title {
        width: 25%;
    }

    #sell-section-category-select {
        width: 75%;
        height: 250px;
    }

    #sell-section-category-select-list {
        height: 80%;
        width: 40%;
        border: 1px solid #c2c2c2;
        overflow-y: auto;
        padding: 0.5rem 0px;
    }

    #sell-section-category-select-list::-webkit-scrollbar {
        width: 8px;
    }

    #sell-section-category-select-list::-webkit-scrollbar-thumb {
        background-color: #c2c2c2;
        border-radius: 10px;
    }

    li>div {
        border: none;
        background-color: transparent;
        width: 100%;
        height: 30px;
        text-align: justify;
        padding: 0px 15px;
        cursor: pointer;
    }

    li>div:hover {
        background-color: #e3e3e3;
    }

    #sell-section-category-select-input {
        height: 20%;
        display: flex;
        align-items: center;
    }

    #sell-section-category-select-input>div {
        padding-right: 10px;
    }

    #sell-section-product-status-select {
        display: flex;
        flex-direction: column;
    }

    #sell-section-product-status {
        display: flex;
        width: 100%;
    }

    #sell-section-product-status-title {
        width: 25%;
    }

    #sell-section-product-status-select {
        width: 75%;
    }

    label {
        margin: 0;
    }

    #sell-section-product-status-select label {
        padding: 0px 15px 0px 5px;
    }

    #sell-section-product-status-select>div {
        display: flex;
        width: 100%;
        height: 30px;
        line-height: 215%;
        padding-right: 20px;
    }

    .product-status-select-span {
        font-size: 13px;
        line-height: 260%;
        color: #c2c2c2;
        font-weight: 10;
    }

    #sell-section-product-price-title {
        width: 25%;
    }

    #sell-section-product-price-input {
        width: 75%;
    }

    #product-price-input {
        width: 300px;
        padding: 0px 10px;
        border: 1px solid #c2c2c2;
        height: 40px;
        display: flex;
        background: white;
    }

    #product-price-input>input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
    }

    #product-price-input>span {
        transform: translateY(20%);
        color: rgb(153, 153, 153);
    }

    #product-price-offer {
        height: 40px;
        padding-top: 5px;
        display: flex;
        align-items: center;
    }

    #product-price-offer>* {
        height: 100%;
        line-height: 240%;
    }

    #product-price-offer>label {
        padding-left: 5px;
    }

    #sell-section-delivery-charge-title {
        width: 25%;
    }

    #sell-section-delivery-charge-select {
        width: 75%;
        display: flex;
    }

    #delivery-charge-include-area,  #delivery-charge-none-area {
        width: 20%;
    }

    #sell-section-content-title {
        width: 25%;
    }

    #sell-section-content-input {
        width: 75%;
    }

    textarea {
        width: 100%;
        padding: 10px 15px;
        resize: none;
    }

    #sell-section-content-input>div {
        display: flex;
        justify-content: flex-end;
    }

    #sell-section-tag {
        display: flex;
    }

    #sell-section-tag-title {
        width: 25%;
    }

    #sell-section-tag-area {
        width: 75%;
    }

    p {
        margin: 0;
    }

    #product-tag-input {
        width: 100%;
        height: 40px;
        padding: 0px 10px;
        border: 1px solid #858585;
        background: white;
    }

    #product-tag-input>input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
    }

    #product-tag-ul p {
        font-size: 13px;
        color: #c2c2c2;
        font-weight: 10;
        height: 25px;
        line-height: 250%;
    }

    #product-tag-ul {
        padding-top: 10px;
        margin: 0;
    }

    #sell-section-count-title {
        width: 25%;
    }

    #product-count-input {
        width: 300px;
        padding: 0px 10px;
        border: 1px solid #c2c2c2;
        height: 40px;
        display: flex;
        background: white;
    }

    #product-count-input>input {
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
    }

    #product-count-input>span {
        transform: translateY(20%);
        color: rgb(153, 153, 153);
    }

    #sell-section-zone-title {
        width: 25%;
    }

    #trade-zone {
        width: 100px;
        padding: 0px 10px;
        border: 1px solid #c2c2c2;
        height: 40px;
    }
    
    #cool-trade-option-title {
        width: 25%;
    }

    #cool-trade-option-ex {
        width: 75%;
    }

    #cool-trade-option {
        width: 100%;
        padding: 30px 0px;
    }

    #use-agreement {
        padding-top: 20px;
    }

    #use-agreement>ul {
        border: 1px solid #e3e3e3;
        width: 100%;
        padding: 10px;
    }

    #use-agreement li {
        padding: 5px 0px;
    }

    #cool-trade-btn-title {
        padding-left: 7px;
    }

    #cool-trade-btn input {
        align-items: center;
    }

    #footer-content-cr {
        width: 100%;
        background-color: rgb(223, 223, 223);
    }

    #footer-content-div {
        width: 1000px;
        height: 88px;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 14px;
        margin: auto;
    }

    #save, #enroll {
        border: 1px solid rgb(229, 229, 229);
        background-color: rgb(255, 255, 255);
        color: rgb(102, 102, 102);
        font-size: 20px;
        height: 55px;
        width: 160px;
        border-radius: 4px;
    }

    #enroll {
        background-color: rgb(4, 180, 252);
        color: white;
    }

    #sell-enroll-form {
        width: 100%;
    }
    
    input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	
	.hidden-file-input {
		display: none;
	}

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<% int userNo = loginUser.getUserNo(); %>
	<% double ondo = loginUser.getOndo(); %>
	

    <%-- <form action="<%= contextPath %>/sellinsert.po" method="post" id="sell-enroll-form" enctype="multipart/form-data"> --%>
    <input type="hidden" name="seller" value="<%= userNo %>">
        <div id="wrap" style="margin-top: 180px;">
            <div id="main-content" class="flex-class">
                <div id="right-content">
                    <div id="right-content-main">
                        <div class="sell-section-title">
                            <h2 class="sell-section-title-h2">기본정보</h2>
                            <div class="sell-section-title-div">* 필수항목</div>
                        </div>
                        <div>
                            <div id="sell-section-wrap">

                                <div id="sell-section-img" class="flex-class">
                                    <div id="sell-section-img-title">
                                        상품이미지
                                        <span class="redColor">*</span>
                                        <div id="imgCount">(0/5)</div>
                                    </div>
                                    <div id="sell-fileInput-div">
                                    
                                        <div id="fileInput-div">
                                            <input type="file" id="fileInput" accept="image/*" name="files" multiple required>
                                            <img src="resources/images/이미지등록.jpg" alt="상품이미지 등록 버튼" id="fileImg" onclick="uploadAction();">
                                        </div>
										
                                    </div>
                                </div>

                                <script>
                                    
                                    // 이미지를 담을 배열
                                    let sel_files = [];
                                    
                                    // 페이지가 시작되면 fileInput 요소에 Change 이벤트 설정
                                    $(document).ready(function(){
                                    	$("#fileInput").on("change", handleImgFileSelect);
                                    });
                                    
                                    function uploadAction(){
                                    	$("#fileInput").trigger("click");
                                    }
                                    
                                    function handleImgFileSelect(e){
                                    	// 이미지 정보 초기화
                                    	//sel_files = [];
                                    	let files = e.target.files;
                                    	let filesArr = Array.prototype.slice.call(files);
                                    	
                                        // 현재 선택된 이미지 개수 확인
                                        let currentImageCount = sel_files.length;
                                        let remainingImageCount = 5 - currentImageCount;

                                        // 파일 개수가 5개 이상인 경우 추가하지 않음
                                        if (filesArr.length > remainingImageCount) {
                                            alert("이미지는 최대 5개까지 업로드 가능합니다.");
                                            return;
                                        }
                                    	
                                    	filesArr.forEach(function(f){
                                    	
                                    		sel_files.push(f);
                                    		console.log(sel_files);
                                    		
                                    		let reader = new FileReader();
                                    		reader.onload = function(e){
                                    			let index = sel_files.length;
	                               				let html = "<div class=\"hidden-div\" id=\"hidden-div-id-"+index+"\">"+
			                                            		"<img src=\""+e.target.result+"\" class=\"hidden-img\">"+
			                                            		"<button type=\"button\" class=\"hidden-btn\" onclick=\"deleteBtn(this, "+index+");\"></button>"+
			                                        		"</div>";
	                                   			$("#sell-fileInput-div").append(html);
	                                   			$("#imgCount").html("(" + sel_files.length + "/5)");
                                   			
                                    		}
											reader.readAsDataURL(f);                        		
                                    	}) 
                                    }
                                    
                                    function deleteBtn(e, index){
                                    	//console.log(e);
                                        
                                        let $imgDiv = $(e).closest('.hidden-div'); // 현재 클릭된 이미지의 부모 div 요소를 선택
                                        console.log("div인덱스 : " + $($imgDiv).index());
                                        
                                        // 배열에서 해당 인덱스의 이미지 제거
									    let indexToRemove = $($imgDiv).index(); // div의 인덱스
									    sel_files.splice(indexToRemove - 1, 1);
									    
									    // 선택한 div 삭제
									    $imgDiv.remove();
									    
                                    	console.log(sel_files);
                                    	$("#imgCount").html("(" + sel_files.length + "/5)");
                                    }
	                                    
                                </script>

                                <div id="sell-section-product-name" class="flex-class">
                                    <div id="sell-section-product-name-title">
                                        상품명
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-name-input">
                                        <div id="sell-section-product-name-input-area">
                                            <input id="titleInput" type="text" maxlength="40" placeholder="상품명을 입력해주세요." name="title" required>
                                        </div>
                                        <div id="sell-section-product-name-input-limit">
                                            0/40
                                        </div>
                                    </div>
                                </div>
                                
                                <script>
                                	let poName = null;	
                                
	                                $(function(){
	                                    $("#titleInput").on("input", function() {
	                                        var length = $(this).val().length;
	                                        $("#sell-section-product-name-input-limit").text(length + "/40");
			                                poName = $("#titleInput").val();
	                                    });
	                                });
	                                
	                                
	                                
                                </script>

                                <div id="sell-section-category" class="flex-class">
                                    <div id="sell-section-category-title">
                                        카테고리
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-category-select">
                                    	<input type="hidden" id="categoryTest" name="category">
                                        <div id="sell-section-category-select-list" value="category">
                                            <ul>
                                                <% for(Category c : list) { %>
                                                    <li>
                                                        <div class="test"><%= c.getCategoryName() %></div>
                                                        <input type="hidden" id="select-category"  value="<%= c.getCategoryNo() %>" required>
                                                    </li>
                                                <% } %>
                                            </ul>
                                        </div>
                                        <div id="sell-section-category-select-input">
                                            <div>선택한 카테고리 :</div>
                                            <div id="select-category-name"></div>
                                        </div>
                                    </div>
                                </div>

                                <script>  
                                    
                                    document.addEventListener('DOMContentLoaded', function() {
                                    	
                                        var selectButtons = document.querySelectorAll('.test');
                                        var categoryNameDisplay = document.getElementById('select-category-name');
                                        var categoryVal = document.getElementById("select-category").value;
                                        var categoryTest = document.getElementById("categoryTest");
                                        
                                        // 각 버튼에 클릭 이벤트 리스너 추가
                                        selectButtons.forEach(function(button) {
                                            button.addEventListener('click', function() {
                                            	//console.log(this.nextElementSibling.value)
                                            	categoryTest.value = this.nextElementSibling.value;
                                            	//console.log(categoryTest);
                                                var categoryName = this.innerHTML; // 클릭된 버튼의 값(카테고리 닉네임)
                                                var categoryNoInput = this.nextElementSibling; // 클릭된 버튼 다음에 있는 숨겨진 input 요소
                                                var categoryNo = categoryNoInput.value; // 숨겨진 input 요소의 값(카테고리 번호)
                                                
                                                
                                                // 선택한 카테고리 닉네임을 select-category-name div에 표시
                                                //console.log(categoryNo);
                                                //console.log(categoryName);
                                                categoryVal.value = categoryNo;
                                                categoryNameDisplay.textContent = categoryName;
                                                
                                            });
                                        });
                                    });
                                    
                                </script>

                                <div id="sell-section-product-status">
                                    <div id="sell-section-product-status-title">
                                        상품상태
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-status-select">
                                        <div>
                                            <input id="new-product" type="radio" value="PS1" name="status" required>
                                            <label for="new-product" class="product-status-label">새 상품(미사용)</label>
                                            <span class="product-status-select-span">사용하지 않은 새 상품</span>                              
                                        </div>                                 
                                        <div>
                                            <input id="no-use" type="radio" value="PS2" name="status" required>
                                            <label for="no-use" class="product-status-label">사용감 없음</label>
                                            <span class="product-status-select-span">사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음</span>                              
                                        </div> 
                                        <div>
                                            <input id="less-use" type="radio" value="PS3" name="status" required>
                                            <label for="less-use" class="product-status-label">사용감 적음</label>
                                            <span class="product-status-select-span">눈에 띄는 흔적이나 얼룩이 약간 있음</span>                              
                                        </div> 
                                        <div>
                                            <input id="useful" type="radio" value="PS4" name="status" required>
                                            <label for="useful" class="product-status-label">사용감 많음</label>
                                            <span class="product-status-select-span">눈에 띄는 흔적이나 얼룩이 많이 있음</span>                              
                                        </div> 
                                        <div>
                                            <input id="broken-product" type="radio" value="PS5" name="status" required>
                                            <label for="broken-product" class="product-status-label">고장/파손 상품</label>
                                            <span class="product-status-select-span">기능 이상이나 외관 손상 등으로 수리/수선 필요</span>                              
                                        </div>                        
                                    </div>
                                </div>
                                
                                <div id="sell-section-product-price" class="flex-class">
                                    <div id="sell-section-product-price-title">
                                        가격
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-price-input">
                                        <div id="product-price-input">
                                            <input id="numberInput" type="text" placeholder="가격을 입력해 주세요." maxlength="15" name="price" required>
                                            <span>원</span>
                                        </div>
                                    </div>
                                </div>
                                
                                <script>
                                
	                                document.getElementById('numberInput').addEventListener('input', function(event) {
	                                    // 입력된 값
	                                    let inputValue = this.value;
	
	                                    // 입력된 값이 숫자가 아닌 경우
	                                    if (!(/^\d*$/).test(inputValue)) {
	                                        // 숫자가 아닌 입력을 제거
	                                        this.value = inputValue.replace(/[^\d]/g, '');
	                                    }
	                                });
                                	
									document.getElementById('numberInput').addEventListener('input', function() {
									    // 입력된 값을 가져옴
									    var value = this.value.replace(/,/g, ''); // 기존에 입력된 쉼표 제거
									    // 천 단위마다 쉼표 추가
									    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									    // 입력된 값을 다시 입력 상자에 설정
									    this.value = value;
									});
									
								</script>

                                <div id="sell-section-delivery-charge" class="flex-class">
                                    <div id="sell-section-delivery-charge-title">
                                        배송비
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-delivery-charge-select">
                                        <div id="delivery-charge-include-area">
                                            <input type="radio" id="delivery-charge-include" name="deliveryCharge" value=1 required>
                                            <label for="delivery-charge-include">배송비포함</label>
                                        </div>
                                        <div id="delivery-charge-none-area">
                                            <input type="radio" id="delivery-charge-none" name="deliveryCharge" value=2 required>
                                            <label for="delivery-charge-none">배송비별도</label>
                                        </div>
                                    </div>
                                </div>

                                <div id="sell-section-content" class="flex-class">
                                    <div id="sell-section-content-title">
                                        설명
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-content-input">
                                        <textarea id="contentInput" rows="6" name="content" style="resize:none;" maxlength="2000" required></textarea>
                                        <div id="cotentInput-div">0/2000</div>
                                    </div>
                                </div>
                                
                                <script>
                                	
	                                $(function(){
	                                    $("#contentInput").on("input", function() {
	                                        var contentLength = $(this).val().length;
	                                        
	                                        $("#cotentInput-div").text(contentLength + "/2000");
	                                    });
	                                });
                                
                                </script>

                                <div class="flex-class">
                                    <div id="sell-section-count-title">
                                        수량
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="product-count-input">
                                        <input id="numberInput2" type="text" placeholder="1" maxlength="10" name="pieces" required>
                                        <span>개</span>
                                    </div>
                                </div>
                                
                                <script>
                                
	                                document.getElementById('numberInput2').addEventListener('input', function(event) {
	                                    // 입력된 값
	                                    let inputValue2 = this.value;
	
	                                    // 입력된 값이 숫자가 아닌 경우
	                                    if (!(/^\d*$/).test(inputValue2)) {
	                                        // 숫자가 아닌 입력을 제거
	                                        this.value = inputValue2.replace(/[^\d]/g, '');
	                                    }
	                                });
	                            	
									document.getElementById('numberInput2').addEventListener('input', function() {
									    // 입력된 값을 가져옴
									    var value2 = this.value.replace(/,/g, ''); // 기존에 입력된 쉼표 제거
									    // 천 단위마다 쉼표 추가
									    value2 = value2.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									    // 입력된 값을 다시 입력 상자에 설정
									    this.value = value2;
									});
                                
                                </script>

                                <div class="flex-class">
                                    <div id="sell-section-zone-title">
                                        거래지역
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="trade-zone-div">
                                        <select name="zone" id="trade-zone" required>
                                            <option value="서울">서울</option>
                                            <option value="경기도">경기도</option>
                                            <option value="인천">인천</option>
                                            <option value="강원도">강원도</option>
                                            <option value="충청도">충청도</option>
                                            <option value="세종">세종</option>
                                            <option value="대전">대전</option>
                                            <option value="충청도">충청도</option>
                                            <option value="경상도">경상도</option>
                                            <option value="전라도">전라도</option>
                                            <option value="광주">광주</option>
                                            <option value="대구">대구</option>
                                            <option value="울산">울산</option>
                                            <option value="부산">부산</option>
                                            <option value="제주">제주</option>
                                            <option value="전국">전국</option>
                                        </select>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div id="right-content-footer">
                        <div  class="sell-section-title">
                            <h2 class="sell-section-title-h2">빠른 판매</h2>
                            <div class="sell-section-title-div">내 상품에 쿨거래 배지가 표시돼요</div>
                        </div>
	                    <% if(ondo <= 10.0) { %>
                        <div id="cool-trade-option" class="flex-class">
                            <div id="cool-trade-option-title">옵션</div>
                            <div id="cool-trade-option-ex">
                                <div class="flex-class" id="cool-trade-btn">
                                    <div>
                                        <input type="checkbox" id="coolTrade" name="coolTrade" value="2">
                                    </div>
                                    <div id="cool-trade-btn-title">쿨거래</div>
                                </div>
                                
                                <div id="use-agreement">
                                    <ul>
                                        <li>구매자와 별도의 대화 없이 판매가 가능해요.</li>
                                        <li>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</li>
                                        <li>쿨거래 배지로 더 많은 관심을 받을 수 있어요.</li>
                                        <li>
                                            <small>개인 정보 이용 약관에 동의 시 이용이 가능합니다.</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <% } else { %>
                        <div id="cool-trade-option" class="flex-class">
                            <div id="cool-trade-option-title">옵션</div>
                            <div id="cool-trade-option-ex">
                                <div class="flex-class" id="cool-trade-btn">
                                    <div>
                                        <input type="checkbox" id="coolTrade" name="coolTrade" value="1" onclick="return false;">
                                    </div>
                                    <div id="cool-trade-btn-title">온도 10도 이하 회원부터 쿨거래 이용이 가능해요.</div>
                                </div>
                                
                                <div id="use-agreement">
                                    <ul>
                                        <li>구매자와 별도의 대화 없이 판매가 가능해요.</li>
                                        <li>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</li>
                                        <li>쿨거래 배지로 더 많은 관심을 받을 수 있어요.</li>
                                        <li>
                                            <small>개인 정보 이용 약관에 동의 시 이용이 가능합니다.</small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            
        </div>

        <div id="footer-content-cr">
            <div id="footer-content-div">
                <button type="reset" id="save" onclick="testbtn();">초기화</button>
                <button type="button" id="enroll" onclick="submit();">등록하기</button>
            </div>
        </div>
        
                
        <script>
        	
      	// 체크박스 요소를 가져옵니다.
         const coolTradeCheckbox = document.querySelector('input[name="coolTrade"]');

         // 체크박스의 변경 이벤트를 감지하고 처리합니다.
         coolTradeCheckbox.addEventListener('change', function() {
             // 체크박스가 체크되었는지 확인합니다.
             if (this.checked) {
                 // 체크되었을 때 value 값을 2로 설정합니다.
                 this.value = "2";
             } else {
                 // 체크되지 않았을 때 value 값을 1로 설정합니다.
                 this.value = "1";
             }
             
             console.log(coolTradeCheckbox.value);
         });
        	
    	// 상품상태
    	let poStatus = null;
    	
       	$("[name=status]").click(function(){
               poStatus = $("[name=status]:checked").val();
       	})
       	
       	// 배송비
       	let poDelivery = null;
    	
       	$("[name=deliveryCharge]").click(function(){
       		poDelivery = $("[name=deliveryCharge]:checked").val();
       	})
       	
	    function submit(){
       		
       		console.log($("#fileInput"));
       		let fileAlert = $("#fileInput");
       		if(!fileAlert[0].files.length){
        		alert("이미지를 등록해주세요.");
        		return false;
        	} 
       		
       		/*
	    	console.log(sel_files); // 이미지가 담긴 배열
	    	console.log(poName); // 상품명
	    	console.log(categoryTest.value); // 카테고리
	    	console.log(poStatus); // 상품상태
	    	console.log($("#numberInput").val()); // 가격
	    	console.log(poDelivery); // 배송비
	    	console.log($("#contentInput").val()); // 설명
	    	console.log($("#numberInput2").val()); // 수량
	    	console.log($("#trade-zone").val()); // 거래지역
	    	console.log($("#coolTrade").val()); // 쿨거래여부
       		*/
       	    // 이미지 파일을 FormData에 추가
       	    let formData = new FormData();
       	    for (let i = 0; i < sel_files.length; i++) {
       	        formData.append('image'+(i+1), sel_files[i]);
       	    }
       	    
       	    // value 추가
       	    formData.append('title', poName);
       	    formData.append('category', categoryTest.value);
       	    formData.append('status', poStatus);
       	    formData.append('price', $("#numberInput").val());
       	    formData.append('deliveryCharge', poDelivery);
       	    formData.append('content', $("#contentInput").val());
       	    formData.append('pieces', $("#numberInput2").val());
       	    formData.append('zone', $("#trade-zone").val());
       	    formData.append('trade', $("#coolTrade").val());
	    	formData.append('seller', <%= userNo %>);
	    	
	    	for (let pair of formData.entries()) {
	    	    console.log(pair[0] + ', ' + pair[1]); // key, value 출력
	    	}
	    	
	    	$.ajax({
	    		url:"sellinsert.po",
	    		data:formData,
	    		type:"POST",
	    		processData: false,  // FormData를 바로 전송하기 위해 false로 설정
	            contentType: false,	 // 컨텐츠 타입 설정
	            success:function(result){
	            	window.location.href = "insertSuccess.po";
	            },
	            error:function(){
	            	console.log("실패");
	            }
	    	});
			
	    }
    
    </script>
    
    <%@ include file="../common/footer.jsp" %>





</body>
</html>