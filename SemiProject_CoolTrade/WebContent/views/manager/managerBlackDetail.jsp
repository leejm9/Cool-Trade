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
            <h3 style="margin-right: 220px;">회원상세조회</h3>
            <table>
                <tr>
                    <th>이름</th>
                    <td><%= m.getUserName() %></td>
                </tr>
                <tr>
                    <th>회원번호</th>
                    <td><%= m.getUserNo() %></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><%= m.getNickName() %></td>
                </tr>
                 <tr>
                    <th>아이디</th>
                    <td><%= m.getUserId() %></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><%= m.getUserPwd() %></td>
                </tr>
                <tr>
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
                    <th>이메일</th>
                    <td><%= m.getEmail() %></td>
                </tr>
                <tr>
                    <th>회원상태</th>
                    <td><% if(m.getUserStatus().equals("Y")){ %>
	           		회원
	           		<%}else{ %>
	           		탈퇴
	           		<%} %>
	           		</td>
                </tr>
                <tr>
                    <th>ONDO</th>
                    <td><%= m.getOndo() %>도</td>
                </tr>
                <tr>
                    <th>경고</th>
                    <td><%= m.getCaution() %>회</td>
                </tr>
            </table>
        </div>
        
	   <div>
	       <a href="<%= contextPath %>/blacklist.in?cpage=1"  class="btn btn-sm btn-secondary">목록가기</a>
	       <a href="<%= contextPath %>/delete.detail?uno=<%= m.getUserNo() %>" class="btn btn-sm btn-danger">추방하기</a>
	       
	   </div>
	  </div>
</body>
</html>