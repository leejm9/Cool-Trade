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

    #wrap {
        width: 1000px;
        margin: auto;
        display: flex;
        margin-top: 200px;
        padding-top: 20px;
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

    /* 오른쪽 컨텐츠 CSS */
    #right-content {
        width: 80%;
    }

    #right-content-wrap>div {
        padding: 10px 0px;
        width: 100%;
    }

    .right-content-title-btn {
        border: none;
        background-color: transparent;
        padding-right: 50px;
        font-size: 18px;
        font-weight: 700;
        cursor: pointer;
    }

    #right-content-title {
        display: flex;
    }

    #sell-list-search {
        display: flex;
        border: 1px solid #e6e6e6;
        width: 40%;
        height: 35px;
        padding: 0px 5px;
        align-items: center;
        background: white;
    }

    ::placeholder {
        color: #c2c2c2;
    }

    #sell-list-search>input {
        border: none;
        outline: none;
        width: 100%;
        font-size: 14px;
        padding: 0px 5px;
    }

    #right-content-search-area {
        display: flex;
        align-items: center;
        height: 70px;
    }

    #right-content-search-area>div {
        margin-right: 15px;
    }

    .sell-list-select-btn {
        border: none;
        background: none;
        font-size: 15px;
        font-weight: 700;
        cursor: pointer;
    }

    table {
        border-top: 2px solid #d6d6d6;
        border-bottom: 1px solid #e6e6e6;
        width: 100%;
        border-spacing: 10px;
        border-collapse: separate; /* 셀테두리가 별도로 표시되도록 설정 */
        border-collapse: collapse;
    }

    .func-btn {
        background-color: transparent;
        border: 1px solid #d6d6d6;
        height: 30px;
        width: 50px;
        border-radius: 5px;
        font-size: 13px;
        cursor: pointer;
        margin: 3px;
    }

    td {
        text-align: center;
        font-size: 14px;
        border: 1px solid #e6e6e6;
        padding: 10px 20px;
    }

    th {
        text-align: center;
    }

    select {
        border: 1px solid #e6e6e6;
        font-size: 15px;
        height: 30px;
    }

    #thead-tr {
        background-color: #fafafa;
        height: 35px;
        text-align: center;
    }

    tr td:first-child {
        border-left: none;
    }

    tr td:last-child {
        border-right: none; /* 마지막 td의 오른쪽 보더를 없애기 */
    }

</style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

	<div id="wrap">
        <div id="left-content">
            <div id="mypage-tit">
                <h2 id="tit">
                	<a href="<%= contextPath %>/mypage.me">마이페이지</a>
                </h2>
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
                                    <a href="<%= contextPath %>/likelist.me">찜한 상품</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/buylist.me">구매 내역</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/selllist.me">판매 내역</a>
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
                        <button type="button" class="right-content-title-btn">
                            판매 내역
                        </button>
                </div>
                <div id="right-content-search-area">
                    <div id="sell-list-search">
                        <input type="text" placeholder="상품명을 입력해주세요." maxlength="20">
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn">판매중</button>
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn">예약중</button>
                    </div>
                    <div>
                        <button type="button" class="sell-list-select-btn">판매완료</button>
                    </div>
                </div>
                <div id="right-content-read">
                    <table>
                        <thead>
                            <tr id="thead-tr"> 
                                <th>등록일자</th>
                                <th>상품</th>
                                <th>가격</th>
                                <th>찜</th>
                                <th>쿨거래</th>
                                <th>판매상태</th>
                                <th>기능</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <tr>
                                <td>2024.02.18</td>
                                <td>
                                    <div>
                                        <a href="#">여기는 상품 섬네일</a><a href="#">여기는 상품명</a>
                                    </div>
                                </td>
                                <td>13,000원</td>
                                <td>3</td>
                                <td>X</td>
                                <td>
                                    <select name="sell-status">
                                        <option value="">판매중</option>
                                        <option value="">예약중</option>
                                        <option value="">판매완료</option>
                                    </select>
                                </td>
                                <td>
                                    <div>
                                        <button type="button" class="func-btn">UP</button>
                                    </div>
                                    <div>
                                        <button type="button" class="func-btn">수정</button>
                                    </div>
                                    <div>
                                        <button type="button" class="func-btn">삭제</button>
                                    </div>                                   
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

	<%@ include file = "../common/footer.jsp" %>

</body>
</html>