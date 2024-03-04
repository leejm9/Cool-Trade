<%@page import="com.cooltrade.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
        background-color: white;
        color: white;
        width: 1000px;
        height: 1200px;
        margin: auto;
        margin-top: 50px;
        padding: 200px 0px 300px 0px;
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

	<%@ include file="../common/header.jsp"%>
	<div class="outer" align="center">
	       <br>
	       <h2 align="left" style="margin-left:150px;">공지사항</h2>
	       <br>
	   
	
	   <table id="detail-area" border="1">
	       <tr>
	           <th width="70">제목</th>
	           <td colspan="3" width="430"><%= n.getNoticeTitle() %></td>
	       </tr>
	       <tr>
	           <th>작성자</th>
	           <td><%= n.getUserNo() %></td>
	           <th>작성일</th>
	           <td><%= n.getNoticeDate() %></td>
	       </tr>
	       <tr>
	           <td colspan="4" style="vertical-align: top;">
	               <p style="height: 150px; margin-top:20px;" ><%= n.getNoticeContent() %></p>
	           </td>
	       </tr>
	   </table>
	   <br><br>
	
	   <div>
	       <a href="<%= contextPath %>/notice.no?cpage=1"  class="btn btn-sm btn-secondary">목록가기</a>
	       
	       <% if(loginUser != null && loginUser.getUserName().equals(n.getUserNo())){ %>
	       <!-- 현재 로그인한 사용자가 해당 글을 쓴 본인일 경우에만 보이게 -->
	       <a href="<%= contextPath %>/updateForm.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-warning">수정하기</a>
	       <a href="<%= contextPath %>/delete.no?num=<%= n.getNoticeNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
	       <% } %>
	       
	   </div>
	  </div>
</body>
</html>