<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.cooltrade.member.model.vo.Member"%>
<% 
	Member member = (Member) session.getAttribute("loginUser"); 
	String id = member.getUserId();
	String name = member.getUserName();
	String email = member.getEmail();
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
  
            font-family: 'GmarketSansMedium'; 
        }
     
     
        .container {
            background-color: white;
            width: 500px;
            height: 500px;
            margin: auto;
            margin-top: 200px;
    
        }

        .left{
            background-color:;
            border: 1px solid lightgrey;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 40%;
            float: left;
            box-sizing: border-box;
            height: 150px;
            

        }
        
        .right {
            border: 1px solid lightgrey;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 60%;
            float: right;
            box-sizing: border-box;
            height: 150px
        }
        .information{

            border: 1px solid lightgray;
            padding: 10px;
            width: 96%;
            border-radius: 5px;
            
        }
        
        
        
        .information p {
            margin: 10px 5;
            font-size: 12px;
            
        }
        
        .information span {
            font-weight: bold;

        }
        
        .highlight {
            color: #2a6496;
            font-weight: bold;
        }
        
        .btn {
            display: block;
            background-color: #04b4fc;
            color: white;
            padding: 10px 20px;
            margin: 10px auto;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.9em;
        }
        
        .btn:hover {
            background-color: #0056b3;
        }
        
    </style>
</head>
<body>
<body>

<div class="container">
   
    <h2 align="ce">회원 가입 완료</h2>

    
    <div class="information">
        <p>가입을 축하합니다.</p>
    </div>

      
    <div class="left">
        <img src="resources/images/logo.png" width="170px;" alt="쿨거래 로고" height="" width="">
        
    </div>
    <div class="right">
        <p align="left"><span>아이디:</span><%=id %></p>
        <p align="left"><span>이름:</span><%=name %></p>
        <p align="left"><span>이메일:</span><%=email %></p>
    </div>

    <p><%=name %> 님을 [회원가입] 환영합니다.</p>

    <a href="/cooltrade" class="btn" align=center>메인으로 돌아가기</a>
</div>

</body>
</html>