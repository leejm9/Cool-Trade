<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

input[type="text"], input[type="email"], input[type="password"], button
	{
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
	border-radius: 4px;
	cursor: pointer;
	margin-top: 1px;
}

button:hover {
	background-color: #0056b3;
}

.link-container {
	text-align: center;
	margin-top: 15px;
}

a {
	color: #04b4fc;
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
</style>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
 
	<div class="outer">
		<h2>비밀번호 찾기</h2>
		<div id="div-find-pwd">
		
			<p>비밀번호를 찾고자 하는 아이디를 입력해주세요</p>
			<div class="form-group">

				<input type="text" id="id" name="id" required placeholder="아이디">
			</div>

			<div class="form-group">
				<div id="input-group">
					<input type="text" id="name" name="name" required placeholder="이름">

				</div>
			</div>

			<div class="form-group">
				<div class="input-group">
					<input type="email" id="email" name="email" required
						placeholder="이메일주소">
				</div>
			</div>

			<button type="button" onclick="btnFindPwd()">제출</button>
			<br><br>
			<p style="font-size: 12px; margin: 0;">
				아이디가 기억나지 않는다면? &nbsp; <a href="/cooltrade/searchid.me" style="font-size: 13px;" >아이디
					찾기</a>
			</p>
		</div>



		<div id="div-input-pwd" style="display: none;">
			<h5>변경할 비밀번호를 입력해 주세요.</h5>

			<div class="form-group">
				<div id="input-group">
					<input type="password" id="password" name="password" required
						placeholder="비밀번호">

				</div>
			</div>

			<div class="form-group">
				<div class="input-group">
					<input type="password" id="passwordCheck" name="passwordCheck"
						required placeholder="비밀번호 확인">
				</div>
			</div>

			<button type="button" onclick="btnChangePwd()">비밀번호 변경</button>
		</div>

	</div>

</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function btnFindPwd() {
		const id = $('#id').val().trim();
		if (id === "") {
			alert("아이디를 입력해 주세요");
			$('#id').focus();
			return;
		}
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

		$
				.ajax({
					url : "searchpwd.do",
					data : {
						'id' : id,
						'name' : name,
						'email' : email
					},
					success : function(result) {
						if (result === "success") {
							document.getElementById('div-find-pwd').style.display = 'none';
							document.getElementById('div-input-pwd').style.display = 'block';
						} else {
							alert("일치하는 가입 정보가 없습니다.");
						}
					},
					error : function() {
						console.log("ajax 통신실패 ");
					}
				})
	}

	function btnChangePwd() {
		const password = $('#password').val();
		if (password.trim() === "") {
			alert("비밀번호를 입력해 주세요.");
			$('#password').focus();
			return;
		}
		if (password.length < 4) {
			alert("비밀번호를 4자리 이상 입력해 주세요.");
			$('#password').focus();
			return;
		}
		const passwordCheck = $('#passwordCheck').val();
		if (password !== passwordCheck) {
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
			$('#passwordCheck').focus();
			return;
		}
		$.ajax({
			url : "changepwd.do",
			data : {
				'id' : $('#id').val(),
				'password' : password
			},
			success : function(result) {
				if (result === "success") {
					alert("비밀번호 변경을 성공했습니다. 로그인 해주세요.");
					location.href = "/cooltrade/loginForm.me";
				}
			},
			error : function() {
				console.log("ajax 통신실패 ");
			}
		})
	}
</script>
</html>