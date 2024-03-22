<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#img_div{
	width:600px;
}
#img_div>img{
	width:100%;
}
</style>
<body>
	<%@ include file="header.jsp" %>
	<br><br>
	<h1 align="center" style="color:hotpink; margin-top:210px;"><%=request.getAttribute("errorMsg") %></h1>
	<br><br>
	<div id="img_div" style="text-align:center">
		<img src="https://i.namu.wiki/i/r75z6aMdL_D2ryP2bzTZ2whUiB0ElUooSa1o_MV-Th7b1bin7eCOy1pmsKOB06xujuANcTuAbXrdb_Qbt6n_uYrjiaiDz4mIUAx5kdV9VCtatiP4WEobajHU1BZzXm38Yj1XRX8p56OCNvKOpOmT8A.webp" alt="손드는 선생님">
	</div>
	<br><br>
	<p style="color:hotpink;">에러는 너굴맨이 처리했으니 안심하라구!</p>
	<br><br>
	<%@ include file="footer.jsp" %>
</body>
</html>