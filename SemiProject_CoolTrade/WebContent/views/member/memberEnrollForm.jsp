<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
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

.container {
   width: 350px; /* 컨테이너의 너비 */
   margin: 0 auto;
   margin-top: 200px;
}

.form-group {
   margin-bottom: 3px; /* 필드 간격 */
}

label {
   display: block;
   /* margin-bottom: 5px; 라벨과 필드 간격 */
}

input[type="text"], input[type="password"] {
   width: 94%;
   padding: 10px; /* 필드의 패딩 */
   margin-bottom: 10px; /* 필드 간격 */
   border: 1px solid #ccc; /* 테두리 스타일 */
   border-radius: 4px; /* 테두리 둥근 정도 */
}

.checkbox-group input {
   margin-right: 5px; /* 체크박스와 텍스트 간격 */
}

button {
   /* width: 100%; */
   padding: 10px;
   color: black;
   border: none;
   border-radius: 4px; /* 테두리 둥근 정도 */
   cursor: pointer;
}

.terms-container {
   margin: 10px 0;
}

.terms-container details {
   border: none;
   padding: 0;
   background-color: transparent;
}

.terms-container details[open] {
   border: 1px solid #ccc;
   padding: 50px;
   background-color: #f9f9f9;
}

.terms-container summary {
   cursor: pointer;
   list-style: none;
}

.terms-container summary::-webkit-details-marker {
   display: none;
}

.view-content-button {
   cursor: pointer;
   background-color: transparent;
   border: none;
   color: black;
   font-size: inherit;
   padding: 0px;
}

.checkbox-group {
   display: flex;
   align-items: center;
   justify-content: space-between; /* 양쪽 정렬 */
   margin-bottom: 5px; /* 체크박스 간격 조절 */
   font-size: 13px;
}

.checkbox-group input {
   margin-right: 5px;
}

.checkbox-group label {
   flex: 1; /* 라벨이 남은 공간을 모두 차지하도록 함 */
   white-space: nowrap; /* 텍스트를 한 줄로 유지 */
}

.input-group {
   display: flex;
   justify-content: space-between; /* 항목 사이 공간을 균등하게 분배 */
   align-items: center; /* 항목들을 세로선상에서 중앙으로 정렬 */
   width: 100%; /* 컨테이너의 너비를 100%로 설정 */
}

#getVerifyCode , #checkUserIdBtn {
   border: 1px solid #ccc; /* 테두리 스타일 */
   border-left: none;
   margin-top: -11px;
   background-color: #f9f9f9;
   margin-bottom: 0px;
   margin-right: -1px;
   width: 140px;
   height: 40px;
   /* 필요하다면 마우스 오버했을 때의 스타일도 추가 */
}

.checkbox-area {
   display: flex;
}

.btn {
   display: block;
   background-color: #04b4fc;
   color: white;
   padding: 12px 20px;
   margin: 1px auto;
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
<script>
    window.onload = function() {
      document.getElementById('agreeAll').onclick = function() {
        var subAgrees = document.getElementsByClassName('sub-agree');
        for(var i = 0; i < subAgrees.length; i++) {
          subAgrees[i].checked = this.checked;
        }
      }
    }
  </script>

<body>  



<div class="container">
  <form action="<%=contextPath %>/signup.me" method="post">
  
    <div class="form-group">

      <div class="input-group">
      <input type="text" id="userId" name="userId" placeholder="아이디" required>
      <button id="checkUserIdBtn" type="button" onclick="btnCheckUserId()">중복확인</button>
      </div>
      
   </div>

   <div class="form-group">
      <input type="password" id="password" name="password"placeholder="비밀번호" required>
   </div>

   <div class="form-group">
      <input type="password" id="passwordCheck" name="passwordCheck"placeholder="비밀번호확인" required>
   </div>

   <div class="form-group">
      <input type="text" id="name" name="name" placeholder="이름" required>
   </div>

   <div class="form-group">
      <input type="text" id="phone" name="phone" placeholder="휴대폰번호"required>
   </div>

   <div class="form-group">
     <input type="text" id="nickName" name="nickName" placeholder="닉네임" required>
   </div>

   <div class="form-group">
     <div class="input-group">
      <input type="text" id="email" name="email" placeholder="이메일 주소"required>
      <button type="button" id="getVerifyCode" onclick="sendVerifyCode();">인증번호받기</button>
     </div>
     <br>
   </div>
   
   
   <div class="form-group">
     <div class="input-group">
      <input type="text" id="verifyCode"  placeholder="인증번호" required>
      <button type="button" id="getVerifyCode" onclick="checkVerifyCode();">인증번호확인</button>
     </div>
     <br>
   </div>


   <div class="checkbox-group">
      <input type="checkbox" id="agreeAll" name="terms_all"> 
      <label for="agreeAll">[필수] 인증 약관 전체 동의</label>
   </div>

 <div class="terms-container">


 <!-- 개인정보이용 체크박스 그룹 -->
 <div class="checkbox-group">
  <div class="checkbox-area">
     <input type="checkbox" id="personalInfo1" name="personalInfo"
        class="sub-agree"> <label for="personalInfo1">개인정보이용</label>
  </div>
  <button type="button" class="view-content-button"
     onclick="toggleDetail('personalInfoDetails1')">내용보기 ⅴ</button>
</div>
<details id="personalInfoDetails1">
  <summary></summary>
  <p style="font-size: 12px;">개인정보 이용약관 내용... Lorem ipsum dolor
     sit amet consectetur, adipisicing elit. Molestiae reprehenderit
     veritatis quas, in nihil culpa eligendi ratione assumenda fugiat
     omnis ab deleniti. Ab eos sint nostrum ullam libero odit
     reiciendis.</p>
</details>


<!-- 통신사 이용약관 체크박스 그룹 -->
<div class="checkbox-group">
  <div class="checkbox-area">
     <input type="checkbox" id="personalInfo2" name="telecomInfo"
        class="sub-agree"> <label for="personalInfo2">통신사
        이용약관</label>
  </div>
  <button type="button" class="view-content-button"
     onclick="toggleDetail('telecomInfoDetails')">내용보기 ⅴ</button>
</div>
<details id="telecomInfoDetails">
  <summary></summary>
  <p style="font-size: 12px;">통신사 이용약관 내용... Lorem ipsum dolor
     sit amet consectetur, adipisicing elit. Molestiae reprehenderit
     veritatis quas, in nihil culpa eligendi ratione assumenda fugiat
     omnis ab deleniti. Ab eos sint nostrum ullam libero odit
     reiciendis.</p>
</details>

<!-- 쿨거래 개인정보수집 체크박스 그룹 -->
<div class="checkbox-group">
  <div class="checkbox-area">
     <input type="checkbox" id="personalInfo3" name="tradeInfo"
        class="sub-agree"> <label for="personalInfo3">쿨거래
        개인정보수집</label>
  </div>
  <button type="button" class="view-content-button"
     onclick="toggleDetail('tradeInfoDetails')">내용보기 ⅴ</button>
</div>
<details id="tradeInfoDetails">
  <summary></summary>
  <p style="font-size: 12px;">쿨거래 개인정보수집 내용... Lorem ipsum dolor
     sit amet consectetur, adipisicing elit. Molestiae reprehenderit
     veritatis quas, in nihil culpa eligendi ratione assumenda fugiat
     omnis ab deleniti. Ab eos sint nostrum ullam libero odit
     reiciendis.</p>
</details>

  </div>
  
  <button type="button" class="btn" style="width: 100%" onclick="signup()">회원가입</button>
</form>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	let checkUserId = false;
	let checkEmail = false;
	
	$(document).on("keyup", "#phone", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^050[0-9]|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});
	

    function toggleDetail(id) {
      const detail = document.getElementById(id);
      detail.open = !detail.open;
    }
  
    window.onload = function() {
      document.getElementById('agreeAll').addEventListener('click', function(event) {
        const subAgrees = document.querySelectorAll('.sub-agree');
        subAgrees.forEach((checkbox) => {
          checkbox.checked = event.target.checked;
        });
      });
    };
    
    function inputUserId() {
    	checkUserId = false;
    	document.getElementById("checkUserIdBtn").innerHTML = "중복확인";
    }
    
    function btnCheckUserId() {
    	const userId = $('#userId').val();
    	if (userId.trim() === "") {
    		alert("아이디를 입력해 주세요.");
    		$('#userId').focus();
    		return;
    	}
    	
    	$.ajax({
    		url: "idCheck.me",
    		data: {
    			'userId' : userId
    		},
    	success : function(result) {
			if (result == "NNNNN") { // 사용이 불가능 일 경우
				alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
				userId.focus(); // 커서를 깜빡거림으로써 재입력 유도
			} else {
				checkUserId = true;
	    		document.getElementById("checkUserIdBtn").innerHTML = "✔";
			}
		},
		error : function() {
			console.log("아이디 중복체크용 ajax 통신실패 ");	
		}
    	})
    }
    
    function btncheckEmail() {
    	const email = $('#email').val().trim();
    	if (email === "") {
    		alert("이메일을 입력해 주세요.");
    		$('#email').focus();
    		return;
    	}
    	$.ajax({
    		url: "emailCheck.me",
    		data: {
    			'email' : email
    		},
    	success : function(result) {
			if (result == "success") {

			}
		},
		error : function() {
			console.log("아이디 중복체크용 ajax 통신실패 ");	
		}
    	})
    }
    
    function signup() {
    	const userId = $('#userId').val();
    	if (!checkUserId) {
    		alert("아이디 중복확인을 먼저 해주세요.");
    		$('#userId').focus();
    		return;
    	}
    	if (userId.trim() === "") {
    		alert("아이디를 입력해 주세요.");
    		userId.focus();
    		return;
    	}
    	
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
    	const name = $('#name').val();
    	if (name.trim() === "") {
    		alert("이름을 입력해 주세요.");
    		$('#name').focus();
    		return;
    	}
    	const phone = $('#phone').val().replaceAll('-', '');
    	if (phone.trim() === "") {
    		alert("핸드폰 번호를 입력해 주세요.");
    		$('#phone').focus();
    		return;
    	}
    	
    	const nickName = $('#nickName').val();
    	if (nickName.trim() === "") {
    		alert("닉네임을 입력해 주세요.");
    		$('#nickName').focus();
    		return;
    	}
    	
    	const email = $('#email').val();
    	//if (!checkEmail) {
    	//	alert("이메일을 인증해 주세요.");
    	//	$('#email').focus();
    	//	return;
    	//}
    	if (email.trim() === "") {
    		alert("이메일을 입력해 주세요.");
    		$('#email').focus();
    		return;
    	}
    	
    	if(IS_VERIFY === false) {
    		alert("인증번호를 인증해 주세요.");
    		return;
    	}
    	
    	$.ajax({
    		url: "signup.me",
    		data: {
    			'userId' : userId,
    			'password' : password,
    			'name' : name,
    			'phone' : phone,
    			'nickName' : nickName,
    			'email' : email
    		},
    	success : function(result) {
			if (result == "success") {
				alert("회원 가입에 성공했습니다.");
				location.href = "/cooltrade/signupcomplete.me";
			} else {
				alert("회원 가입에 실패했습니다.");
			}
		},
		error : function() {
			console.log("ajax 통신실패 ");	
		}
    	})
    }
    
    function sendVerifyCode() {
    	const email = $('#email').val().trim();
      if (email === "") {
        alert("이메일을 입력해 주세요.");
        $('#email').focus();
        return;
      }
      $.ajax({
    	  url : 'sendverifycode.do',
    	  data : {
    		  email : email
    	  },
    	  success : function(result) {
   	      if (result == "success") {
 	          alert("인증번호 발송에 성공했습니다.");
 	        } else {
 	          alert("인증번호 발송에 실패했습니다.");
 	        }
    	  }
      });
    }
    var IS_VERIFY = false;
    function checkVerifyCode() {
      const verifyCode = $('#verifyCode').val().trim();
      if (verifyCode === "") {
        alert("인증번호를 입력해 주세요.");
        $('#verifyCode').focus();
        return;
      }
      $.ajax({
        url : 'verifycode.do',
        data : {
        	verifyCode : verifyCode
        },
        success : function(result) {
          if (result == "success") {
            alert("인증번호 인증에 성공했습니다.");
            IS_VERIFY = true;
          } else {
            alert("인증번호가 일치하지 않습니다.");
          }
        }
      });
    }
  </script>
</body>
</html>