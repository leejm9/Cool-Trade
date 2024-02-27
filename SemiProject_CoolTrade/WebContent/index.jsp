<%@page import="com.cooltrade.common.OnloadController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(document).ready(function(){
			$("#test").click();
		})
	</script>
		
	<form action="/cooltrade/onload.page">
		<input id="test" type="submit" style="display:none;">
	</form>
	
	

</body>
</html>