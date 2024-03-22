<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cooltrade.report.model.vo.Report"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cooltrade.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cooltrade.member.model.vo.Member"%>


<%
	int enrollMember = (int)request.getAttribute("enrollMember");
	Product salesRate = (Product)request.getAttribute("salesRate");
	Product reportedProduct = (Product)request.getAttribute("reportedProduct");
	Product stockGoods = (Product)request.getAttribute("stockGoods");
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("recentReport");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.css" rel="stylesheet">

</head>
<body>
	<%@ include file="../common/managerMenubar.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">관리자 페이지</h1>
		</div>

		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-primary text-uppercase mb-1">
									오늘 가입한 회원수</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"><%= enrollMember%>명</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-calendar fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-success text-uppercase mb-1">
									오늘 누적 판매량</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"
									id="numberInput">
									<% DecimalFormat formatter = new DecimalFormat("#,###");
							        String formattedNumber = formatter.format(salesRate.getSalesRate()); %>
									<%= formattedNumber %>원
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-success text-uppercase mb-1">
									오늘 신고된 게시물 수</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"><%=reportedProduct.getReportedProduct()%>건
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-primary text-uppercase mb-1">
									오늘 등록된 상품수</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800"><%=stockGoods.getTstockgoods()%>건
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-calendar fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

		<!-- Content Row -->

		<div class="row">

			<!-- Area Chart -->
			<div class="card shadow mb-4" style="width:1030px; height:700px; margin-left:12px;">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">최근 일주일 판매실적</h6>
				</div>
				<div class="card-body">
					<div class="chart-area" style="width:100%; height:100%;">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>

			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

			<script>
				// Area Chart Example
				$.ajax({
					url : 'salesgraph.me',
					method : 'GET',
					data : {chart:1},
					success : function(data) {
						console.log(data);

						var value = [];
						var days = [];
						for (var i = 0; i < data.length; i++) {
							value.push(data[i].price);
							days.push(data[i].monthSales);
						}

						console.log(value);

						var ctx = document
								.getElementById("myAreaChart");
						var myLineChart = new Chart(
								ctx,
								{
									type : 'line',
									data : {
										labels : days,
										datasets : [ {
											label : "Earnings",
											lineTension : 0.3,
											backgroundColor : "rgba(78, 115, 223, 0.05)",
											borderColor : "rgba(78, 115, 223, 1)",
											pointRadius : 3,
											pointBackgroundColor : "rgba(78, 115, 223, 1)",
											pointBorderColor : "rgba(78, 115, 223, 1)",
											pointHoverRadius : 3,
											pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
											pointHoverBorderColor : "rgba(78, 115, 223, 1)",
											pointHitRadius : 10,
											pointBorderWidth : 2,
											data : value,
										} ],
									},
									options : {
										maintainAspectRatio : false,
										layout : {
											padding : {
												left : 10,
												right : 25,
												top : 25,
												bottom : 0
											}
										},
										scales : {
											xAxes : [ {
												time : {
													unit : 'date'
												},
												gridLines : {
													display : false,
													drawBorder : false
												},
												ticks : {
													maxTicksLimit : 7
												}
											} ],
											yAxes : [ {
												ticks : {
													maxTicksLimit : 4,
													padding : 10,
													callback : function(
															value,
															index,
															values) {
														return '$'
																+ number_format(value);
													}
												},
												gridLines : {
													color : "rgb(234, 236, 244)",
													zeroLineColor : "rgb(234, 236, 244)",
													drawBorder : false,
													borderDash : [ 2 ],
													zeroLineBorderDash : [ 2 ]
												}
											} ],
										},
										legend : {
											display : false
										},
										tooltips : {
											backgroundColor : "rgb(255,255,255)",
											bodyFontColor : "#858796",
											titleMarginBottom : 10,
											titleFontColor : '#6e707e',
											titleFontSize : 14,
											borderColor : '#dddfeb',
											borderWidth : 1,
											xPadding : 15,
											yPadding : 15,
											displayColors : false,
											intersect : false,
											mode : 'index',
											caretPadding : 10,
											callbacks : {
												label : function(
														tooltipItem,
														chart) {
													var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
															|| '';
													return datasetLabel
															+ ': $'
															+ number_format(tooltipItem.yLabel);
												}
											}
										}
									}
								});
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			</script>



			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5" >
				<div class="card shadow mb-4" style="width:550px; height:450px;">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">최근신고된 게시물</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-pie pt-4 pb-2">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<td>신고종류</td>
										<td>게시물제목</td>
										<td>게시글작성자</td>
										<td>신고일자</td>
									
									</tr>
								</thead>
								<tbody>
									<% for(Report p : list){ %>
									<tr>
										<td><%= p.getReportTypeNo() %></td>
										<td><%= p.getProductTitle() %></td>
										<td><%= p.getSeller() %></td>
										<td><%= p.getReportDate() %></td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>




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


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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

</body>

</html>