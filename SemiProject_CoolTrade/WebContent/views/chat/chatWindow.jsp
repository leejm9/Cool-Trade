<%@page import="com.cooltrade.chatting.controller.model.vo.ChatRoom"%> <%@page
import="com.cooltrade.chatting.controller.model.vo.Chat"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%
String user = (String)request.getAttribute("userId"); String seller =
(String)request.getAttribute("seller"); ChatRoom c =
(ChatRoom)request.getAttribute("c"); %>
<!DOCTYPE html>
<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      }

      a {
        text-decoration: none;
      }
      .outer {
        margin-bottom: 100px;
        width: 1000px;
      }

      .wrap {
        /*             padding: 50px 0; */
        background-color: #e6e6e6;
        width: 100%;
        height: 100%;
        max-height: 100%; /* 채팅창의 최대 높이를 지정합니다. */
        overflow-y: auto; /* 내용이 넘칠 때 스크롤 표시합니다. */
        /*             margin-bottom:50px; */
      }

      .wrap .chat {
        display: flex;
        align-items: flex-start;
        padding: 10px;
      }

      .timestamp {
        position: relative;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
      }

      .wrap .chat .icon {
        position: relative;
        overflow: hidden;
        width: 50px;
        height: 50px;
        min-width: 50px;
        min-height: 50px;
        border-radius: 30%;
        background-color: #eee;
      }

      .wrap .chat .icon i {
        position: absolute;
        top: 10px;
        left: 50%;
        font-size: 0.8rem;
        line-height: 30px;
        color: #aaa;
        transform: translateX(-50%);
      }

      .wrap .chat .textbox {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
      }

      .wrap .chat .textbox::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
      }

      .wrap .ch1 .textbox {
        margin-left: 20px;
        background-color: #ddd;
      }

      .wrap .ch2 {
        flex-direction: row-reverse;
      }

      .wrap .ch2 .textbox {
        margin-right: 20px;
        background-color: #04b4fc;
        color: black;
      }

      .wrap-outer {
        width: 500px;
        height: 700px;
        margin: auto;
        border: 1px solid #e6e6e6;
        border-radius: 10px;
      }

      .wrap-header {
        height: 10%;
        display: flex;
        align-items: center;
        padding: 0px 10px;
      }

      .wrap {
        height: 80%;
      }

      .wrap-footer {
        height: 10%;
      }

      .wrap-footer {
        background-color: #e6e6e6;
        display: flex;
        align-items: center;
        justify-content: space-around;
        border-radius: 0px 0px 5px 5px;
      }

      .wrap-footer-area {
        width: 90%;
        height: 50%;
        background: white;
        border: 1px solid #e3e3e3;
        border-radius: 20px;
        display: flex;
        align-items: center;
      }

      .wrap-footer-area-div {
        display: flex;
        width: 98%;
        justify-content: space-around;
      }

      #messageInput {
        border: none;
        outline: none;
        padding: 0px 10px;
      }

      .btn-image {
        width: 35px; /* 버튼의 너비 설정 */
        height: 25px; /* 버튼의 높이 설정 */
        border: none; /* 필요 시 버튼 테두리 제거 */
        background: none;
      }

      .title-img {
        width: 50px;
        height: 50px;
      }

      h3 {
        text-align: middle;
      }

      .btn-img {
        width: 30px;
        height: 25px;
      }
      .info {
        display: flex;
        flex-direction: column;
        margin-right: 5px;
        margin-left: 5px;
      }
      .timestamp {
        white-space: nowrap;
        padding: 0px 5px 0px 0px;
      }
      .read-status {
        padding: 0px 5px 0px 0px;
      }
      .ch2 button:hover{
		cursor: not-allowed;
      }
      .ch1 button{
      border : none;
      padding: 2px;
      }
      .ch1 button:hover{
      color: #04b4fc;
      background-color: gray;
      }
    </style>
  </head>
  <body>
    <%@ include file="../common/header.jsp"%> <% String loginId =
    loginUser.getUserId(); %>
    <br /><br /><br /><br />
    <br /><br /><br /><br />
    <br /><br />
<!--     <h2> -->
<%--       <%= (int)request.getAttribute("chatRoomNo") %>번채팅방(구매자:<%= --%>
<%--       (String)request.getAttribute("userId") %> 판매자:<%= --%>
<%--       (String)request.getAttribute("seller") %> ) --%>
<!--     </h2> -->
    <div class="outer">
      <div class="wrap-outer">
        <div class="wrap-header">
          <% if(loginId.equals(user)) { %> <% if(c.getSellerTitleImg() == null)
          { %>
          <div>
            <img src="resources/images/user-icon.png" class="title-img" />
          </div>
          <% } else { %>
          <div class="title-img">
          	<img src="<%= contextPath %>/<%= c.getSellerTitleImg() %>" class="title-img">
          </div>
          <% } %>
          <div><%= c.getSellerNickname() %></div>
          <% } else { %> <% if(c.getBuyerTitleImg() == null) { %>
          <div>
            <img src="resources/images/user-icon.png" class="title-img" />
          </div>
          <% } else { %>
          <div class="title-img">
          	<img src="<%= contextPath %>/<%= c.getSellerTitleImg() %>" class="title-img">
          </div>
          <% } %>
          <div><%= c.getBuyerNickname() %></div>
          <% } %>
        </div>
        <div class="wrap" id="container"></div>
        <div class="wrap-footer">
          <div class="wrap-footer-area">
            <div align="center" class="wrap-footer-area-div">
              <input type="text" id="messageInput" style="width: 370px" />
              <button type="submit" class="btn-image" onclick="insertReply();">
                <img class="btn-img" src="resources/images/icon-send.png" />
              </button>
            </div>
          </div>
        </div>
      </div>
      <div align="right" style="display: none">
        <input type="text" id="messageInput" style="width: 600px" />
        <!-- <button type="submit" onclick="insertReply();">전송</button> -->
      </div>
    </div>
<!--     <div class="wrap-footer"> -->
<!--     	<div class="wrap-footer-area"> -->
<!--    		    <div align="center" class="wrap-footer-area-div"> -->
<!-- 			    <input type="text" id="messageInput" style="width:370px;"> -->
<!-- 			    <button type="submit" class="btn-image" onclick="insertReply();"> -->
<!-- 			    	<img class="btn-img" src="resources/images/icon-send.png"> -->
<!-- 			    </button> -->
<!-- 			</div> -->
<!--     	</div> -->
<!--     </div> -->
<!--     </div> -->
<!--     <div align="right" style="display: none;"> -->
<!--     <input type="text" id="messageInput" style="width:600px;"> -->
<!--     <button type="submit" onclick="insertReply();">전송</button> --> 
<!-- 	</div> -->
	</div>
	<input type="hidden" id="loginUser" value="<%= loginUser.getUserId() %>">
	<input type="hidden" id="user" value="<%= user %>">
	<input type="hidden" id="seller" value="<%= seller %>">
	
    <script>
      $(function () {
    	  
        getMessage();
        setInterval(getMessage, 500);
      });

      $(document).ready(function () {
        $("#messageInput").keydown(function (e) {
          if (e.keyCode === 13 || e.key === "Enter") {
            $("#messageInput+button").click();
          }
        });
      });

      $(document).on('click', '.ch2 #tradeCancel', function() {
    	  console.log($("#pno").val());
    	    $.ajax({
    	    	url : "ajaxtrade.cancel",
    	    	type : "post",
    	    	data : {
    	    		pno : $("#pno").val(),
    	    		originalString : $(this).parent().html()	
    	    		},
    	    	success : function(response){
    	    		console.log(response);
    	    		disableButtons(2);
    	    	},
    	    	error : function (){
    	    		console.log("error");
    	    	}
    	    });
    	});
      
      $(document).on('click', '.ch2 #tradeComplete', function() {
    	  console.log($("#pno").val());
    	    $.ajax({
    	    	url : "ajaxtrade.complete",
    	    	type : "post",
    	    	data : {
    	    		pno : $("#pno").val(),
    	    		originalString : $(this).parent().html()	
    	    		},
    	    	success : function(response){
    	    		console.log(response);
    	    		disableButtons(1);
    	    	},
    	    	error : function (){
    	    		console.log("error");
    	    	}
    	    });
    	});
      function disableButtons(data){
    	  if(data === 1){
    	  alert("거래가 완료되었습니다.");
    	  }else if(data === 2){
    	  alert("거래가 취소되었습니다.");
    	  }
    	  location.reload();
      }
      var count = 0;
      function getMessage() {
    	  count++;
        var userId = $("#loginUser").val();
        var user = $("#user").val(); // 구매자
        var pno = $("#seller").val(); // 판매자
        var container = document.getElementById("container");
        
        
        var saveListLength = 0;
        $.ajax({
          url: "message.in",
          data: { loginUser: userId, userId: user, pno: pno },
          success: function (list) {
            let value = "";
            var currentListLength = list.length;
            
            
            for (let i = 0; i < list.length; i++) {
              if (list[i].sender == userId) {
                value +=
                  '<div class="chat ch2">' +
                  '<div class="icon"><i class="fa-solid fa-user">' +
                  list[i].sender +
                  "</i></div>" +
                  '<div class="textbox">' +
                  list[i].message +
                  "</div>" +
                  '<div class="info">' +
                  '<div class="timestamp">' +
                  list[i].messageDate +
                  "</div>" +
                  '<div class="read-status" style="text-align: right;"><p style="color:yellow">' +
                  (list[i].readYn == "N" ? 1 : "") +
                  "</p></div>" +
                  "</div>" +
                  "</div>";
              } else {
                value +=
                  '<div class="chat ch1">' +
                  '<div class="icon"><i class="fa-solid fa-user">' +
                  list[i].sender +
                  "</i></div>" +
                  '<div class="textbox">' +
                  list[i].message +
                  "</div>" +
                  '<div class="info">' +
                  '<div class="timestamp">' +
                  list[i].messageDate +
                  "</div>" +
                  '<div class="read-status" style="text-align: left;"><p style="color:yellow">' +
                  (list[i].readYn == "N" ? 1 : "") +
                  "</p></div>" +
                  "</div>" +
                  "</div>";
              }
              
              
            }
            $(".wrap").html(value);
            if(count === 1){
            	container.scrollTop = container.scrollHeight-container.clientHeight;
            }
            
            console.log(container.scrollHeight-container.clientHeight);
            console.log(container.scrollTop);
            if((container.scrollHeight-container.clientHeight-container.scrollTop) <100){
            	container.scrollTop = container.scrollHeight-container.clientHeight;
            }
          },
          error: function () {
            console.log("ajax 통신 실패");
          },
        });
      }

      function insertReply() {
        var message = $("#messageInput").val().trim(); // 입력된 메시지
        if (message === "") return; // 입력된 메시지가 없으면 종료

        var userId = $("#loginUser").val();
        var chatRoomNo = '<%= (int)request.getAttribute("chatRoomNo")%>'; // 채팅방 번호를 올바른 값으로 대체해야 합니다.

        $.ajax({
          url: "message.insert",
          data: { userId: userId, message: message, chatRoomNo: chatRoomNo },
          success: function (response) {
            var chatDiv = $("<div>").addClass("chat ch2");
            var iconDiv = $("<div>").addClass("icon");
            var userIcon = $("<i>").addClass("fa-solid fa-user").text(userId); // 유저 아이콘은 userId로 설정
            iconDiv.append(userIcon);
            var textboxDiv = $("<div>")
              .addClass("textbox")
              .text(response.message);
            var timestampDiv = $("<div>")
              .addClass("timestamp")
              .text(getCurrentTime());
            var readStatusDiv = $("<div>").addClass("read-status").text("1");
            var infoDiv = $("<div>").addClass("info"); // 새로운 div 추가
            infoDiv.append(timestampDiv, readStatusDiv);
            chatDiv.append(iconDiv, textboxDiv, infoDiv);

            $(".wrap").append(chatDiv); // 채팅창에 메시지 추가
            $("#messageInput").val(""); // 입력 필드 초기화
            scrollToBottom(); // 스크롤을 항상 아래로 이동
          },
          error: function (response) {
            console.log("오류");
          },
        });
      }

      function getCurrentTime() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var ampm = hours >= 12 ? "오후" : "오전";
        hours = hours % 12;
        hours = hours ? hours : 12; // 0 시간은 12시로 표시
        minutes = minutes < 10 ? "0" + minutes : minutes; // 분이 한 자리 숫자인 경우 앞에 0을 추가
        var timeString = ampm + " " + hours + ":" + minutes;
        return timeString;
      }

      function scrollToBottom() {
        var wrap = $(".wrap")[0];
        wrap.scrollTop = wrap.scrollHeight;
      }
    </script>

    <%@ include file="../common/footer.jsp"%>
  </body>
</html>
