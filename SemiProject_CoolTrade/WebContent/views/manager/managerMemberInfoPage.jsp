<%@page import="com.cooltrade.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cooltrade.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
    	#searchBtn{
    		display:flex;
    		margin-bottom:5px;
    	}
    	#searchBtn2 {
   		 	margin-left: auto; /* #searchBtn1 영역을 왼쪽으로 밀어냄 */
   		 	display:flex;
		}
		#dataTable tbody tr:hover{
			background-color:rgb(211, 211, 211);
			cursor:pointer;
		}
		
    </style>

</head>

<body id="page-top">

   <%@ include file = "../common/managerMenubar.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">관리자 페이지</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 조회 테이블</h6>
                        </div>
                        <div class="card-body">
                        <div id="searchBtn">
	                        <div id="searchBtn1">
		                        <form action="<%= contextPath %>/member.in?cpage=1">
		                        <input type="text" id="searchForm" name="search">
		                        <button type="submit" style="border-color:white;" onclick="return memSearch();">검색</button>
		                        </form>
	                        </div>
	                        <div id="searchBtn2" style="float:right; ">
	                        	<select id="memDropDown">
	                        		<option value="1" selected>최신순</option>
	                        		<option value="2">온도10도이하만</option>
	                        		<option value="3">쿨거래사용자만</option>
	                        	</select>
	                        </div>
                        </div>
                        
                        <script>
                        $(document).ready(function(){
    					    $('#memDropDown').change(function(){
    					        var selectedValue = $('#memDropDown').val();
    					        location.href = '<%= contextPath %>/member.in?cpage=1&dropDownValue=' + selectedValue;
        					    
    					    });
    					     // 페이지가 로드될 때 현재 선택된 드롭다운 값으로 설정
    					    var currentDropDownValue = '<%= request.getParameter("dropDownValue") %>';
    					    $('#memDropDown').val(currentDropDownValue);
    					    
    					});
                        	
						</script>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>가입날짜</th>
                                            <th>신뢰점수</th>
                                            <th>회원등급</th>
                                            <th>경고횟수</th>
                                            <th>등급변경</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<% if(list.isEmpty()){ %>
						                <tr>
						                    <td colspan="8" align="center">조회된 게시글이 없습니다</td>
						                </tr>
										<% }else{ %>
	                                    	<% for(Member m : list){ %>
	                                    		
		                                        <tr>
		                                            <td><%= m.getUserNo() %></td>
		                                            <td><a href="<%= contextPath %>/memInfo.detail?cpage=1&uno=<%= m.getUserNo() %>"><%= m.getUserId() %></a></td>
		                                            <td><a href="<%= contextPath %>/memInfo.detail?cpage=1&uno=<%= m.getUserNo() %>"><%= m.getUserName() %></a></td>
		                                            <td><%= m.getEnrollDate() %></td>
		                                            <td><%= m.getOndo() %></td>
		                                            <td>
		                                            	<% if( m.getUserLevel().equals("C")){ %>
		                                            		쿨거래사용자
		                                            	<% }else if(m.getUserLevel().equals("U")){ %>
		                                            		일반사용자
		                                            	<% }else if(m.getUserLevel().equals("B")){ %>
		                                            		블랙리스트
		                                            	<% }else{ %>
		                                            		관리자
		                                            	<% } %>
		                                            </td>
		                                            <td><%= m.getCaution() %></td>
		                                            <td align="center">
		                                            <% if(m.getOndo()<= 10.0f) { %>
		                                            	<% if("C".equals(m.getUserLevel())) {%>
		                                            		<button class="btn btn-primary" disabled>쿨거래사용자</button>
		                                            	<% }else{ %>
		                                            		<button onclick="coolTrade(<%= m.getUserNo() %>,<%= currentPage %> ,this);" class="btn btn-primary">쿨거래</button>
		                                            	<% } %>
		                                            <% } %>
		                                            </td>
		                                        </tr>
		                                        
                                        	<% } %>
                                    	<% } %>
                                    </tbody>
                                </table>
                                
                                <script>
                                	function coolTrade(userNo,currentPage,button){
                                		var btn = $(button); 
                                		$.ajax({
                                			url:"ctbutton.in",
                                			data:{uno:userNo},
                                			success:function(result){
                                				if(result == 1){
                                					btn.prop("disabled",true);
                                       				btn.text("쿨거래사용자");
                                       				btn.parents('tr').find('td:eq(5)').text('쿨거래사용자');
                                				}
                                			}, error:function(){
                                				console.log("ajax 통신 실패");
                                			}
                                			
                                			
                                		})
                                	}
                                </script>
                                
                                <div id="btn" align="center">
                                <% if(request.getParameter("search") != null) {%>
	                                <% if(currentPage > 1){ %>
				                    <button onclick="location.href='<%= contextPath%>/member.in?cpage='+ (parseInt('<%= currentPage %>') - 1)+'&dropDownValue=' + $('#memDropDown').val()+'&search=' + <%= request.getParameter("search") %>;">&lt;</button>
				                    <% } %>
				                    <% for(int i=1; i<= maxPage;i++){ %>
						            <button onclick="location.href='<%= contextPath %>/member.in?cpage=<%= i %>&search=<%= request.getParameter("search") %>';"><%= i %></button>
						            <% } %>
						            <% if(currentPage != maxPage) { %>
						            <button onclick="location.href='<%= contextPath%>/member.in?cpage='+ (parseInt('<%= currentPage %>') + 1)+'&dropDownValue=' + $('#memDropDown').val()+'&search=' + <%= request.getParameter("search") %>;">&gt;</button>
									<% } %> 
								<% }else{ %>
									<% if(currentPage > 1){ %>
				                    <button onclick="location.href='<%= contextPath%>/member.in?cpage='+ (parseInt('<%= currentPage %>') - 1)+'&dropDownValue=' + $('#memDropDown').val();">&lt;</button>
				                    <% } %>
				                    <% for(int i=1; i<= maxPage;i++){ %>
						            <button onclick="location.href='<%= contextPath %>/member.in?cpage=<%= i %>&dropDownValue=' + $('#memDropDown').val();"><%= i %></button>
						            <% } %>
						            <% if(currentPage != maxPage) { %>
						            <button onclick="location.href='<%= contextPath%>/member.in?cpage='+ (parseInt('<%= currentPage %>') + 1)+'&dropDownValue=' + $('#memDropDown').val();">&gt;</button>
									<% } %> 
								<% } %>
								</div>

                            </div>
                        </div>
                    </div>
					
					
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>



    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>