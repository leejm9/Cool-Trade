<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String pageUrl = (String)request.getAttribute("pageUrl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GmarketSansMedium';
}

body {
	font-family: 'Arial', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100vh;
	margin: 0;
}

.login-container {
	background-color: #fff;
	padding: 20px;
	padding-bottom: 60px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 300px;
	margin-bottom: 20px; /* 로그인 폼과 링크 사이 간격 */
}

.input-group {
	margin-bottom: 10px; /* 인풋 필드 사이 간격 */
}

.input-group input {
	width: calc(100% - 20px); /* 전체 너비에서 패딩 제외 */
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.input-group input:last-child {
	margin-bottom: 0; /* 마지막 인풋 필드의 마진 제거 */
}

.remember-group {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	margin-bottom: 20px; /* 체크박스와 로그인 버튼 사이 간격 */
}

.remember-group input[type="checkbox"] {
	margin-right: 5px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #04b4fc;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-bottom: 16px; /* 버튼과 링크 사이 간격 */
}

button:hover {
	background-color: #0056b3;
}

.links {
	text-align: center;
	width: 300px; /* 로그인 컨테이너와 같은 너비 */
}

.links a, .links .separator {
	color: rgba(151, 145, 145, 0.811); /* 연회색으로 설정 */
	text-decoration: none;
	margin: 0 3px;
	font-size: 14px
}

.links a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<!-- 로그인폼 -->

	<div class="login-container">

		<h1>쿨거래</h1>
		<form action="<%=contextPath %>/login.me" method="post">
			<br>
			<br>
			<br>
			<br>
			<br>

			<div class="input-group">
				<input type="text" id="username" name="userId" placeholder="아이디"
					required>
			</div>

			<div class="input-group">
				<input type="password" id="password" name="userPwd"
					placeholder="비밀번호" required>
			</div>

			<div class="remember-group">
				<input type="checkbox" id="remember" name="remember"> <label
					for="remember">로그인 상태 유지</label>
			</div>
			<input type="hidden" id="prevURL" name="prevUrl" value="<%=pageUrl%>">
			<button type="submit">로그인</button>

		</form>

		<div class="links">
			<a href="/cooltrade/searchid.me">아이디 찾기</a><span class="separator">|</span>
			<a href="/cooltrade/searchpwd.me">비밀번호 찾기</a><span class="separator">
				|</span> <a href="/cooltrade/signupForm.me">회원가입</a>
		</div>

	</div>


</body>
</html>