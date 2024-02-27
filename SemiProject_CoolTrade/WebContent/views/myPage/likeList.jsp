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
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'GmarketSansMedium';
        color: #444444;
    }

    div {
        /* border: 1px solid red; */
    }

    #mypage-wrap {
        width: 1000px;
        margin: auto;
        display: flex;
        margin-top: 200px;
    }

    /* 왼쪽 컨텐츠 CSS */
    #left-content {
        width: 20%;
    }

    #tit {
        font-weight: 800;
        letter-spacing: -1.5px;
        height: 60px;
    }

    li {
        list-style: none;
    }

    a {
        text-decoration: none;
        color: #444444;
    }

    a:hover {
        color: rgb(4, 180, 252);
    }

    .sub-title-list {
        padding: 3px 0px;
        font-size: 15px;
    }

    .sub-title-h3 {
        font-size: 18px;
        font-weight: 600;
    }

    .sub-title-li {
        padding-bottom: 20px;
    }

    /* 오른쪽 컨텐츠 css */
    #right-content {
        width: 80%;
    }

    #right-content-title {
        font-size: 18px;
        font-weight: 700;
    }
</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

    <div id="mypage-wrap">
        <div id="left-content">
            <div id="mypage-tit">
                <h2 id="tit">마이페이지</h2>
            </div>
            <div>
               <div>
                    <ul>
                        <li class="sub-title-li">
                            <h3 class="sub-title-h3">내정보</h3>
                            <ul>
                                <li class="sub-title-list">
                                    <a href="">회원정보 수정</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="">이용 후기</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sub-title-li">
                            <h3 class="sub-title-h3">마이 쇼핑</h3>
                            <ul>
                                <li class="sub-title-list">
                                    <a href="">찜한 상품</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="">구매 내역</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="">판매 내역</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
               </div>
            </div>
        </div>
        <div id="right-content">
            <div id="right-content-wrap">
                <div id="right-content-title">
                    찜한 상품
                </div>

                <div>
                    
                </div>
            </div>
        </div>
    </div>


</body>
</html>