<%@page import="com.cooltrade.product.model.vo.Search"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ArrayList<Search> popularWordList = (ArrayList<Search>)request.getAttribute("popularWordList"); 
	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.css" rel="stylesheet">
    
    
    
    <style>
    	.outouter th{
    		background-Color:rgb(208, 208, 208);
    	}
    	#searchRank{
    		width:975px;
    		height:700px;
    	}
    	.div>div{
    		width:100%;
    	}
    	.div{ height:8%;}
    	.outer>div{
    		width:500px;
    	}
    	.outer2{
    		width:1000px;
    		height:700px;
    	}
		.outer2 tr{
			width:100%;
		}    	
		.outer{
			width:100%;
		}
    </style>
    
    
</head>
<body>
	<%@ include file = "../common/managerMenubar.jsp" %>
	<div class="outouter">
	<div class="outer" style="margin-left:420px;">
	<div class="div">
	<h3>DB검색화면</h3>
	<div text-align="left">
	<button onclick="fn_chkAdd();" class="btn btn-warning" style="margin-bottom:5px;">추가</button>
	</div>
		<table id="searchRank" class="table table-bordered">
			<colgroup>
				<col style="width: 55px;">
				<col style="width: 70px;">
				<col style="width: *;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" name="chkAllone"
						id="chkAllone" value="Y" title="전체선택/해제"
						onclick="fn_displayBlockCheckAll(this);" /></th>
					<th scope="col">순위</th>
					<th scope="col">DB 제목</th>
				</tr>
			</thead>
			<tbody id="popularWordList">
				<c:forEach var="popular" items="${popularWordList}"
					varStatus="status">
					<tr id="wordList${status.count}" class="tac">
						<td class="text-c"><input type="checkbox" name="chkIdone"
							id="popWord${status.count}" value="${popular.popwWord}"></td>
						<td style="text-align: center;">${listNo+status.count}</td>
						<td style="text-align: center;">${popular.popwWord}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
	<div class="text-center dataTables_paginate paging_simple_numbers"
		id="example1_paginate">
		<ul class="pagination justify-content-end">
			<c:forEach varStatus="status" begin="1"
				end="${endValue}">
				<button id="page${status.count}" class="paginate_button"><a	href="#none" onclick="goPage(${status.count-1})">${status.count}</a></button>
			</c:forEach>
		</ul>
	</div>
	</div>
	</div>

	
	
	
	
	<div class="outer2">
	<form action="show.popw">
	<div class="col-sm-12" style="margin-left:407px;">
		<div class="tbl-top-area">
			<div class="tit">
				<h4 class="box-title">사용자 화면 검색 순위</h4>
			</div>
			<div class="btn" text-align="left">
				<button type="button" class="btn btn-warning" onclick="fn_chkDel()">삭제</button>
			</div>
		</div>
		<table class="table table-bordered">
			<colgroup>
				<col style="width: 55px;">
				<col style="width: 70px;">
				<col style="width: *;">
				<col style="width: 70px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" name="chkAlltwo"
						id="chkAlltwo" value="Y" title="전체선택/해제"
						onclick="fn_displayBlockCheckAll2(this)" /></th>
					<th scope="col">순위</th>
					<th scope="col">사용자화면</th>
					<th scope="col">위치</th>
				</tr>
			</thead>
			<tbody id="usrPopTable">
				<c:forEach var="Userpopular" items="${UserpopularWordList}"
					varStatus="status">
					<tr class="tac" id="usrWordForm${status.count}" name="usrWordForm">
						<td class="text-c"><input type="checkbox" name="chkIdtwo"
							id="usrWord${status.count}"></td>
						<td class="countNum" style="text-align: center;">${status.count}</td>
						<td style="text-align: center;">
							<div class="form-inline">
								<input type="text" name="usrPopWord"
									id="usrPopWord${status.count}" maxlength="40"
									value="${Userpopular.userPopwWord}"
									class="required form-control input-sm f-wd-300px">
							</div>
						</td>
						<td id="sortBtn" class="text-c">
							<div class='btn-group-vertical' style='width: 20px;'>
								<button type="button" id="upBtn"
									class='btn btn-primary btn-xs up' class="sort-btn">
									<span class='fa fa-sort-up'></span>
								</button>
								<button type="button" id="downBtn"
									class='btn btn-primary btn-xs down' class="sort-btn">
									<span class='fa fa-sort-desc'></span>
								</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary" onclick="return dsave();">저장</button>
	</div>
	</form>
	</div>
	</div>
	
	<script>
		
	
		var list = "${fn:length(popularWordList)}";
		    
		function fn_displayBlockCheckAll(checkbox){
			
			var checkbox = $(checkbox);
			
			$("#chkAllone").change(function(){
				if(checkbox.is(':checked')){
					$("#popularWordList input").prop("checked",true);
				}else{
					$("#popularWordList input").prop("checked",false);
				}
			})
			
			
		}
		
		function fn_displayBlockCheckAll2(checkbox){
			
			var checkbox = $(checkbox);
			
			$("#chkAlltwo").change(function(){
				if(checkbox.is(':checked')){
					$("#usrPopTable input").prop("checked",true);
				}else{
					$("#usrPopTable input").prop("checked",false);
				}
			})
			
			
		}
		
		
		
		$(document).ready(function() {
		    for (var a = 1; a <= list; a++) {
		        $("#wordList" + a).hide();
		    }
		    var maxToShow = Math.min(list, 10); // list와 10 중 작은 값을 선택
		    for (var b = 1; b <= maxToShow; b++) {
		        $("#wordList" + b).show();
		    }

		    $("#page1").addClass("active");
		    $("#page1").addClass("on");
		});
		
		function goPage(page)
		{
			var firstIndex = (page*10)+1;
			var lastIndex = (page+1)*10;
			var pageButton = $(".paginate_button");

			if(pageButton.hasClass("active")&&pageButton.hasClass("on")){
				pageButton.removeClass("active");
				pageButton.removeClass("on");
			}
			for(c=1 ; c<=list ; c++){
				if($("#wordList"+c).css("display") != "none") $("#wordList"+c).hide();
			}
			for(d=firstIndex ; d<=lastIndex ; d++){
				$("#wordList"+d).show();
			}

			$("#page"+(page+1)).addClass("active");
			$("#page"+(page+1)).addClass("on");
			$("input[name=chkAllone]").prop("checked", false);
			$("input[name=chkIdone]").prop("checked", false);
		}
		
		function fn_chkAdd()
		{
			var userWord = $(".tac").find(".form-inline").length;
			var chkIdone = $("input[name=chkIdone]:checked");

			var chkarr = new Array();

			chkIdone.each(function(){
				chkarr.push($(this).val());
			});

			if(chkIdone.length == 0){
				alert("추가할 검색어를 선택해주세요.");
				return false;
			}
			else{
				if(userWord + chkIdone.length > 10){
					alert("검색 항목이 초과되었습니다.");
					return false;
				}
				else{
					var sortBtn = '<div class="btn-group-vertical" style="width: 20px;"><button type="button" id="upBtn" class="btn btn-primary btn-xs up" class="sort-btn"><span class="fa fa-sort-up"></span></button>';
					sortBtn += '<button type="button" id="downBtn" class="btn btn-primary btn-xs down" class="sort-btn"><span class="fa fa-sort-desc"></span></button></div>';
					$("#usrPopTable").children("tr:eq("+(userWord-1)+")").find("#sortBtn").html(sortBtn);
					for(a=1;a<=chkIdone.length;a++){
						var idIndex = getidIndex();
						var html = '';
						html += '<tr class="tac" id="usrWordForm'+idIndex+'" name="usrWordForm">';
						html += '<td class="text-c"><input type="checkbox" name="chkIdtwo" value="${YourValue}" id="usrWord'+idIndex+'"></td>';
						html += '<td class="countNum" style="text-align:center;">'+(userWord+1)+'</td>';
						html += '<td style="text-align:center;"><div class="form-inline">';
						html += '<input type="text" name="usrPopWord" id="usrPopWord'+idIndex+'" maxlength="40" value="'+chkarr[a-1]+'" class="required form-control input-sm f-wd-300px" >';
						html += '</div></td>';
						html += '<td id="sortBtn" class="text-c">';
						html += sortBtn;
						html += '</td></tr>';

						$("#usrPopTable").append(html);
						userWord++;
					}
					sortBtnUpdate();
				}
			}
		}
		function getidIndex()
		{
			var len = 10;
			var userid = getRandomNumber()+1;
			var docObj = $("#usrWordForm"+userid);

			while(docObj.length != 0){
				userid = getRandomNumber()+1;
				docObj = $("#usrWordForm"+userid);
			}
			return userid;
		}
		
		function getRandomNumber()
		{
			var num = "0123456789";
			var rnum = Math.floor(Math.random() * num.length);

			return rnum;
		}
		
		function sortBtnUpdate()
		{
			var userWord = $(".tac").find(".form-inline").length;

			$("#usrPopTable").children("tr:eq(0)").find("#upBtn").remove();
			$("#usrPopTable").children("tr:eq("+(userWord-1)+")").find("#downBtn").remove();
		}
		
	// ---------------------사용자 화면-------------------------
	
		$(document).ready(function(){
		
				// append 이후 버튼 동적클릭
				$(document).on("click",".up",function()
				{
					var index = $(this).parents("tr").index();
		
					var clickValue = $("#usrPopTable").children("tr:eq("+(index)+")").find("input[name=usrPopWord]").val();
					var prevValue = $("#usrPopTable").children("tr:eq("+(index-1)+")").find("input[name=usrPopWord]").val();
		
					temp = clickValue;
					clickValue = prevValue;
					prevValue = temp;
		
					$("#usrPopTable").children("tr:eq("+(index)+")").find("input[name=usrPopWord]").val(clickValue);
					$("#usrPopTable").children("tr:eq("+(index-1)+")").find("input[name=usrPopWord]").val(prevValue);
				});
		
				$(document).on("click",".down",function()
				{
					var index = $(this).parents("tr").index();
		
					var clickValue = $("#usrPopTable").children("tr:eq("+(index)+")").find("input[name=usrPopWord]").val();
					var nextValue = $("#usrPopTable").children("tr:eq("+(index+1)+")").find("input[name=usrPopWord]").val();
		
					temp = clickValue;
					clickValue = nextValue;
					nextValue = temp;
		
					$("#usrPopTable").children("tr:eq("+(index+1)+")").find("input[name=usrPopWord]").val(nextValue);
					$("#usrPopTable").children("tr:eq("+(index)+")").find("input[name=usrPopWord]").val(clickValue);
				});
		});
		
		function fn_chkDel() {
		    var delSize = $("input[name=chkIdtwo]:checked").length;
		    var userWord = $(".tac").find(".form-inline").length;

		    if (delSize == 0) {
		        alert("삭제할 검색어를 선택해주세요.");
		        return false;
		    } else {
		        for (var a = 1; a <= 10; a++) {
		            if ($("#usrWord" + a).is(":checked") == true) {
		                $("#usrWordForm" + a).remove();
		            }
		        }
		        renumbering(); // 순위 다시 지정
		        sortBtnUpdate();
		    }
		}

		function renumbering() {
		    var userWord = $(".tac").find(".form-inline").length;

		    for (var b = 1; b <= userWord; b++) {
		        $("#usrPopTable").children("tr:eq(" + (b - 1) + ")").find(".countNum").text(b);
		    }
		}
		
		function dsave() {
		    var list = [];
		    $("#usrPopTable input").each(function() {
		        var value = $(this).val(); // 값의 양쪽 공백을 제거하여 빈 문자열인지 확인
		        if (value != "") { // 빈 문자열이 아닐 경우에만 배열에 추가
		            list.push(value);
		        }
		    });
		    console.log(list);

		    $.ajax({
		        type: "POST",
		        url: "show.popw",
		        contentType: "application/json",
		        data: JSON.stringify(list),
		        success: function(response) {
		        	console.log(1)
		        	$("#usrPopTable tr").remove();
		        },
		        error: function(xhr, status, error) {
		            console.error("데이터 전송 실패");
		            console.error(xhr, status, error);
		        }
		    });
		
		    
		    
		    
		    

		    return false;
		}
		
	</script>


</body>
</html>