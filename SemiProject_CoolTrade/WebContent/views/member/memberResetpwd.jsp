<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
          font-family: 'Arial', sans-serif;
          background-color: #f7f7f7;
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }
        
        .container {
          background-color: #fff;
          padding: 50px;
          border-radius: 8px;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          width: 300px;
        }
      
        h2,h5 {s
          text-align: center;
          color: #333;
        }
      
        .form-group {
          margin-bottom: 15px;;
        }
      
        input[type="password"],
        button {
          width: 100%;
          padding: 10px;
          margin-top: 5px;
          border: 1px solid #ccc;
          border-radius: 4px;
          box-sizing: border-box; /* 너비에 패딩과 테두리를 포함 */
        }
      
        button {
          background-color: #007bff;
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
<div class="container">
  <h2>비밀번호 재설정</h2>
  <h5>새로운 비밀번호를 입력해주세요</h5>
  <form>
    <div class="form-group">
    
      <input type="password" id="name" name="name" required placeholder="비밀번호">
    </div>
    
    <div class="form-group">
      <div id="input-group">
        <input type="password" id="email" name="email" required placeholder="비밀번호확인">
       
      </div>
    </div>
    
   

      <button type="button">제출</button>
</body>
</html>