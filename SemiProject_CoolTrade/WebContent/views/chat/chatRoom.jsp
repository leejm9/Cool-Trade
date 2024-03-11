<%@page import="com.cooltrade.chatting.controller.model.vo.ChatRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ChatRoom> list = (ArrayList<ChatRoom>)request.getAttribute("list");
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
    .list-area{
        border:1px solid white;
        text-align: center;
    }
    
    .list-area>tbody>tr:hover{ 
    	background:gray;
    	cursor:pointer;
    }
    .list-area>thead th{
    	border-top:1px solid black;
    	border-bottom:1px solid black;
    }
    .list-area>tbody td{
    	border-bottom:1px solid black;
    	white-space: nowrap;
    }
    .outer button{
    	margin-top:30px;
    	width:20px;
    	height:25px;
    }
    .outer a{
    	margin-right:75px;
    }
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<div class="outer" align="center">

        <br>
        <h2 align="left" style="margin-left:150px;"><%= loginUser.getUserName() %>님의 채팅방 목록</h2>
        <br>

        <!-- 현재 로그인한 사용자가 관리자 일 경우 보여질 div- -->
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        <div align="right" style="width: 850px;">
            <a href="<%= contextPath %>/writeForm.no" class="btn btn-sm btn-secondary">채팅방 삭제</a>
            <br><br>
        </div>
        <% } %>

        <table class="list-area"  align="center">
            <thead>
                <tr>
                    <th>채팅방 번호</th>
                    <th width="400">채팅방제목</th>
                    <th width="100">구매자</th>
                    <th>판매자</th>
                </tr>
            </thead>
            <tbody>
                <!-- case1. 공지글이 없을 경우 -->
                <% if(list.isEmpty()) {%>
                <tr>
                    <td colspan="4" >존재하는 채팅방이 없습니다.</td>
                </tr>
				<% }else{ %>
               		<!-- case2. 공지글이 있을 경우 -->
	                <% for(ChatRoom c : list){ %>
	                	<% if(c.getUserId().equals(loginUser.getUserId()) || c.getSellerId().equals(loginUser.getUserId())){ %>
		                <tr>
		                    <td><%= c.getChatRoomNo() %></td>
		                    <td><%= c.getChatRoomTitle() %></td>
		                    <td><%= c.getUserId() %></td>
		                    <td><%= c.getSellerId() %></td>
		                </tr>
		                <% } %>
	                <% } %>
				<% } %>
            </tbody>
        </table>
       
    </div>
    
    
    <script>
    $(function(){
    	$(".list-area>tbody>tr").click(function(){
    		const num = $(this).children().eq(0).text();
    		location.href = "<%= contextPath %>/chatroom.in?userId=" + $(this).children().eq(2).text() + "&pno=" + $(this).children().eq(3).text();
    	}); 
    })
    </script>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>