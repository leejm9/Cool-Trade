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
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
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

input[type="text"],
input[type="password"]{
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
padding: 10px ; 
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


#getVerifyCode {
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
</head>
<body>

<div class="container">
  
    <div class="form-group">
      <input type="text" id="userId" name="userId" placeholder="아이디" required>
    </div>
    
    <div class="form-group">
      <input type="password" id="password" name="password" placeholder="비밀번호"required>
    </div>

    <div class="form-group">
      <input type="password" id="password" name="password" placeholder="비밀번호확인"required>
    </div>
    
    <div class="form-group">
      <input type="text" id="name" name="name" placeholder="이름"required>
    </div>
    
    <div class="form-group">
      <input type="text" id="birthday" name="birthday" placeholder="휴대폰번호" required>
    </div>
    
    <div class="form-group">
      
        <div class="input-group">
            <input type="text" id="email" name="email" placeholder="이메일 주소" required>
            <button type="button" id="getVerifyCode">인증번호받기</button>
        </div>
        
        
      
        <div class="checkbox-group">
            <input type="checkbox" id="agreeAll" name="terms_all">
            <label for="agreeAll">[필수] 인증 약관 전체 동의</label>
        </div>

      <div class="terms-container">
              
        <!-- 개인정보이용 체크박스 그룹 -->
          <div class="checkbox-group">
              <div class="checkbox-area">
                  <input type="checkbox" id="personalInfo1" name="personalInfo" class="sub-agree">
                  <label for="personalInfo1">개인정보이용</label>
              </div>
                  <button type="button" class="view-content-button" onclick="toggleDetail('personalInfoDetails1')">내용보기 ⅴ</button>
          </div>
              <details id="personalInfoDetails1">
                  <summary></summary>
                  <p style="font-size: 12px;">개인정보 이용약관 내용...
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestiae reprehenderit veritatis quas,
                    in nihil culpa eligendi ratione assumenda fugiat omnis ab deleniti.
                    Ab eos sint nostrum ullam libero odit reiciendis.
                  </p>
              </details>
                
                
        <!-- 통신사 이용약관 체크박스 그룹 -->
          <div class="checkbox-group">
              <div class="checkbox-area">
                  <input type="checkbox" id="personalInfo2" name="telecomInfo" class="sub-agree">
                  <label for="personalInfo2">통신사 이용약관</label>
              </div>
                  <button type="button" class="view-content-button" onclick="toggleDetail('telecomInfoDetails')">내용보기 ⅴ</button>
          </div>
              <details id="telecomInfoDetails">
                  <summary></summary>
                  <p style="font-size: 12px;">통신사 이용약관 내용... 
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestiae reprehenderit veritatis quas,
                    in nihil culpa eligendi ratione assumenda fugiat omnis ab deleniti.
                    Ab eos sint nostrum ullam libero odit reiciendis.</p>
              </details>
                
        <!-- 쿨거래 개인정보수집 체크박스 그룹 -->
          <div class="checkbox-group">
              <div class="checkbox-area">
                  <input type="checkbox" id="personalInfo3" name="tradeInfo" class="sub-agree">
                  <label for="personalInfo3">쿨거래 개인정보수집</label>
              </div>
                  <button type="button" class="view-content-button" onclick="toggleDetail('tradeInfoDetails')">내용보기 ⅴ</button>
          </div>
              <details id="tradeInfoDetails">
                  <summary></summary>
                  <p style="font-size: 12px;">쿨거래 개인정보수집 내용...
                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Molestiae reprehenderit veritatis quas,
                    in nihil culpa eligendi ratione assumenda fugiat omnis ab deleniti.
                    Ab eos sint nostrum ullam libero odit reiciendis.
                  </p>
              </details>

        
        <a href="#" class="btn" align="center">회원가입</a>
      </div>
         
      <script>
          function toggleDetail(id) {
            var detail = document.getElementById(id);
            detail.open = !detail.open;
          }
        
          window.onload = function() {
            document.getElementById('agreeAll').addEventListener('click', function(event) {
              var subAgrees = document.querySelectorAll('.sub-agree');
              subAgrees.forEach((checkbox) => {
                checkbox.checked = event.target.checked;
              });
            });
          };
        </script>
</div>
</body>
</html>