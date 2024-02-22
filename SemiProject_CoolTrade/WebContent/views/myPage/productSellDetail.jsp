<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

    <div id="wrap" style="margin-top: 180px;">
        <div id="main-content" class="flex-class">
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
                                        <a href="">찜 목록</a>
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
                <div id="right-content-main">
                    <div id="right-content-title" class="flex-class">
                        <button type="button" class="right-content-title-btn">
                            판매 등록
                        </button>
                        <button type="button" class="right-content-title-btn">
                            판매 내역
                        </button>
                    </div>

                    <div class="sell-section-title">
                        <h2 class="sell-section-title-h2">기본정보</h2>
                        <div class="sell-section-title-div">* 필수항목</div>
                    </div>
                    <div>
                        <form action="#" method="">
                            <div id="sell-section-wrap">

                                <div id="sell-section-img" class="flex-class">
                                    <div id="sell-section-img-title">
                                        상품이미지
                                        <span class="redColor">*</span>
                                        (0/5)
                                    </div>
                                    <div id="fileInput-div">
                                        <input type="file" id="fileInput" accept="image/*">
                                        <img src="resources/bandicam 2024-02-19 20-16-47-061.jpg" alt="상품이미지 등록 버튼" id="fileImg">
                                    </div>
                                </div>

                                <div id="sell-section-product-name" class="flex-class">
                                    <div id="sell-section-product-name-title">
                                        상품명
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-name-input">
                                        <div id="sell-section-product-name-input-area">
                                            <input type="text" maxlength="40" placeholder="상품명을 입력해주세요.">
                                        </div>
                                        <div id="sell-section-product-name-input-limit">
                                            0/40
                                        </div>
                                    </div>
                                </div>

                                <div id="sell-section-category" class="flex-class">
                                    <div id="sell-section-category-title">
                                        카테고리
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-category-select">
                                        <div id="sell-section-category-select-list">
                                            <ul>
                                                <li>
                                                    <button>패션의류</button>
                                                </li>
                                                <li>
                                                    <button>패션잡화</button>
                                                </li>
                                                <li>
                                                    <button>뷰티</button>
                                                </li>
                                                <li>
                                                    <button>전자제품</button>
                                                </li>
                                                <li>
                                                    <button>리빙/생활</button>
                                                </li>
                                                <li>
                                                    <button>가구/인테리어</button>
                                                </li>
                                                <li>
                                                    <button>반려동물</button>
                                                </li>
                                                <li>
                                                    <button>도서/음반/문구</button>
                                                </li>
                                                <li>
                                                    <button>상품권</button>
                                                </li>
                                                <li>
                                                    <button>무료나눔</button>
                                                </li>
                                            </ul>
                                        </div>
                                        <div id="sell-section-category-select-input">
                                            <div>선택한 카테고리 :</div>
                                            <div>무료나눔</div>
                                        </div>
                                    </div>
                                </div>

                                <div id="sell-section-product-status">
                                    <div id="sell-section-product-status-title">
                                        상품상태
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-status-select">
                                        <div>
                                            <input id="new-product" type="radio" vlaue="new-product" name="product-status">
                                            <label for="new-product" class="product-status-label">새 상품(미사용)</label>
                                            <span class="product-status-select-span">사용하지 않은 새 상품</span>                              
                                        </div>                                 
                                        <div>
                                            <input id="no-use" type="radio" vlaue="no-use" name="product-status">
                                            <label for="no-use" class="product-status-label">사용감 없음</label>
                                            <span class="product-status-select-span">사용은 했지만 눈에 띄는 흔적이나 얼룩이 없음</span>                              
                                        </div> 
                                        <div>
                                            <input id="less-use" type="radio" vlaue="less-use" name="product-status">
                                            <label for="less-use" class="product-status-label">사용감 적음</label>
                                            <span class="product-status-select-span">눈에 띄는 흔적이나 얼룩이 약간 있음</span>                              
                                        </div> 
                                        <div>
                                            <input id="useful" type="radio" vlaue="useful" name="product-status">
                                            <label for="useful" class="product-status-label">사용감 많음</label>
                                            <span class="product-status-select-span">눈에 띄는 흔적이나 얼룩이 많이 있음</span>                              
                                        </div> 
                                        <div>
                                            <input id="broken-product" type="radio" vlaue="broken-product" name="product-status">
                                            <label for="broken-product" class="product-status-label">고장/파손 상품</label>
                                            <span class="product-status-select-span">기능 이상이나 외관 손상 등으로 수리/수선 필요</span>                              
                                        </div>                        
                                    </div>
                                </div>

                                <div id="sell-section-product-price" class="flex-class">
                                    <div id="sell-section-product-price-title">
                                        가격
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-product-price-input">
                                        <div id="product-price-input">
                                            <input type="text" placeholder="가격을 입력해 주세요." maxlength="15">
                                            <span>원</span>
                                        </div>
                                        <div id="product-price-offer">
                                            <input type="checkbox" id="price-offer">
                                            <label for="price-offer" class="custom-checkbox">가격 제안 받기</label>
                                        </div>
                                    </div>
                                </div>

                                <div id="sell-section-delivery-charge" class="flex-class">
                                    <div id="sell-section-delivery-charge-title">
                                        배송비
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-delivery-charge-select">
                                        <div id="delivery-charge-include-area">
                                            <input type="radio" id="delivery-charge-include">
                                            <label for="delivery-charge-include">배송비포함</label>
                                        </div>
                                        <div id="delivery-charge-none-area">
                                            <input type="radio" id="delivery-charge-none">
                                            <label for="delivery-charge-none">배송비별도</label>
                                        </div>
                                    </div>
                                </div>

                                <div id="sell-section-content" class="flex-class">
                                    <div id="sell-section-content-title">
                                        설명
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="sell-section-content-input">
                                        <textarea rows="6"></textarea>
                                        <div>0/2000</div>
                                    </div>
                                </div>

                                <div id="sell-section-tag" class="flex-class">
                                    <div id="sell-section-tag-title">
                                        태그
                                    </div>
                                    <div id="sell-section-tag-area">
                                        <div id="product-tag-input-area">
                                            <div id="product-tag-input">
                                                <input type="text">
                                            </div>
                                        </div>
                                        <ul id="product-tag-ul">
                                            <li>
                                                <p>- 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있어요.</p>
                                            </li>
                                            <li>
                                                <p>- 내 상품을 다양한 태그로 표현해 보세요.</p>
                                            </li>
                                            <li>
                                                <p>- 사람들이 내 상품을 더 잘 찾을 수 있어요.</p>
                                            </li>
                                            <li>
                                                <p>- 상품과 관련 없는 태그를 입력할 경우, 판매에 제재를 받을 수 있어요.</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="flex-class">
                                    <div id="sell-section-count-title">
                                        수량
                                        <span class="redColor">*</span>
                                    </div>
                                    <div id="product-count-input">
                                        <input type="text" placeholder="1" maxlength="10">
                                        <span>개</span>
                                    </div>
                                </div>

                                
                            </div>
                        </form>
                    </div>
                </div>

                <div id="right-content-footer">
                    <div  class="sell-section-title">
                        <h2 class="sell-section-title-h2">빠른 판매</h2>
                        <div class="sell-section-title-div">내 상품에 쿨거래 배지가 표시돼요</div>
                    </div>
                    <div id="cool-trade-option" class="flex-class">
                        <div id="cool-trade-option-title">옵션</div>
                        <div id="cool-trade-option-ex">
                            <div class="flex-class" id="cool-trade-btn">
                                <div>
                                    <input type="checkbox">
                                </div>
                                <div id="cool-trade-btn-title">쿨거래</div>
                            </div>
                            <div id="use-agreement">
                                <ul>
                                    <li>구매자와 별도의 대화 없이 판매가 가능해요.</li>
                                    <li>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</li>
                                    <li>쿨거래 배지로 더 많은 관심을 받을 수 있어요.</li>
                                    <li>
                                        <small>개인 정보 이용 약관에 동의 시 이용이 가능합니다.</small>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <br><br><br>
    <div id="footer-content">
        <div id="footer-content-div">
            <button type="button" id="save">임시저장</button>
            <button type="button" id="enroll">등록하기</button>
        </div>
    </div>
    
<%--     <%@ include file = "../common/footer.jsp" %> --%>
    
    <script>
        // 이미지 클릭 시 파일 업로드 창이 뜬다
        $("#fileImg").click(function() {
            $("#fileInput").click();
        });

        // input으로 업로드한 파일을 이미지 src 로 변경해줘서 미리보기 기능
        const fileDOM = document.querySelector('#fileInput');
        const previews = document.querySelectorAll('#fileImg');

        fileDOM.addEventListener('change', () => {
        const reader = new FileReader();
        reader.onload = ({ target }) => {
            previews[0].src = target.result;
        };
        reader.readAsDataURL(fileDOM.files[0]);
        });

        $(window).scroll(function() {
        // 전체 페이지 높이
        var totalPageHeight = $(document).height();

        // 현재 스크롤 위치 (스크롤 + 뷰포트 높이)
        var scrollPoint = $(window).scrollTop() + $(window).height();

        // 페이지 하단에서 200px 이내에 도달했는지 확인
        if ((totalPageHeight - scrollPoint) <= 200) {
            console.log("페이지 하단에서 200px 이내에 도달했습니다.");

    </script>
</body>
</html>