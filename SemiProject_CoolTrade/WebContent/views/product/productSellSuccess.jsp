<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap {
		width: 1000px;
        margin: auto;
        margin-top: 250px;
        padding-top: 20px;
		border: 1px solid #e6e6e6;
		display: flex;
		flex-direction: column;
    	align-items: center;
	}

	.wrap>div {
		width: 900px;		
	}

	#con-1 {
		height: 40px;
		border-bottom: 1px solid;
	}

	#con-2 {
		height: 150px;
		padding: 70px 0px;
		font-size: 20px;
	}

	#con-3 {
		display: flex;
		height: 80px;
		padding: 20px 0px;
		justify-content: space-evenly;
    	align-items: center;
	}

	#btn1, #btn2, #btn3 {
		border: 1px solid #e6e6e6;
		background-color: white;
		width: 120px;
		height: 40px;
	}

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<% int userNo = loginUser.getUserNo(); %>


	<div class="wrap">
		
		<div id="con-1">판매하기</div>
		<div id="con-2" align="center">상품이 등록되었습니다</div>
		<div id="con-3">
			<div>
				<button id="btn2">판매내역 보기</button>
				<button id="btn3">새 상품 판매</button>
			</div>
		</div>	
	</div>

	<script>
		$(function(){
			$("#btn2").click(function(){
				location.href = "<%= contextPath %>/selllist.me?uno=<%= userNo %>&cpage=1";
			})

			$("#btn3").click(function(){
				location.href = "<%= contextPath %>/sellForm.po";
			})

		})
	</script>

</body>
</html>