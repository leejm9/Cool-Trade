<%@page import="com.cooltrade.report.model.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
	Report r = (Report)request.getAttribute("r");
	String reportedUser = (String)request.getAttribute("reportedUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 #meminfo{
            width: 600px;
            height: 800px;
        }
        #meminfo table{ 
            width: 600px;
            height: 700px;
            margin: auto;
            border-left: 0px;
            border-right: 0px;
        }
        #meminfo th{
       	    text-align: center;
    	    width: 30%;
            border-left: 0px;
            border-top:1px solid black;
            border-bottom: 1px solid black;
            border-right:1px solid black;
        }
        #meminfo td{
            text-align: center;
            border-right: 0px;
            border-top:1px solid black;
            border-bottom: 1px solid black;
        }
        .outer{
            background-color: white;
            padding-top:25px;
        }
    
</style>

</head>
<body>
	<%@ include file = "../common/managerMenubar.jsp" %>
	<div class="outer" align="center">
	<div id="meminfo">
            <h3>회원상세조회</h3>
            <table>
                <tr>
                    <th>신고번호</th>
                    <td><%= r.getReportNo() %></td>
                </tr>
                <tr>
                    <th>신고대상</th>
                    <td><%= reportedUser %></td>
                </tr>
                <tr>
                    <th>신고게시물제목</th>
                    <td><%= r.getProductTitle() %></td>
                </tr>
                 <tr>
                    <th>신고자</th>
                    <td><%= r.getReporter() %></td>
                </tr>
                <tr>
                    <th>신고유형</th>
                    <td><%= r.getReportTypeNo() %></td>
                </tr>
                <tr>
                    <th>신고날짜</th>
                    <td><%= r.getReportDate() %><td>
                </tr>
                <tr>
                    <th>신고내용</th>
                    <td><%= r.getReportContent() %></td>
                </tr>
            </table>
        </div>
        
	   <div>
	       <a onclick="location.href='<%= contextPath %>/report.in?cpage=1'"  class="btn btn-secondary">목록가기</a>
	       	<input type="button" onclick="Report(<%=r.getProdNo() %>);" class="btn btn-danger" value="신고처리">
	   </div>
	   <br><br><br><br><br><br><br><br><br><br>
	  </div>
	  
	  
</body>
</html>