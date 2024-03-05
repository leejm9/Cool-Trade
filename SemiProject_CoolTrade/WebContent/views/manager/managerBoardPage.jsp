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
<head>

    <title>SB Admin 2 - Dashboard</title>
	
	<style>
		#searchBtn2{
			margin-bottom:5px;
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
                            <h6 class="m-0 font-weight-bold text-primary">게시물 조회</h6>
                        </div>
                        <div class="card-body">
                        	 <div id="searchBtn">
		                        <div id="searchBtn2">
			                        <form action="<%= contextPath %>/board.in?cpage=1">
			                        <input type="text" id="boardForm" name="boardsearch">
			                        <button type="submit" style="border-color:white;" >검색</button>
			                        </form>
		                        </div>
	                        </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>제목</th>
                                            <th>회원 번호</th>
                                            <th>판매자 이름</th>
                                            <th>판매자 경고횟수</th>
                                            <th>등록일자</th>
                                            <th>복구/삭제</th>
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
		                                            <td><%= m.getProductTitle() %></td>
		                                            <td><%= m.getUserNo() %></td>
		                                            <td><%= m.getUserName() %></td>
		                                            <td><%= m.getCaution() %></td>
		                                            <td><%= m.getUploadDate() %></td>
		                                            <td><button>삭제</button></td>
		                                        </tr>
                                        	<% } %>
                                    	<% } %>
                                    </tbody>
                                </table>
                                
                                <div id="btn" align="center">
	                                <% if(currentPage > 1){ %>
				                    <button onclick="location.href='<%= contextPath%>/board.in?cpage='+ (parseInt('<%= currentPage %>') - 1)">&lt;</button>
				                    <% } %>
				                    <% for(int i=1; i<= maxPage;i++){ %>
						            <button onclick="location.href='<%= contextPath %>/board.in?cpage=' + <%= i %>+'&boardsearch=<%= request.getParameter("boardsearch") %>';"><%= i %></button>
						            <% } %>
						            <% if(currentPage != maxPage) { %>
						            <button onclick="location.href='<%= contextPath%>/board.in?cpage='+ (parseInt('<%= currentPage %>') + 1)">&gt;</button>
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