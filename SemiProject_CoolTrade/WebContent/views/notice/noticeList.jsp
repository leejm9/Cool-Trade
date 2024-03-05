<%@page import="com.cooltrade.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
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
        <h2 align="left" style="margin-left:150px;">공지사항</h2>
        <br>

        <!-- 현재 로그인한 사용자가 관리자 일 경우 보여질 div- -->
        <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        <div align="right" style="width: 850px;">
            <a href="<%= contextPath %>/writeForm.no" class="btn btn-sm btn-secondary">글작성</a>
            <br><br>
        </div>
        <% } %>

        <table class="list-area"  align="center">
            <thead>
                <tr>
                    <th>글번호</th>
                    <th width="400">글제목</th>
                    <th width="100">작성자</th>
                    <th>조회수</th>
                    <th width="100">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!-- case1. 공지글이 없을 경우 -->
                <% if(list.isEmpty()) {%>
                <tr>
                    <td colspan="5" >존재하는 공지사항이 없습니다.</td>
                </tr>
				<% }else{ %>
               		<!-- case2. 공지글이 있을 경우 -->
	                <% for(Notice n : list){ %>
		                <tr>
		                    <td><%= n.getNoticeNo() %></td>
		                    <td><%= n.getNoticeTitle() %></td>
		                    <td><%= n.getUserNo() %></td>
		                    <td><%= n.getCount() %></td>
		                    <td><%= n.getNoticeDate() %></td>
		                </tr>
	                <% } %>
				<% } %>
            </tbody>
        </table>
        <div id="btn" align="center">
          <% if(currentPage > 1){ %>
          <button onclick="location.href='<%= contextPath%>/notice.no?cpage='+ (parseInt('<%= currentPage %>') - 1)">&lt;</button>
          <% } %>
          <% for(int i=1; i<= maxPage;i++){ %>
          <button onclick="location.href='<%= contextPath %>/notice.no?cpage=' + <%= i %>;"><%= i %></button>
          <% } %>
          <% if(currentPage != maxPage) { %>
          <button onclick="location.href='<%= contextPath%>/notice.no?cpage='+ (parseInt('<%= currentPage %>') + 1)">&gt;</button>
		<% } %> 
	</div>
    </div>
    
    
    <script>
    $(function(){
    	$(".list-area>tbody>tr").click(function(){
    		const num = $(this).children().eq(0).text();
    		location.href = '<%= contextPath %>/detail.no?num=' + num;
    	}); 
    })
    </script>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>