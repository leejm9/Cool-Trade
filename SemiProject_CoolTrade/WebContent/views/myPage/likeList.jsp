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

    #right-content-wrap>div {
        padding: 10px;
    }

    #right-content-title {
        font-size: 18px;
        font-weight: 700;
        width: 100%;
    }

    #like-product-count {
        font-size: 16px;
        border-bottom: 1px solid #e6e6e6;
        width: 100%;
    }

    #like-product-count>span {
        color: rgb(4, 180, 252);
    }

    #like-list-area {
        display: flex;
        justify-content: space-between;
        height: 50px;
        align-items: center;
        padding: 20px 0px;
    }

    #like-delete-select-box {
        display: flex;
        align-items: center;
        line-height: 100%;
    }

    button {
        border: none;
        background-color: transparent;
        width: 60px;
    }

    #like-delete-select-box button {
        width: 80px;
    }

    #like-list-div {
        border: 1px solid #e6e6e6;
        width: 100%;
        height: 150px;
        padding: 10px;
        display: flex;
        align-items: center;
    }

    #like-list-a {
        display: flex;
        align-items: center;
    }

    #like-list-a>div {
        padding: 0px 10px;
    }

    #like-list-area-wrap {
        display: grid;
        grid-template-columns: repeat(2,1fr);
        gap: 10px;
    }

    #like-list-checkbox-div {
        display: flex;
        align-items: center;
    }

    #like-product-price {
        display: flex;
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
                    찜한 상품
                </div>

                <div id="like-product-count">
                    찜
                    <span>3</span>
                </div>

                <div>
                    <div id="like-list-area">
                        <div id="like-delete-select-box">
                            <div>
                                <input type="checkbox">
                            </div>
                            <div>
                                <button>선택삭제</button>
                            </div>
                        </div>
                        <div>
                            <button>최신순</button>
                            <button>인기순</button>
                            <button>저가순</button>
                            <button>고가순</button>
                        </div>
                    </div>
                    <div id="like-list-area-2">
                        <div id="like-list-area-wrap">
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div id="like-list-div">
                                <a href="#" id="like-list-a">
                                    <div id="like-list-checkbox-div">
                                        <input type="checkbox">
                                    </div>
                                    <div>
                                        <img src="resources/images/forest1.PNG" alt="상품 대표이미지" width="120" height="120">
                                    </div>
                                    <div>
                                        <div>따끈따끈 핫팩 10묶음</div>
                                        <div id="like-product-price">
                                            <div>300,000</div>
                                            <div>원</div>
                                        </div>
                                        <div>
                                            1분전
                                        </div>
                                    </div>
                                </a>
                            </div>
                            


                        </div>    
                    </div>
                    
                    
                </div>

            </div>
        </div>
    </div>


	<%@ include file = "../common/footer.jsp" %>

</body>
</html>