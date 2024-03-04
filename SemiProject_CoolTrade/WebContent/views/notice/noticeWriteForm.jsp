<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h2 align="center">공지사항 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.no" id="enroll-form" method="post">
            
            <table>
                <tr>
                    <th width="50">제목</th>
                    <td width="450"><input type="text" name="title" style="width:550px;" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" rows="10" style="resize: none; width:600px;" required></textarea>
                    </td>
                </tr>
            </table>
            <br><br>

            <div>
                <button type="submit">등록하기</button>
                <button type="reset">초기화</button>
                <button type="button" onclick="history.back()">뒤로가기</button>
            </div>

        </form>

    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>