<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 

  .container {
    width: 300px; /* 컨테이너의 너비 */
    margin: 0 auto;
  }
  .form-group {
    margin-bottom: 3px; /* 필드 간격 */
  }
  label {
    display: block;
    /* margin-bottom: 5px; 라벨과 필드 간격 */
  }
  input[type="text"],
  input[type="password"],
  input[type="tei"] {
    width: 100%;
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
    padding: 10px;
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
    margin-left: 5px;

  }

 .checkbox-group {
  display: flex;
  align-items: center;
  justify-content: space-between; /* 양쪽 정렬 */
  margin-bottom: 5px; /* 체크박스 간격 조절 */
  
 }

 .checkbox-group input {
    margin-right: 5px;
 }

 .checkbox-group label {
  flex: 1; /* 라벨이 남은 공간을 모두 차지하도록 함 */
  white-space: nowrap; /* 텍스트를 한 줄로 유지 */
 }
 #userId {
  margin-top: 100px; /* 원하는 공백의 크기로 조정하세요 */
 }
 .input-group {
  display: flex;
  justify-content: space-between; /* 항목 사이 공간을 균등하게 분배 */
  align-items: center; /* 항목들을 세로선상에서 중앙으로 정렬 */
  width: 100%; /* 컨테이너의 너비를 100%로 설정 */
 }
 .input-group input[type="tel"] {
  flex-grow: 1; /* 입력 필드가 가능한 공간을 모두 차지하도록 함 */
  border-radius: 4px 0 0 4px; /* 왼쪽 모서리에만 둥근 처리 */
 }


 input[type="tel"] {
  flex-grow: 1;
  border: 1px solid #ccc; /* 테두리 스타일 */
  padding: 9px; /* 내부 여백 */
  border-radius: 4px 0 0 4px; /* 왼쪽 모서리에만 둥근 테두리 적용 */
  margin-right: -1px; /* 버튼과 겹치게 하여 테두리가 중복되지 않도록 함 */
 }
 #getVerifyCode {
  padding: 7.7px; /* 버튼 내부 여백 */
  border: 1px solid #ccc; /* 테두리 스타일 */
  border-left: none;
  border-radius: 0 4px 4px 0; /* 오른쪽 모서리에만 둥근 테두리 적용 */
  background-color: #f9f9f9; /* 버튼 배경색, 필요에 따라 조정 */
  margin-bottom: 0px;
  margin-right: -22px;
  /* 필요하다면 마우스 오버했을 때의 스타일도 추가 */
 }

 .checkbox-area {
    display: flex;
    width: 70%;
 }

 #email{
  padding: 8px px ;
 } 

 .btn {
  display: block;
  background-color: #007bff;
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
  <form>
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
      <input type="text" id="birthday" name="birthday" placeholder="생년월일 8자리" required>
    </div>
    
    <div class="form-group">
      
        <div class="input-group">
          <input type="tel" id="email" name="email" placeholder="이메일 주소" required>
          <button type="button" id="getVerifyCode">인증번호받기</button>
        </div>
        <br>
      
    
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
        <p>개인정보 이용약관 내용...</p>
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
      <p>통신사 이용약관 내용...</p>
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
      <p>쿨거래 개인정보수집 내용...</p>
    </details>

  </div>

<a href="#" class="btn" align="center">회원가입</a>

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




</body>
</html>