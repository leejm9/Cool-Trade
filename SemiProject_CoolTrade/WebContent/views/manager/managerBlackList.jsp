<%@page import="java.util.ArrayList"%>
<%@page import="com.cooltrade.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

	<style>
		#searchBtn1{
			margin-bottom:5px;
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
                            <h6 class="m-0 font-weight-bold text-primary">블랙리스트 조회</h6>
                        </div>
                        <div class="card-body">
	                        <div id="searchBtn">
		                        <div id="searchBtn1">
			                        <form action="<%= contextPath %>/blacklist.in?cpage=1">
			                        <input type="text" id="bsearchForm" name="bsearch">
			                        <button type="submit" style="border-color:white;" >검색</button>
			                        </form>
		                        </div>
	                        </div>
	                        
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원번호</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>경고횟수</th>
                                            <th>복구/추방</th>
                                            
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.isEmpty()){ %>
						                <tr>
						                    <td colspan="6">조회된 게시글이 없습니다</td>
						                </tr>
										<% }else{ %>
	                                    	<% for(Member m : list){ %>
		                                        <tr>
		                                            <td><%= m.getUserNo() %></td>
		                                            <td><a href="<%= contextPath %>/memInfo.detail?cpage=2&uno=<%= m.getUserNo() %>"><%= m.getUserId() %></a></td>
		                                            <td><a href="<%= contextPath %>/memInfo.detail?cpage=2&uno=<%= m.getUserNo() %>"><%= m.getUserName() %></a></td>
		                                            <td><%= m.getCaution() %></td>
		                                            <% if(m.getUserStatus().equals("Y")){ %>
		                                            <td class="no-hover"><button onclick="btn1(<%= m.getUserNo() %>);" style="background-color: rgb(203, 22, 22); border: none;">추방</button></td>
		                                       		<% }else if(m.getUserStatus().equals("N")) { %>
		                                       		<td class="no-hover"><button onclick="btn2(<%= m.getUserNo() %>);" style="background-color: rgb(86, 190, 234); border: none;">복구</button></td>
		                                       		<% } %>
		                                        </tr>
                                        	<% } %>
                                    	<% } %>
                                    </tbody>
                                </table>
                                <script>
							        function btn1(userNo){
							                $.ajax({
							                	url:"delete.me",
							                	data:{uno:userNo},
							                	success:function(result){
							                		$(this).css("backgroundColor","rgb(86, 190, 234)");
									                $(this).html("복구");
									                $(this).attr("onclick","btn2(" +userNo + ");");
									                location.reload();
							                	},error:function(){
							                		console.log("ajax 통신 실패");
							                	}
							                })
							        }
							        function btn2(userNo){
							            	$.ajax({
							                	url:"recovery.me",
							                	data:{uno:userNo},
							                	success:function(result){
							                		$(this).css("backgroundColor","rgb(203, 22, 22)");
							                		$(this).html("추방") ;
							                		$(this).attr("onclick","btn1(" +userNo + ");");
							                		location.reload();
							                	},error:function(){
							                		console.log("ajax 통신 실패");
							                	}
							                })
							        }        
							    </script>
                                
                                
                                <div id="btn" align="center">
	                                <% if(startPage!=1){ %>
				                    <button onclick="location.href='<%= contextPath%>/blacklist.in?cpage='+ (parseInt('<%= currentPage %>') - 1)">&lt;</button>
				                    <% } %>
				                    <% for(int i = startPage; i<=endPage; i++){ %>
				                    <%if(i == currentPage){ %>
					                     <button disabled><%=i%></button>
				                	<%}else{%>
						            <button onclick="location.href='<%= contextPath %>/blacklist.in?cpage=' + <%= i %>+'&bsearch=<%= request.getParameter("bsearch") %>';"><%= i %></button>
						            <% } %>
						            <% } %>
						            <% if(endPage != maxPage) { %>
						            <button onclick="location.href='<%= contextPath%>/blacklist.in?cpage='+ (parseInt('<%= currentPage %>') + 1)">&gt;</button>
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