<%@page import="com.cooltrade.common.PageInfo"%>
<%@page import="com.cooltrade.report.model.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
	System.out.print(list);
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file = "../common/managerMenubar.jsp" %>
    
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">관리자 페이지</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">신고 조회</h6>
                        </div>
                        <div class="card-body">
	                        
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>신고번호</th>
                                            <th>신고자</th>
                                            <th>신고게시물</th>
                                            <th>신고유형</th>
                                            <th>신고날짜</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% if(list.isEmpty()){ %>
						                <tr>
						                    <td colspan="7">조회된 게시글이 없습니다</td>
						                </tr>
										<% }else{ %>
	                                    	<% for(Report r : list){ %>
		                                        <tr>
		                                            <td><%= r.getReportNo() %></td>
		                                            <td><%= r.getReporter() %></td>
		                                            <td><a href="<%= contextPath %>/detail.po?pno=<%= r.getProdNo()%>"><%= r.getProductTitle() %></a></td>
		                                            <td><%= r.getReportTypeNo() %></td>
		                                            <td><%= r.getReportDate() %></td>
		                                            <td><input type="button" class="btn btn-primary" value="상세보기" onclick="location.href='<%= contextPath %>/report.detail?rno=<%= r.getReportNo() %>'">
		                                            <td><input type="button" onclick="Report(<%= r.getReportNo() %>,<%=r.getProdNo() %>);" class="btn btn-danger" value="신고처리"></td>
		                                        </tr>
                                        	<% } %>
                                    	<% } %>
                                    </tbody>
                                </table>
                                <script>
							        function Report(reportNo,pno){
							                $.ajax({
							                	url:"report.ch",
							                	data:{reportNo:reportNo,
							                		  pno:pno},
							                	success:function(result){
							                		if(result > 0){
							                			alert("신고처리되었습니다");
							                			location.reload();
							                		}
							                	},error:function(result){
							                		console.log("ajax 통신 실패");
							                	}
							                })
							        }
							      
							    </script>
                                
                                <div id="btn" align="center">
	                                <% if(startPage!=1){ %>
				                    <button onclick="location.href='<%= contextPath%>/report.in?cpage='+ (parseInt('<%= currentPage %>') - 1)">&lt;</button>
				                    <% } %>
				                    <% for(int i = startPage; i<=endPage; i++){ %>
				                    <%if(i == currentPage){ %>
					                     <button disabled><%=i%></button>
				                	<%}else{%>
						            <button onclick="location.href='<%= contextPath %>/report.in?cpage=' + <%= i %>+'&bsearch=<%= request.getParameter("bsearch") %>';"><%= i %></button>
						            <% } %>
						            <% } %>
						            <% if(endPage != maxPage) { %>
						            <button onclick="location.href='<%= contextPath%>/report.in?cpage='+ (parseInt('<%= currentPage %>') + 1)">&gt;</button>
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