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
        
        
        
        .outer{
            width: 500px;
            height: 450px;
            margin: auto;
            margin-top: 200px;
            
            
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
            margin-left: 73px;


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

 <div class="outer" >

        <div class="idcheck1" align="center">
            <h1>아이디 조회</h1>
            <h3>개인정보를 위해 일부분은 *로 표시됩니다.</h3>
        </div>

        <div class="idcheck2">
            <p> - 입력된 정보로 등록된 아이디입니다.</p>
            <p> • ab*d(가입일: xxxx-xx-xx)</p>
        </div>

        <a href="#" class="loginbtn" align=center>로그인</a>

        <p style="font-size: 12px; margin: 0;" align="center">비밀번호가 기억나지 않는다면? &nbsp; <a href="#" style="font-size: 13px;">비밀번호 찾기</a></p>
    </div>

</body>
</html>