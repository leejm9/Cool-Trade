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
        
        .outer {
          width: 300px;
          margin-top: 200px;
          margin: auto;
          padding: 30%
        }
      
        h2,h5 {
          text-align: center;
          color: #333;
        }
      
        .form-group {
          margin-bottom: 15px;;
        }
      
        input[type="text"],
        input[type="email"],
        button {
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
        
        #input-group{
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
      
    </style>
</head>
<body>

<div class="outer">
  
  <h2>아이디 찾기</h2>
  <h5>회원정보에 등록한 이메일로 인증</h5>
  <form>
   
    <div class="form-group">
      <input type="text" id="name" name="name" required placeholder="이름">
    </div>
    
    <div class="form-group">
      <div id="input-group">
        <input type="email" id="email" name="email" required placeholder="이메일">
        <button type="button">인증하기</button>
      </div>
    </div>
    
    <div class="form-group">
        <div class="input-group">
          <input type="email" id="email" name="email" required placeholder="인증번호">
        </div>
    </div>

      <button type="button">제출</button>
      <p style="font-size: 12px; margin: 0;">비밀번호가 기억나지 않는다면? &nbsp; <a href="#" style="font-size: 13px;">비밀번호 찾기</a></p>
    
    
</div>


</body>
</html>