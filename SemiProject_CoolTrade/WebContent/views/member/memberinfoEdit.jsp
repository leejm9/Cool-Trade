<%@page import="com.cooltrade.member.model.vo.BankAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	Member member = (Member) request.getAttribute("member"); 
	String id = member.getUserId();
	String name = member.getUserName();
	String password = member.getUserPwd();
	String phone = member.getPhone();
	String email = member.getEmail();
	
	BankAccount bankAccount = (BankAccount) request.getAttribute("bankAccount");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
      
      #mypage-wrap {
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

    #table{
            border-collapse : collapse;
            margin-top: 50px;
            
        }
    td,th{
        border: 1px solid black;
        width: 325px;
        height: 30px;
 
    }
    
    th{
        width: 130px;
        background-color: lightgray ;
    }
   .inputbox{

      width: 240px;
      height: 20px;
      margin-right: 6px;
    }
    .inputbox1{

    width: 150px;
    height: 20px;
    margin-right: 6px;
       
    }


    .bank{
        height: 25px;
        width: 85px;
    }
  
    button{
        height: 25px;
        width: 70px;
        
    }
    #bottombtn{
        text-align: center;
       
       
    }
    
  
    </style>
</head>
<body>
<%@ include file = "../common/header.jsp" %>

    <div id="mypage-wrap">
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
                                    <a href="<%= contextPath %>/infoedit.me">회원정보 수정</a>
                                </li>
                                <li class="sub-title-list">
                                    <a href="<%= contextPath %>/review.me">거래 후기</a>
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
    
    
    <div class="outer">
    
       <table id="table">
       
            <tr>
                <th>이름</th>
                <td><%=name %></td>  
            </tr>
      
            <tr>
                <th>아이디</th>
                <td><%=id %></td>
                
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" id="pwd" class="inputbox"  value="<%= password %>"><button onclick="btnChangePwd()">변경</button></td>
               
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td><input type="text" class="inputbox" id="phone" value="<%= phone %>"><button onclick="btnChangePhone()">변경</button></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" class="inputbox" id="email" value="<%= email %>"><button onclick="btnChangeEmail()">변경</button></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="address" class="inputbox"><button type="button" onclick="showAddressModal();">선택</button></td>
            </tr>
            <tr>
                <div>
                <th>계좌번호</th>
                <td> 
                      <select class="bank" id="bank">
                        <option value="국민은행" <%= "국민은행".equals(bankAccount.getBank())?"selected":"" %>>국민은행</option>
                        <option value="농협은행" <%= "농협은행".equals(bankAccount.getBank())?"selected":"" %>>농협은행</option>
                        <option value="신한은행" <%= "신한은행".equals(bankAccount.getBank())?"selected":"" %>>신한은행</option>
                        <option value="IBK기업은행" <%= "IBK기업은행".equals(bankAccount.getBank())?"selected":"" %>>IBK기업은행</option>
                        <option value="SC제일은행" <%= "SC제일은행".equals(bankAccount.getBank())?"selected":"" %>>SC제일은행</option>
                      </select>
                      <input type="text" class="inputbox1" id="account" value="<%= bankAccount.getAccount() %>"><button onclick="saveBankAccount();">변경</button></td>
            </tr>

        
    </table>
    <br>
    <div id="bottombtn" align="center">
        <!-- <button type="submit" >정보변경</button> -->
        <button type="button" data-toggle="modal" data-target="#deleteModal">회원탈퇴</button>
    </div>
    <!-- 회원탈퇴용 Modal -->
    <div class="modal" id="deleteModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">회원 탈퇴</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        
       	<b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
       	
       	비밀번호 : <input type="password" name="userPwd" id="userPw" required > <br><br>
       	<button onclick="deleteMember();" >탈퇴하기</button>
		
        </div>
      </div>
    </div>
    </div>
    <!-- 주소록 Modal -->
    <div class="modal" id="addressModal">
       <div class="modal-dialog">
        <div class="modal-content">
  
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">배송지 목록</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	  
	        <!-- Modal body -->
	        <div class="modal-body" align="center">
	          <div style="text-align:right"><a href="javascript:showEditAddressModal();">편집하기</a></div>
            <table id="table" style="margin-top:0px;">
              <tr>
                <td style="border-right:0px;">
                배송지명 : <br/>
                주소 : <br/>
                핸드폰 번호 : <br/> 
                </td>
                <td style="border-left:0px; text-align: right; vertical-align: top">
                (대표배송지)
                </td>
              </tr>
            </table>
	        <button onclick="showAddAddressModal();" style="width: 200px; margin-top:50px;" >+ 배송지 추가</button>
	        </div>
	      </div>
	    </div>
    </div>
    <!-- 주소록 Modal -->
    <div class="modal" id="addAddressModal">
       <div class="modal-dialog">
        <div class="modal-content">
  
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">배송지 추가</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body" align="center">
            <table id="table" style="margin-top:0px;">
              <tr>
                <th>배송지명</th>
                <td><input type="text" class="inputbox"/></td>
              </tr>
              <tr>
                <th>받는사람</th>
                <td><input type="text" class="inputbox"/></td>
              </tr>
              <tr>
                <th>전화번호</th>
                <td><input type="text" class="inputbox"/></td>
              </tr>
              <tr>
                <th>주소검색</th>
                <td>
                <input type="text" class="inputbox" id="address-for-add" readonly onclick="fnGetPost(fnSetKorPost);"/>
                <input type="hidden" id="postcode-for-add"/>
                </td>
              </tr>
              <tr>
                <th>상세주소</th>
                <td><input type="text" class="inputbox" id="detail-for-add"/></td>
              </tr>
              
              <tr>
                <th>대표배송지</th>
                <td><label><input type="radio" name="main_yn-for-add"> Y</label> <label><input type="radio" name="main_yn-for-add"> N</label></td>
              </tr>
            </table>
          <button onclick="addAddress();" style="width: 200px; margin-top:50px;" >저장</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 주소록 Modal -->
    <div class="modal" id="editAddressModal">
       <div class="modal-dialog">
        <div class="modal-content">
  
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">배송지 편집</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body" align="center">
            <table id="table" style="margin-top:0px;">
              <tr>
                <td style="border-right:0px;">
	                배송지명 : <br/>
	                주소 : <br/>
	                핸드폰 번호 : <br/> 
                </td>
                <td style="border-left:0px; text-align: right; vertical-align: top">
	                (대표배송지)
                </td>
              </tr>
              <tr>
                <td colspan="2" style="text-align:center;">
	                <button onclick="showAddAddressModal();" style="width: 200px;" >대표 배송지 설정</button>
	                <button onclick="showAddAddressModal();" style="width: 100px;" >삭제</button>
                </td>
              </tr>
            </table>
            <button data-dismiss="modal" style="width: 200px; margin-top:50px;" >닫기</button>
          </div>
        </div>
      </div>
    </div>
    
    <script>
      function btnChangePwd() {
    	  const pwd = $("#pwd").val();
    	  if(pwd == '') {
    		  alert("비밀번호를 입력해주세요.");
    		  $("#pwd").focus();
    		  return;
    	  }
    	  $.ajax({
    		  url : 'changepwd.do',
    		  data : {
    			  id : '<%= id %>',
    			  password : pwd
    		  },
    		  success : function(result) {
    			  if(result === 'success') {
    				  alert("비밀번호가 변경되었습니다.");
    			  } else {
    				  alert("비밀번호 변경에 실패하였습니다.");
    			  }
    		  }
    	  })
      }

      function btnChangePhone() {
        const phone = $("#phone").val();
        if(phone == '') {
          alert("휴대폰번호를 입력해주세요.");
          $("#phone").focus();
          return;
        }
        $.ajax({
          url : 'changephone.do',
          data : {
            phone : phone
          },
          success : function(result) {
            if(result === 'success') {
              alert("휴대폰번호가 변경되었습니다.");
            } else {
              alert("휴대폰번호 변경에 실패하였습니다.");
            }
          }
        })
      }

      function btnChangeEmail() {
        const email = $("#email").val();
        if(email == '') {
          alert("이메일을입력해주세요.");
          $("#email").focus();
          return;
        }
        $.ajax({
          url : 'changeemail.do',
          data : {
            email : email
          },
          success : function(result) {
            if(result === 'success') {
              alert("이메일이 변경되었습니다.");
            } else {
              alert("이메일 변경에 실패하였습니다.");
            }
          }
        })
      }

      function saveBankAccount() {
        const account = $("#account").val();
        if(account == '') {
          alert("계좌번호를 입력해주세요.");
          $("#account").focus();
          return;
        }
        $.ajax({
          url : 'savebankaccount.do',
          data : {
            account : account,
            bank : $("#bank").val()
          },
          success : function(result) {
            if(result === 'success') {
              alert("계좌번호가 변경되었습니다.");
            } else {
              alert("계좌번호 변경에 실패하였습니다.");
            }
          }
        })
      }
      
      function deleteMember() {
        const userPw = $("#userPw").val();
        if(userPw == '') {
          alert("비밀번호를 입력해주세요.");
          $("#userPw").focus();
          return;
        }
        $.ajax({
          url : 'deletemember.do',
          data : {
          	userPw : userPw
          },
          success : function(result) {
            if(result === 'success') {
              alert("회원 탈퇴 되었습니다.");
              location.reload();
            } else if(result === 'pwFail') {
              alert("비밀번호가 일치하지 않습니다.");
            } else {
              alert("회원 탈퇴에 실패하였습니다.");
            }
          }
        })
      }
      function showAddressModal() {
    	  $("#addressModal").modal('show');
      }
      function showAddAddressModal() {
        $("#addressModal").modal('hide');
        $("#addAddressModal").modal('show');
      }
      function showEditAddressModal() {
        $("#addressModal").modal('hide');
        $("#addAddressModal").modal('hide');
        $("#editAddressModal").modal('show');
      }
      
      /**
       * 우편번호
       */
      function fnGetPost(functionName) {
        daum.postcode.load(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                  var zonecode = data.zonecode; // 우편번호 (zonecode)
                  var roadAddress = data.roadAddress; // 설치 주소1 (도로명 주소) (roadAddress)
                  // 설치 주소2 (상세 주소)
                  var bcode = data.bcode; // 행정구역 코드 정보 (bcode)
                  var sigunguCode = data.sigunguCode;   // 시군군 코드
                  var roadnameCode = data.roadnameCode; // 도로명 코드 정보 (roadnameCode)
                  var buildingCode = data.buildingCode; // 건물관리 코드 정보 (buildingCode)
                  var apartment = data.apartment; // 공동주택여부(1 : 공동주택, 0 : 비공동주택) (apartment)
                  var buildingName = data.buildingName; // 건물명 정보 (buildingName)

                  //fnSetPost(functionName, data);
                  functionName(data);
                }
            }).open();
        });
      }
      
      function fnSetKorPost(data) {
   	    var zonecode = data.zonecode; // 우편번호 (zonecode)
   	    var roadAddress = data.roadAddress; // 설치 주소1 (도로명 주소) (roadAddress)
   	    $("#postcode-for-add").val(zonecode);
   	    $("#address-for-add").val(data.roadAddress); // 설치 주소1 (도로명 주소) (roadAddress)
   	  }
    </script>

</body>
</html>