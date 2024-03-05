<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        background-color: white;
        color: gray;
        width: 1000px;
        height: 1200px;
        margin: auto;
        margin-top: 50px;
        
    }
    .outer *{
    	border-left:0px;
    	border-right:0px;
    }
    .outer table{
    	width :700px;
    	height: 500px;
    }
</style>

</head>
<body>
	<%@ include file = "../common/managerMenubar.jsp" %>
	<div class="outer" align="center">
	       <br>
	       <h2 align="left" style="margin-left:150px;">회원상세정보</h2>
	       <br>
	   
	
	   <table id="detail-area" border="1">
	       <tr>
	           <th>이름</th>
	           <td><%= m.getUserName() %></td>
	           <th>회원번호</td>
	           <td><%= m.getUserNo() %></td>
	           <th>닉네임</th>
	           <td><%= m.getNickName() %></td>
	       </tr>
	       <tr>
	           <th>아이디</th>
	           <td><%= m.getUserId() %></td>
	           <th>비밀번호</th>
	           <td><%= m.getUserPwd() %></td>
	           <th>회원등급</th>
	           <td><% if(m.getUserLevel().equals("U")){ %>
	           		일반
	           		<%}else if(m.getUserLevel().equals("B")){ %>
	           		블랙리스트
	           		<%}else if(m.getUserLevel().equals("C")){ %>
	           		쿨거래사용자
	           		<%} %>
	           </td>
	       </tr>
	       <tr>
	       		<th colspan="2">이메일</th>
	       		<td><%= m.getEmail() %></td>
	       		<th>회원상태</th>
	           	<td><% if(m.getUserStatus().equals("Y")){ %>
	           		회원
	           		<%}else{ %>
	           		탈퇴
	           		<%} %>
	           </td>
	       </tr>
	       <tr>
	           <td colspan="4" style="vertical-align: top;">
	               <p style="height: 150px; margin-top:20px;" ></p>
	           </td>
	       </tr>
	   </table>
	   <br><br>
	
	   <div>
	       <a href="<%= contextPath %>/member.in?cpage=1&dropDownValue=1"  class="btn btn-sm btn-secondary">목록가기</a>
	       <a href="<%= contextPath %>/delete.detail?uno=<%= m.getUserNo() %>" class="btn btn-sm btn-danger">추방하기</a>
	       
	   </div>
	  </div>
</body>
</html>