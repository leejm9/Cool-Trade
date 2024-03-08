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
            margin-top: 70px;
            
        }
    td,th{
        border: 1px solid black;
        width: 350px;
        height: 45px;
 
    }
    
    th{
        width: 130px;
        background-color: lightgray ;
        text-align: center !important;
    }

    
    
    
   .inputbox{

      width: 240px;
      height: 30px;
      margin-right: 20px;
    }
    .inputbox1{

    width: 145px;
    height: 30px;
    margin-right: 20px;
       
    }


    .bank{
        height: 30px;
        width: 85px;
    }
  
    button{
        height: 25px;
        width: 70px;
        
    }
    #bottombtn{
        text-align: center;
       
       
    }
    
    .no-delivery-address {
    border: 1px solid #ccc; /* 기본 테두리 색상 */
    padding: 10px;
    text-align: center;
    cursor: default; /* 기본으로는 일반 커서 모양 */
}

  .no-delivery-address:hover {
    border-color: #007bff; /* 호버 시 테두리 색상 변경 */
    cursor: pointer; /* 호버 시 커서 모양 변경 */
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
                <td>&nbsp;<%=name %></td>  
            </tr>
      
            <tr>
                <th>아이디</th>
                <td>&nbsp;<%=id %></td>
                
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>&nbsp;<input type="password" id="pwd" class="inputbox"  value="<%= password %>"><button onclick="btnChangePwd()">변경</button></td>
               
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td>&nbsp;<input type="tel" class="inputbox" id="phone" maxlength='13' value="<%= phone %>"><button onclick="btnChangePhone()">변경</button></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>&nbsp;<input type="email" class="inputbox" id="email" value="<%= email %>"><button onclick="btnChangeEmail()" id="btnCE">변경</button></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>&nbsp;<div id="mainAddress" style="display: inline-block; width: 240px; margin-right: 20px;"><%= request.getAttribute("address") %></div><button type="button" style="vertical-align: super;" onclick="showAddressModal();">선택</button></td>
            </tr>
            <tr>
                <div>
                <th>계좌번호</th>
                <td>&nbsp; 
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
            <table id="delivery-address-list" style="margin-top:0px; width:100%;">
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
                <td><input type="text" class="inputbox" id="delivery-address-title" placeholder="배송지명(최대10글자)"/></td>
              </tr>
              <tr>
                <th>받는사람</th>
                <td><input type="text" class="inputbox" id="delivery-address-name" placeholder="이름입력"/></td>
              </tr>
              <tr>
                <th>전화번호</th>
                <td><input type="text" class="inputbox" id="delivery-address-phone" placeholder="휴대폰 번호"/></td>
              </tr>
              <tr>
                <th>주소검색</th>
                <td>
                <input type="text" class="inputbox" id="delivery-address-address" placeholder="주소 검색" readonly onclick="fnGetPost(fnSetKorPost);"/>
                <input type="hidden" id="delivery-address-postcode"/>
                </td>
              </tr>
              <tr>
                <th>상세주소</th>
                <td><input type="text" class="inputbox" id="delivery-address-detail" placeholder="상세주소(예시:101동101호)"/></td>
              </tr>
              
              <tr>
                <th>대표배송지</th>
                <td><label style="margin:0px;"><input type="radio" name="delivery-address-main_yn" value="Y" checked> Y</label> <label style="margin:0px;"><input type="radio" name="delivery-address-main_yn" value="N"> N</label></td>
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
            <table id="delivery-address-edit-list" style="margin-top:0px;width:100%;">
            </table>
            <button data-dismiss="modal" style="width: 200px; margin-top:50px;" >닫기</button>
          </div>
        </div>
      </div>
    </div>
    
    <script>
      $(document).ready(function() {
    	  
      });
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
        sendVerifyCode();
    	  alert("이메일 변경을 위해 인증번호를 발송 합니다.");
      }
      
      function chnageEmail() {
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
      
      function sendVerifyCode() {
        const email = $('#email').val().trim();
        if (email === "") {
          alert("이메일을 입력해 주세요.");
          $('#email').focus();
          return;
        }

        $("#btnCE").text("발송중").prop("disabled", true);
        $.ajax({
          url : 'sendverifycode.do',
          data : {
            email : email
          },
          success : function(result) {
            if (result == "success") {
              alert("인증번호 발송에 성공했습니다.");
              const verifyCode = prompt("인증번호를 입력해 주세요.");
              if(verifyCode == null) {
            	  alert("이메일이 변경되지 않았습니다.");
            	  location.reload();
            	  return;
              }
              checkVerifyCode(verifyCode)
            } else {
              alert("인증번호 발송에 실패했습니다.");
            }
            $("#btnCE").text("변경").prop("disabled", false);
          }
        });
      }
      
      var IS_VERIFY = false;
      function checkVerifyCode(verifyCode) {
        if (verifyCode === "") {
          alert("인증번호를 입력해 주세요.");
          $('#verifyCode').focus();
          return;
        }
        $.ajax({
          url : 'verifycode.do',
          data : {
            verifyCode : verifyCode
          },
          success : function(result) {
            if (result == "success") {
              alert("인증번호 인증에 성공했습니다.");
              chnageEmail();
              IS_VERIFY = true;
            } else {
              alert("인증번호가 일치하지 않습니다.");
            }
          }
        });
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
        $("#addAddressModal").modal('hide');
        $("#editAddressModal").modal('hide');
    	  $.ajax({
    		  url : 'deliveryaddress/list.do',
    		  success : function(deliveryAddressList) {
    			  var html = '';
    			  for(const deliveryAddress of deliveryAddressList) {
    				  html += `
    	              <tr>
    	                <td>
    	                <div style="position:absolute;right:20px;">\${deliveryAddress.mainYn=='Y'?'(대표배송지)':''}</div>
    	                배송지명 : \${deliveryAddress.title}<br/>
    	                받는사람 : \${deliveryAddress.name}<br/>
    	                주소 : (\${deliveryAddress.postcode}) \${deliveryAddress.address} \${deliveryAddress.detail}<br/>
    	                핸드폰 번호 : \${deliveryAddress.phone}<br/> 
    	                </td>
    	              </tr>
    	              `;
    			  }
    			  if(html == '') {
    				  html = "<tr><td><div class='no-delivery-address'>배송지가 없습니다.</div></td></tr>";
    			  }
    			  $("#delivery-address-list").html(html);
    			  $("#addressModal").modal('show');
    		  }
    	  })
    	  
      }
      function showAddAddressModal() {
    	  if($("#delivery-address-list").find("tr").length >= 5) {
    		  alert("배송지는 최대 5개까지 등록 가능합니다.");
    		  return;
    	  }
    	  
    	  $("#delivery-address-title").val('');
    	  $("#delivery-address-name").val('');
    	  $("#delivery-address-phone").val('');
    	  $("#delivery-address-address").val('');
    	  $("#delivery-address-detail").val('');
    	  $("#delivery-address-postcode").val('');
        $("[name=delivery-address-main_yn][value=Y]").prop('checked', true);
        $("#addressModal").modal('hide');
        $("#addAddressModal").modal('show');
      }
      function showEditAddressModal() {
        $("#addressModal").modal('hide');
        $("#addAddressModal").modal('hide');
        
        $.ajax({
          url : 'deliveryaddress/list.do',
          success : function(deliveryAddressList) {
            var html = '';
            for(deliveryAddress of deliveryAddressList) {
              html += `
                    <tr>
                      <td>
                      <div style="position:absolute;right:20px;">\${deliveryAddress.mainYn=='Y'?'(대표배송지)':''}</div>
                      배송지명 : \${deliveryAddress.title}<br/>
                      받는사람 : \${deliveryAddress.name}<br/>
                      주소 : (\${deliveryAddress.postcode}) \${deliveryAddress.address} \${deliveryAddress.detail}<br/>
                      핸드폰 번호 : \${deliveryAddress.phone}<br/> 
                      </td>
                    </tr>
                    <tr>
	                    <td colspan="2" style="text-align:center;">
	                      <button onclick="modMainAddress(\${deliveryAddress.deliveryAddressNo});" style="width: 200px;" \${deliveryAddress.mainYn=='Y'?'disabled':''}>대표 배송지 설정</button>
	                      <button onclick="delAddress(\${deliveryAddress.deliveryAddressNo});" style="width: 100px;" >삭제</button>
	                    </td>
	                  </tr>
                    `;
            }
            if(html == '') {
              html = "<tr><td><div class='no-delivery-address'>배송지가 없습니다.</div></td></tr>";
            }
            $("#delivery-address-edit-list").html(html);
            $("#editAddressModal").modal('show');
          }
        })
      }
      
      function addAddress() {
        const title = $("#delivery-address-title").val();
        if(title == '') {
          alert("배송지명을 입력해 주세요.");
          return;
        }
        const name = $("#delivery-address-name").val();
        if(name == '') {
          alert("받는사람을 입력해 주세요.");
          return;
        }
        const phone = $("#delivery-address-phone").val();
        if(phone == '') {
          alert("전화번호를 입력해 주세요.");
          return;
        }
    	  const address = $("#delivery-address-address").val();
    	  if(address == '') {
    		  alert("주소를 입력해 주세요.");
    		  fnGetPost(fnSetKorPost);
    		  return;
    	  }
    	  const detail = $("#delivery-address-detail").val();
        if(detail == '') {
          alert("상세주소를 입력해 주세요.");
          return;
        }
        const postcode = $("#delivery-address-postcode").val();
        const mainYn = $("[name=delivery-address-main_yn]:checked").val();
        const deliveryAddress = {
                address : address,
                detail : detail,
                postcode : postcode,
                title : title,
                name : name,
                phone : phone,
                main_yn : mainYn
              };
    	  $.ajax({
    		  url : 'deliveryaddress/add.do',
    		  type : 'post',
    		  data : deliveryAddress,
    		  success : function(result) {
    			  if(result == 'success'){
    				  alert("배송지가 추가 되었습니다.");
    				  if(mainYn == 'Y'){
    					  $("#mainAddress").text(`(\${deliveryAddress.postcode}) \${deliveryAddress.address} \${deliveryAddress.detail}`);
    				  }
    				  showAddressModal();
    			  } else {
    				  alert("배송지 추가에 실패 하였습니다.");
    			  }
    		  }
    	  })
      }

      function delAddress(deliveryAddressNo) {
        $.ajax({
          url : 'deliveryaddress/del.do',
          type : 'post',
          data : {
            deliveryAddressNo : deliveryAddressNo
          },
          success : function(result) {
            if(result == 'success'){
              alert("배송지가 삭제 되었습니다.");
              showAddressModal();
            } else {
              alert("배송지 삭제에 실패 하였습니다.");
            }
          }
        });
      }
      
      function modMainAddress(deliveryAddressNo) {
    	  $.ajax({
          url : 'deliveryaddress/mod.do',
          type : 'post',
          data : {
        	  deliveryAddressNo : deliveryAddressNo
          },
          success : function(result) {
            if(result == 'success'){
              alert("대표 배송지로 설정 되었습니다.");
              $("#mainAddress").text(`(\${deliveryAddress.postcode}) \${deliveryAddress.address} \${deliveryAddress.detail}`);
              showAddressModal();
            } else {
              alert("대표 배송지 설정에 실패 하였습니다.");
            }
          }
        });
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
   	    $("#delivery-address-postcode").val(zonecode);
   	    $("#delivery-address-address").val(data.roadAddress); // 설치 주소1 (도로명 주소) (roadAddress)
   	  }
      
      document.getElementById('phone').addEventListener('input', function (e) {
    	  var value = e.target.value.replace(/\D/g, ""); // 숫자가 아닌 문자는 제거
    	  var formattedValue = "";

    	  // 첫 번째 그룹(최대 3자리)
    	  if (value.length > 3) {
    	    formattedValue += value.substr(0, 3) + "-";
    	    value = value.substr(3);
    	  }

    	  // 두 번째 그룹(최대 4자리)
    	  if (value.length > 4) {
    	    formattedValue += value.substr(0, 4) + "-";
    	    value = value.substr(4);
    	  }

    	  // 나머지 숫자 추가
    	  formattedValue += value;

    	  e.target.value = formattedValue; // 형식이 지정된 문자열로 값 업데이트
    	});

    </script>

</body>
</html>