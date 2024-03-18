<%@page import="com.cooltrade.chatting.controller.model.vo.Chat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String user = (String)request.getAttribute("userId");
	String seller = (String)request.getAttribute("seller");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
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
        .outer{
        	margin-bottom:100px;
        }

        .wrap {
            padding: 50px 0;
            background-color: #A8C0D6;
            width:700px;
            height:1000px;
            max-height: 600px; /* 채팅창의 최대 높이를 지정합니다. */
            overflow-y: auto; /* 내용이 넘칠 때 스크롤 표시합니다. */
            margin-bottom:50px;
        }
        
        .wrap .chat {
            display: flex;
            align-items: flex-start;
            padding: 20px;
        }
	
		
		
		 .timestamp{
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
        .info {
            display: flex;
            flex-direction : column;
            margin-right: 5px;
            margin-left: 5px;
        }
        .timestamp{
		    white-space: nowrap;
		    padding: 0px 5px 0px 0px;
		}
		.read-status{
			padding: 0px 5px 0px 0px;
		}
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<br><br><br><br>
	<br><br><br><br>
	<br><br>
	<h2><%= (int)request.getAttribute("chatRoomNo") %>번채팅방(구매자:<%= (String)request.getAttribute("userId") %> 판매자:<%= (String)request.getAttribute("seller") %> )</h2>
	<div class="outer">
	<div class="wrap">
		
        
        
        
      
    </div>
    <div align="right">
    <input type="text" id="messageInput" style="width:600px;">
    <button type="submit" onclick="insertReply();">전송</button>
	</div>
	</div>
	<input type="hidden" id="loginUser" value="<%= loginUser.getUserId() %>">
	<input type="hidden" id="user" value="<%= user %>">
	<input type="hidden" id="seller" value="<%= seller %>">
	
	<button onclick="location.href='<%= contextPath %>/apipage.in'">택배배송?</button>
	
	
    <script>
    $(function(){
    	getMessage();
    	setInterval(getMessage, 1000)
    })
    
    function getMessage(){
    		var userId = $("#loginUser").val();
    		var user = $("#user").val();        // 구매자     
    		var pno = $("#seller").val();		// 판매자
            		$.ajax({
            			url:"message.in",
            			data:{loginUser:userId,
            				  userId: user,
            				  pno:pno},
            			success:function(list){
            				let value = ""
            				for(let i=0; i<list.length; i++){
            					if(list[i].sender == userId){
            						value += '<div class="chat ch2">' 
                    				      +  '<div class="icon"><i class="fa-solid fa-user">' + list[i].sender + '</i></div>' 
                    				      +  '<div class="textbox">' + list[i].message + '</div>' 
                    				      +  '<div class="info">'
                    				      +  '<div class="timestamp">' + list[i].messageDate + '</div>'
                    				      +  '<div class="read-status" style="text-align: right;"><p style="color:yellow">' + (list[i].readYn == 'N' ? 1 : '') + '</p></div>' 
                    				      +  '</div>'
                    				      +  '</div>';	
            					}else{
            						value += '<div class="chat ch1">' 
                  				      +  '<div class="icon"><i class="fa-solid fa-user">' + list[i].sender + '</i></div>' 
                  				      +  '<div class="textbox">' + list[i].message + '</div>' 
                  				      +  '<div class="info">'
                  				      +  '<div class="timestamp">' + list[i].messageDate + '</div>'
                  				      +  '<div class="read-status" style="text-align: left;"><p style="color:yellow">' + (list[i].readYn == 'N' ? 1 : '') + '</p></div>' 
                  				      +  '</div>'
                  				      +  '</div>';		
            					}  
            							 
            				}
            				$(".wrap").html(value);
            			},error:function(){
            				console.log("ajax 통신 실패");
            			}
            		});
            	}
    
    function insertReply(){
        var message = $('#messageInput').val().trim(); // 입력된 메시지
        if (message === '') return; // 입력된 메시지가 없으면 종료

        var userId = $("#loginUser").val();
        var chatRoomNo = '<%= (int)request.getAttribute("chatRoomNo")%>'; // 채팅방 번호를 올바른 값으로 대체해야 합니다.

        $.ajax({
            url:"message.insert",
            data:{userId: userId,
                  message: message,
                  chatRoomNo: chatRoomNo},
            success:function(response){
                var chatDiv = $('<div>').addClass('chat ch2');
                var iconDiv = $('<div>').addClass('icon');
                var userIcon = $('<i>').addClass('fa-solid fa-user').text(userId); // 유저 아이콘은 userId로 설정
                iconDiv.append(userIcon);
                var textboxDiv = $('<div>').addClass('textbox').text(response.message); 
                var timestampDiv = $('<div>').addClass('timestamp').text(getCurrentTime());
                var readStatusDiv = $('<div>').addClass('read-status').text('1');
                var infoDiv = $('<div>').addClass('info'); // 새로운 div 추가
                infoDiv.append(timestampDiv, readStatusDiv);
                chatDiv.append(iconDiv, textboxDiv, infoDiv);

                $('.wrap').append(chatDiv); // 채팅창에 메시지 추가
                console.log(chatDiv);
                $('#messageInput').val(''); // 입력 필드 초기화
                scrollToBottom(); // 스크롤을 항상 아래로 이동
            },
            error:function(response){
                console.log("오류");
            }
        });
    }
	
    function getCurrentTime() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var ampm = hours >= 12 ? '오후' : '오전';
        hours = hours % 12;
        hours = hours ? hours : 12; // 0 시간은 12시로 표시
        minutes = minutes < 10 ? '0' + minutes : minutes; // 분이 한 자리 숫자인 경우 앞에 0을 추가
        var timeString = ampm + ' ' + hours + ':' + minutes;
        return timeString;
    }
    
    function scrollToBottom() {
        var wrap = $('.wrap')[0];
        wrap.scrollTop = wrap.scrollHeight;
    }
	
	</script>
    
    <%@ include file="../common/footer.jsp"%>
</body>
</html>