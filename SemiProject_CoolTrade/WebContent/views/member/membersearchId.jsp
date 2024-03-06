
<%@page import="com.cooltrade.member.model.dao.MemberDao"%>
<%@page import="java.util.Date"%>
<%@page import="com.cooltrade.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GmarketSansMedium';
}

.outer {
	margin: auto;
	margin-top: 250px;
	width: 300px;
}

h2, h5 {
	text-align: center;
	color: #333;
}

.form-group {
	margin-bottom: 15px;;
}

input[type="text"], input[type="email"], button {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box; /* 너비에 패딩과 테두리를 포함 */
}

button {
	background-color: #04b4fc;
	color: white;
	border: none;
	cursor: pointer;
	margin-top: 15px;
}

button:hover {
	background-color: #0056b3;
}

.link-container {
	text-align: center;
	margin-top: 15px;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

#input-group {
	position: relative;
}

#input-group button {
	position: absolute;
	width: 90px;
	bottom: 50%;
	height: 35px;
	top: 0;
	bottom: -5.5px;
	right: 0px;
	margin: auto 0;
	border-radius: 3px;
}

p {
	font-size: 13px;
	text-align: center;
}

        
        .idcheck1{
            margin-top: 40px;
        }
        .idcheck2{
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 350px;
            height: 150px;
            margin-top: 25px;
            margin-left: -20px;


        }

        .loginbtn {
            display: flex;
            background-color: #04b4fc;
            color: white;
            padding: 20px 20px;
            height: 30px;
            width: 310px;
            margin: 15px auto;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.9em;
            justify-content: center;
            align-items: center;
        }
        
        .loginbtn:hover {
            background-color: #0056b3;
        }
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<div class="outer">
		<h2>아이디 찾기</h2>
	<div id="div-find-id">
		<p>회원정보에 등록한 이메일로 인증해주세요</p>
		<form>

			<div class="form-group">
				<input type="text" id="name" name="name" required placeholder="이름">
			</div>

			<div class="form-group">
				<div id="input-group">
					<input type="email" id="email" name="email" required
						placeholder="이메일">
				</div>
			</div>

			<button type="button" onclick="btnFindId()">제출</button>
			<br><br>
			<p style="font-size: 12px; margin: 0;">
				비밀번호가 기억나지 않는다면? &nbsp; <a href="/cooltrade/searchpwd.me" style="font-size: 13px;">비밀번호
					찾기</a>
			</p>
	</div>
	
	<div id="div-input-id" style="display: none;">
	<h5>조회된 아이디입니다.</h5>
	
       

        <div class="idcheck2">
        <br>
            <p> - 입력된 정보로 등록된 아이디입니다.</p>
            
                 
            <p> • <span id="userId"></span> (가입일: <span id="enrollDate"></span>)</p>
            
        </div>

                                        	
        <a href="/cooltrade/loginForm.me" class="loginbtn" align=center>로그인</a>

        <p style="font-size: 12px; margin: 0;" align="center">비밀번호가 기억나지 않는다면? &nbsp; <a href="/cooltrade/searchpwd.me" style="font-size: 13px;">비밀번호 찾기</a></p>
    </div>
	
	</div>


</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
	function btnFindId() {
	
		const name = $('#name').val().trim();
		if (name === "") {
			alert("이름 입력해 주세요");
			$('#name').focus();
			return;
		}
		const email = $('#email').val().trim();
		if (email === "") {
			alert("이메일을 입력해 주세요");
			$('#email').focus();
			return;
		}

		$.ajax({
					url : "searchId.do",
					data : {
						'name' : name,
						'email' : email
					},
					success : function(result) {
						if (result === "fail") {
							alert("일치하는 가입 정보가 없습니다.");
						} else {
							$("#userId").text(result.userId);
							$("#enrollDate").text(result.enrollDate);
							document.getElementById('div-find-id').style.display = 'none';
							document.getElementById('div-input-id').style.display = 'block';
						}
					},
					error : function() {
						console.log("ajax 통신실패 ");
					}
				})
	}

	function btnidcheck() {
		const id = $('#id').val();
	
		$.ajax({
			url : "changeid.do",
	
			success : function(result) {
				if (result === "success") {
					alert("아이디 조회 성공 !");
					location.href = "/cooltrade/idcheckForm.me";
				}
			},
			error : function() {
				console.log("ajax 통신실패 ");
			}
		})
	}
</script>
</html>