<%@page import="com.cooltrade.product.model.vo.Search"%>
<%@page import="com.cooltrade.product.model.vo.RecentProducts"%>
<%@page import="com.cooltrade.common.PageInfo"%>
<%@page import="com.cooltrade.product.model.vo.Product"%>
<%@page import="com.cooltrade.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cooltrade.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
   int headerCo;
   Member loginUser = (Member) session.getAttribute("loginUser");
   String alertMsg = (String) session.getAttribute("alertMsg");
   if (session.getAttribute("headerCo") == null) {
      headerCo = 0;
   } else {
      headerCo = (int) session.getAttribute("headerCo");
   }
   ArrayList<RecentProducts> rlist = (ArrayList<RecentProducts>) session.getAttribute("rlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>쿨거래 중고거래 사이트</title>
<link rel="icon" sizes="16x16" type="image/png"
   href="resources/images/logo.png" />
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/cooltrade_ds.js"></script>
<link rel="stylesheet" href="resources/css/cooltrade_ds.css" />
<link rel="stylesheet" href="resources/css/cooltrade_cr.css" />

<style>
#div1 {
   display: flex;
   margin-top: 5px;
   white-space: nowrap;
}

#div1 button {
   width: 15px;
   height: 22px;
   border: 1px solid #04b4fc;
   border-radius: 10px;
   color: #04b4fc;
   background-color: white;
}

#div1 tr>* {
   line-height: 25px;
   font-size: 10px;
}

#div1 th {
   width: 100px;
   text-align: center;
   font-weight: 2;
}
</style>
</head>
<body>
   <%if (alertMsg!=null){ %>
   <script>
          alert("<%=alertMsg%>");
        </script>
   <% session.removeAttribute("alertMsg");%>
   <%} %>
   <div class="wrap-ds">
      <!--Header 시작!-->
      <div id="header1-ds" class="flex-ds">
         <div id="header1-1-ds" class="flex-ds">
            <div id="headerLeft-ds">
               <button id="favoriteBtn-ds">
                  <img src="resources/images/즐겨찾기.png" width="25" height="25"
                     style="padding: 5px" alt="즐겨찾기 이미지" /> 즐겨찾기
               </button>
            </div>
            <div id="headerRight-ds" class="flex-ds">
               <%if(loginUser==null){ %>
               <!--case1. 로그인전-->
               <div class="headerLogin-ds flex-ds">
                  <button onclick="location.href ='<%=contextPath%>/loginForm.me'"
                     id="loginBtn-ds"
                     style="border-bottom: 1px solid rgb(238, 238, 238)">
                     로그인/회원가입</button>
               </div>
               <%}else{ %>
               <!-- case2. 로그인 후 -->
               <div class="headerLogin-ds">
                  <button class="loginBtn-ds"
                     style="border-bottom: 1px solid rgb(238, 238, 238)">
                     알림</button>
                  <button class="loginBtn-ds"
                     style="border-bottom: 1px solid rgb(238, 238, 238)"
                     onclick="location.href='<%=contextPath%>/logout.me'">
                     로그아웃</button>
               </div>

               <div id="headerStore-ds" class="flex-ds">
                  <% if(loginUser.getUserName().equals("관리자")) { %>
                  <a href="<%= contextPath %>/manager.in" id="headerMyStore-ds"
                     class="flex-ds">마이페이지</a>
                  <% }else{ %>
                  <a
                     href="<%= contextPath %>/mypage.me?uno=<%= loginUser.getUserNo() %>"
                     id="headerMyStore-ds" class="flex-ds">마이페이지</a>
                  <% } %>
               </div>
               <%} %>
            </div>
         </div>
      </div>
      <div id="header2-ds" class="flex-ds">
         <div id="header2-1-ds">
            <div id="headerSearch-ds" class="flex-ds">
               <div id="logo-ds">
                  <img src="resources/images/logo.png" alt="쿨거래 로고"
                     onclick="location.href='<%=contextPath%>/onload.page'" />
               </div>
               <div id="searchBar-ds">
                  <div id="searchContainer-ds" class="flex-ds">
                     <form id="searchForm-ds" class="flex-ds"
                        action="<%=contextPath%>/search.po">
                        <input type="text" id="search-ds" name="search"
                           placeholder="상품명을 입력해주세요" maxlength="40" />
                        <button type="submit" style="border: none"
                           id="searchImgContainer-ds" class="flex-ds">
                           <img id="searchImg-ds" src="resources/images/돋보기.png"
                              alt="돋보기 이미지" />
                        </button>
                     </form>
                  </div>
                  <div id="div1">
                     <div>
                        <button id="popbtn1" onclick="popbtn(1);">&lt;</button>
                        <button id="popbtn2" onclick="popbtn(2)">&gt;</button>
                     </div>
                     <div>
                        <table style="width: 400px">
                           <tr>
                              <td>&nbsp;1.고기&nbsp;</td>
                              <td>2.햄버거&nbsp;</td>
                              <td>3.피자&nbsp;</td>
                              <td>4.핸드폰&nbsp;</td>
                              <td>5.전자레인지</td>
                           </tr>
                        </table>
                     </div>
                  </div>
                  <script>
                    $(function () {
                      var cbtn = 1;
                      function fetchData() {
                        $.ajax({
                          url: "popw.page",
                          data: { cbtn: cbtn },
                          success: function (result) {
                            $("#div1 td").remove();
                            let value = "";
                            for (let i = 0; i < result.length; i++) {
                              if (result[i].count % 5 == 1) {
                                value +=
                                  "<th>" +
                                  result[i].count +
                                  ".<a href='<%= contextPath %>/search.po?search=" +
                                  result[i].popwWord +
                                  "'>" +
                                  result[i].popwWord +
                                  "</a></th>";
                              } else {
                                value +=
                                  "<th>" +
                                  result[i].count +
                                  ".<a href='<%= contextPath %>/search.po?search=" +
                                  result[i].popwWord +
                                  "'>" +
                                  result[i].popwWord +
                                  "</a></th>";
                              }
                            }
                            $("#div1 tr").html(value);
                            if (cbtn == 1) {
                              cbtn = 2;
                            } else {
                              cbtn = 1;
                            }
                            setTimeout(fetchData, 5000);
                          },
                          error: function () {
                            console.log("ajax 통신 실패");
                            setTimeout(fetchData, 5000);
                          },
                        });
                      }
                      fetchData();
                    });

                    function popbtn(cbtn) {
                      $.ajax({
                        url: "popw.page",
                        data: { cbtn: cbtn },
                        success: function (result) {
                          let value = "";
                          for (let i = 0; i < result.length; i++) {
                            if (result[i].count % 5 == 1) {
                              value +=
                                "<th>" +
                                result[i].count +
                                ".<a href='<%= contextPath %>/search.po?search=" +
                                result[i].popwWord +
                                "'>" +
                                result[i].popwWord +
                                "</a></th>";
                            } else {
                              value +=
                                "<th>" +
                                result[i].count +
                                ".<a href='<%= contextPath %>/search.po?search=" +
                                result[i].popwWord +
                                "'>" +
                                result[i].popwWord +
                                "</a></th>";
                            }
                          }
                          $("#div1 tr").html(value);
                        },
                        error: function () {
                          console.log("ajax 통신 실패");
                        },
                      });
                    }
                  </script>
               </div>
               <div id="chatSell-ds" class="flex-ds">
                  <div id="chatContainer-ds">
                     <a href="<%= contextPath %>/chatRoom.list" id="chat-ds"> <img src="resources/images/말풍선.png"
                        alt="말풍선 이미지" /> 채팅하기
                     </a>
                  </div>
                  <div id="sellContainer-ds">
                     <% if(loginUser == null) { %>
                     <a href="<%=contextPath%>/loginForm.me" class="sell-ds"> <img
                        src="resources/images/sell.png" alt="판매하기 이미지" />
                        판매하기
                     </a>
                     <% } else { %>
                     <a href="<%= contextPath %>/sellForm.po" class="sell-ds"> <img
                        src="resources/images/sell.png" alt="판매하기 이미지" />
                        판매하기
                     </a>
                     <% } %>
                  </div>
               </div>
            </div>
            <div id="headerCategory-ds" class="flex-ds">
               <div class="category_wrap-ds">
                  <div id="categoryMenu-ds">
                     <img src="resources/images/카테고리.png" width="30" height="30"
                        style="padding: 5px" alt="카테고리 이미지" />
                     카테고리 <br />
                  </div>
                  <div class="category_hover-ds flex-ds">
                     <a href="<%=contextPath %>/search.po?cno=C1">패션의류</a> <a
                        href="<%=contextPath %>/search.po?cno=C2">패션잡화</a> <a
                        href="<%=contextPath %>/search.po?cno=C3">뷰티</a> <a
                        href="<%=contextPath %>/search.po?cno=C4">전자제품</a> <a
                        href="<%=contextPath %>/search.po?cno=C5">리빙/생활</a> <a
                        href="<%=contextPath %>/search.po?cno=C6">가구/인테리어</a>
                     <a href="<%=contextPath %>/search.po?cno=C7">반려동물</a> <a
                        href="<%=contextPath %>/search.po?cno=C8">도서/음반/문구</a>
                     <a href="<%=contextPath %>/search.po?cno=C9">상품권</a> <a
                        href="<%=contextPath %>/search.po?cno=C10">무료나눔</a>
                  </div>
               </div>
               <div id="notice-ds">
                  <a href="<%= contextPath %>/notice.no?cpage=1">공지사항</a>
               </div>
            </div>
         </div>

         <div id="sidebarWrap-ds">
            <div id="jjimWrap-ds">
               <div id="jjimText-ds" class="flex-ds">관심상품</div>
               <% if(loginUser == null) { %>
               <a href="" id="jjimLink-ds" class="flex-ds"> <img
                  src="resources/images/좋아요.png" width="25" height="25"
                  style="padding: 5px" alt="좋아요 이미지" />
               </a>
               <% } else { %>
               <a
                  href="<%= contextPath %>/likelist.me?uno=<%= loginUser.getUserNo() %>"
                  id="jjimLink-ds" class="flex-ds" style="vertical-align: middle">
                  <img src="resources/images/좋아요.png" width="25" height="25"
                  style="padding: 5px" alt="좋아요 이미지" />
                  <div style="padding-top: 3px"><%= headerCo %></div>
               </a>
               <% } %>
            </div>
            <div id="recentProduct-ds">
               <div id="recentTitle-ds">최근본상품</div>
               <%if(rlist == null) {%>
               <div id="recentDotContainer-ds" class="flex-ds"
                  style="margin-bottom: 10px">
                  <div id="recentDottedBorder-ds"></div>
               </div>
               <div id="recentSeenProduct-ds">
                  <div id="seenText-ds">
                     최근 본<br /> 상품이<br /> 없습니다.
                  </div>
               </div>
               <%}else{ %>
               <div id="recentDotContainer-ds" class="flex-ds"
                  style="margin-bottom: 10px; align-items: center">
                  <div id="recentDottedBorder-ds" align="center"
                     style="color: #04b4fc">
                     <%=rlist.size() %>
                  </div>
               </div>
               <div id="recentSeenProduct-ds"></div>
               <div class="flex-ds recentBtnWrap"
                  style="justify-content: space-between">
                  <button id="recent_prev"><</button>
                  <div id="recentPages"
                     style="font-size: 12px; color: rgb(136, 136, 136); line-height: 22px;"></div>
                  <button id="recent_next">></button>
               </div>
               <%} %>
            </div>
            <div id="topContainer-ds">
               <button type="button" id="topBtn-ds">TOP</button>
            </div>
            <script>
                $("#topBtn-ds").click(function () {
                  $("html, body").animate({ scrollTop: 0 }, 300);
                });

                $(document).ready(function () {
                  let currentPage = 0;
                  const itemsPerPage = 1;
                  let maxPage;
                  let rlist = [];
                  function renderSlider(data) {
                    const slider = $("#recentSeenProduct-ds");
                    slider.empty();

                    const startIndex = currentPage * itemsPerPage;

                    const endIndex = startIndex + itemsPerPage;

                    let slicedData = data.slice(
                      currentPage * itemsPerPage,
                      (currentPage + 1) * itemsPerPage
                    );
                    slicedData.forEach(function (recentProducts) {
                      let img = recentProducts.refPno;
                      let imgPath =
                        img != 0
                          ? recentProducts.imgPath + recentProducts.changeName
                          : "resource/images/noImage.png";
                      let recentProductHTML =
                        '<a href="detail.po?pno=' +
                        recentProducts.productNo +
                        '" style="padding:none;margin:none;">' +
                        '<div id="seenImg-ds">' +
                        '<div style="margin-bottom: 5px;">' +
                        '<img src="' +
                        imgPath +
                        '" width="68" height="68">' +
                        '<div class="hiding-text">' +
                        '<div style="padding: 10px;">' +
                        "<div>" +
                        recentProducts.productName +
                        "</div>" +
                        '<div style="color: #04b4fc;">' +
                        recentProducts.price +
                        "<span>원</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>";
                      slider.append(recentProductHTML);
                    });
                    maxPage = rlist.length;
                    if (maxPage == -1) {
                      currentPage = -1;
                    }
                    $("#recentPages").text(currentPage + 1 + "/" + maxPage);
                    console.log(maxPage);
                  }

                  function fetchSliderData() {
                    if (rlist.length == 0) {
                      $.ajax({
                        url: "ajax.recentSeen",
                        dataType: "json",
                        success: function (response) {
                          if (response != null) {
                            rlist = response;
                            renderSlider(rlist);
                          }
                        },
                        error: function () {
                          console.error("failed to load data");
                        },
                      });
                    } else {
                      renderSlider(rlist);
                    }
                  }

                  $("#recent_prev").click(function () {
                    if (currentPage > 0) {
                      currentPage -= 1;
                    } else if (currentPage == 0) {
                      currentPage = maxPage;
                    }
                    renderSlider(rlist);
                  });

                  $("#recent_next").click(function () {
                    if (currentPage < maxPage - 1) {
                      currentPage += 1;
                    } else if (currentPage == maxPage - 1) {
                      currentPage = 0;
                    }
                    renderSlider(rlist);
                  });

                  fetchSliderData();
                });
              </script>
         </div>
      </div>
   </div>
</body>
</html>
